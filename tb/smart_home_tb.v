`timescale 1ns/1ps

module smart_home_tb;

reg clk;
reg reset;

reg motion_sensor;
reg dark_sensor;
reg temp_high;
reg door_open;
reg manual_override;
reg security_mode;

wire light;
wire fan;
wire ac;
wire alarm;
wire energy_save;

smart_home_controller DUT(
    .clk(clk),
    .reset(reset),
    .motion_sensor(motion_sensor),
    .dark_sensor(dark_sensor),
    .temp_high(temp_high),
    .door_open(door_open),
    .manual_override(manual_override),
    .security_mode(security_mode),
    .light(light),
    .fan(fan),
    .ac(ac),
    .alarm(alarm),
    .energy_save(energy_save)
);

// Clock generation
always #5 clk = ~clk;

initial
begin

    $dumpfile("home.vcd");
    $dumpvars(0, smart_home_tb);

    clk = 0;
    reset = 1;

    motion_sensor = 0;
    dark_sensor = 0;
    temp_high = 0;
    door_open = 0;
    manual_override = 0;
    security_mode = 0;

    #20;
    reset = 0;

    // Test 1 : Motion + Dark
    #20;
    motion_sensor = 1;
    dark_sensor = 1;

    #40;

    // Test 2 : Temperature High
    temp_high = 1;

    #40;

    // Test 3 : Security Alarm
    security_mode = 1;
    door_open = 1;

    #40;

    // Test 4 : Manual Override
    security_mode = 0;
    door_open = 0;
    manual_override = 1;

    #40;

    // Test 5 : Energy Saving
    manual_override = 0;
    motion_sensor = 0;
    dark_sensor = 0;
    temp_high = 0;

    #50;

    $finish;

end

endmodule