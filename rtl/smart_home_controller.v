module smart_home_controller(
    input wire clk,
    input wire reset,

    input wire motion_sensor,
    input wire dark_sensor,
    input wire temp_high,
    input wire door_open,
    input wire manual_override,
    input wire security_mode,

    output reg light,
    output reg fan,
    output reg ac,
    output reg alarm,
    output reg energy_save
);

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        light <= 0;
        fan <= 0;
        ac <= 0;
        alarm <= 0;
        energy_save <= 0;
    end
    else
    begin

        // Default values
        light <= 0;
        fan <= 0;
        ac <= 0;
        alarm <= 0;
        energy_save <= 0;

        // Highest Priority: Security Alarm
        if(security_mode && door_open)
        begin
            alarm <= 1;
        end

        // Manual Override
        else if(manual_override)
        begin
            light <= 1;
            fan <= 1;
        end

        // Automatic Lighting
        else if(motion_sensor && dark_sensor)
        begin
            light <= 1;
        end

        // Temperature Control
        if(temp_high)
        begin
            fan <= 1;
            ac <= 1;
        end

        // Energy Saving
        if(!motion_sensor)
        begin
            energy_save <= 1;
        end

    end
end

endmodule