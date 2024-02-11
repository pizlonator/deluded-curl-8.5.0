#!/usr/bin/env ruby

Dir.glob("**/*.[ch]") {
    | filename |
    contents = IO::read(filename)
    #contents.gsub!(/OPENSSL_zalloc\(sizeof\(\*([a-zA-Z0-9_]+)\)\)/) {
    #    | match |
    #    "zalloc_zero(typeof(*#{$1}), 1)"
    #}
    #contents.gsub!(/OPENSSL_zalloc\(sizeof\(([a-zA-Z0-9_]+)\)\)/) {
    #    | match |
    #    "zalloc_zero(#{$1}, 1)"
    #}
    #contents.gsub!(/OPENSSL_malloc\(sizeof\(\*([a-zA-Z0-9_]+)\)\)/) {
    #    | match |
    #    "zalloc(typeof(*#{$1}), 1)"
    #}
    #contents.gsub!(/malloc\(sizeof\(([a-zA-Z0-9_]+)\)\)/) {
    #    | match |
    #    "zalloc(#{$1}, 1)"
    #}
    #contents.gsub!(/malloc\(sizeof\(struct ([a-zA-Z0-9_]+)\)\)/) {
    #    | match |
    #    "zalloc(struct #{$1}, 1)"
    #}
    #contents.gsub!(/calloc\(1, sizeof\(struct ([a-zA-Z0-9_]+)\)\)/) {
    #    | match |
    #    "zalloc_zero(struct #{$1}, 1)"
    #}
    #contents.gsub!(/malloc\((.*) \* sizeof\(struct ([a-zA-Z0-9_]+)\)\)/) {
    #    | match |
    #    "zalloc(struct #{$2}, #{$1})"
    #}
    #contents.gsub!(/calloc\(1, sizeof\(\*([a-zA-Z0-9_]+)\)\)/) {
    #    | match |
    #    "zalloc_zero(typeof(*#{$1}), 1)"
    #}
    contents.gsub!(/calloc\(1, sizeof\(([a-zA-Z0-9_]+)\)\)/) {
        | match |
        "zalloc_zero(typeof(#{$1}), 1)"
    }
    IO::write(filename, contents)
}
