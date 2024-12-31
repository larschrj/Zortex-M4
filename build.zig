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
        .root_source_file = b.path("startup.zig"),
        .single_threaded = true,
        .unwind_tables = .none,
    });
    exe.entry = .{ .symbol_name = "Reset_Handler" };

    const main = b.addObject(.{
        .name = "main",
        .target = target,
        .optimize = mode,
        .root_source_file = b.path("main.zig"),
        .single_threaded = true,
        .unwind_tables = .none,
    });
    exe.addObject(main);

    const core_cm4 = b.addObject(.{
        .name = "core_cm4",
        .target = target,
        .optimize = mode,
        .root_source_file = b.path("core_cm4.zig"),
        .single_threaded = true,
        .unwind_tables = .none,
    });
    exe.addObject(core_cm4);

    const STM32F411RE = b.addObject(.{
        .name = "STM32F411RE",
        .target = target,
        .optimize = mode,
        .root_source_file = b.path("STM32F411RE.zig"),
        .single_threaded = true,
        .unwind_tables = .none,
    });
    exe.addObject(STM32F411RE);

    exe.setLinkerScript(b.path("./STM32F411RETX_FLASH.ld"));

    b.default_step.dependOn(&exe.step);
    b.installArtifact(exe);
}
