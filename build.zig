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

    var exe = b.addExecutable(.{
        .name = "firmware.elf",
        .target = target,
        .optimize = mode,
        .root_source_file = b.path("./startup.zig"),
        .single_threaded = true,
        .unwind_tables = .none,
    });
    exe.entry = .{ .symbol_name = "Reset_Handler" };

    exe.setLinkerScript(b.path("./stm32f411re_flash.ld"));

    b.default_step.dependOn(&exe.step);
    b.installArtifact(exe);
}
