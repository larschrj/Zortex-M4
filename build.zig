const std = @import("std");

pub fn build(b: *std.Build) void {
    const mode = b.standardOptimizeOption(.{});
    const arch = std.Target.Cpu.Arch.thumb;
    const os = std.Target.Os.Tag.freestanding;
    const abi = std.Target.Abi.eabihf;
    const cpumodel = std.Target.arm.cpu.cortex_m4;
    var features = std.Target.Cpu.Feature.Set.empty;
    features.addFeature(@intFromEnum(std.Target.arm.Feature.vfp4d16sp));

    const query = std.Target.Query{
        .cpu_arch = arch,
        .os_tag = os,
        .abi = abi,
        .cpu_model = std.Target.Query.CpuModel{ .explicit = &cpumodel },
        .cpu_features_add = features,
    };
    const target = b.resolveTargetQuery(query);

    // register maps and cortex-m4 functions
    const stm32f411re = b.addModule("stm32f411re", .{
        .root_source_file = b.path("./src/stm32f411re.zig"),
        .target = target,
        .optimize = mode,
    });

    // blinky
    var blinkyRootModule = b.createModule(.{
        .root_source_file = b.path("./examples/blinky/startup.zig"),
        .target = target,
        .optimize = mode,
    });
    blinkyRootModule.addImport("stm32f411re", stm32f411re);
    var blinkyExe = b.addExecutable(.{
        .name = "blinky.elf",
        .root_module = blinkyRootModule,
    });
    blinkyExe.entry = .{ .symbol_name = "Reset_Handler" };
    blinkyExe.setLinkerScript(b.path("./src/stm32f411re_flash.ld"));

    b.default_step.dependOn(&blinkyExe.step);
    b.installArtifact(blinkyExe);

    // roundRobin
    var roundRobinRootModule = b.createModule(.{
        .root_source_file = b.path("./examples/os/roundRobin/startup.zig"),
        .target = target,
        .optimize = mode,
    });
    roundRobinRootModule.addImport("stm32f411re", stm32f411re);
    var roundRobinExe = b.addExecutable(.{
        .name = "roundRobin.elf",
        .root_module = roundRobinRootModule,
    });
    roundRobinExe.entry = .{ .symbol_name = "Reset_Handler" };
    roundRobinExe.setLinkerScript(b.path("./src/stm32f411re_flash.ld"));

    b.default_step.dependOn(&roundRobinExe.step);
    b.installArtifact(roundRobinExe);
}
