pub const packages = struct {
    pub const @"12200a997e374007b533627b4d2cb8cfde086a5e082d89921c81d77e1501a5b7278e" = struct {
        pub const build_root = "C:\\Users\\nicol\\AppData\\Local\\zig\\p\\12200a997e374007b533627b4d2cb8cfde086a5e082d89921c81d77e1501a5b7278e";
        pub const build_zig = @import("12200a997e374007b533627b4d2cb8cfde086a5e082d89921c81d77e1501a5b7278e");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
        };
    };
    pub const @"122095b1af33a2fbe87af9365516e6c2d21f9f5a6725b539e03bcc6ed8df3c012f39" = struct {
        pub const build_root = "C:\\Users\\nicol\\AppData\\Local\\zig\\p\\122095b1af33a2fbe87af9365516e6c2d21f9f5a6725b539e03bcc6ed8df3c012f39";
        pub const build_zig = @import("122095b1af33a2fbe87af9365516e6c2d21f9f5a6725b539e03bcc6ed8df3c012f39");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
        };
    };
};

pub const root_deps: []const struct { []const u8, []const u8 } = &.{
    .{ "network", "122095b1af33a2fbe87af9365516e6c2d21f9f5a6725b539e03bcc6ed8df3c012f39" },
    .{ "webview", "12200a997e374007b533627b4d2cb8cfde086a5e082d89921c81d77e1501a5b7278e" },
};
