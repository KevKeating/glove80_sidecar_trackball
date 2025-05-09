include <BOSL2/std.scad>
include <BOSL2/rounding.scad>
include <BOSL2/screws.scad>

$fn = $preview ? 16 : 48 * 4;
// $fn = $preview ? 16 : 28 * 4;
EXTRA = 0.01 + 0;

/* [Object visibility] */
show_top_shell = true;
show_bottom_shell = false;
show_mouse_buttons_shell = false;
show_mouse_buttons_back_wall = false;
show_mouse_buttons_upper_pcb_holder = false;
show_rear_wall = false;
show_side_wall = false;
show_pcb_clips = false;
show_trackball_holder = false;
show_trackball_holder_pcb_mount = false;
show_battery_compartment_cover = false;
// The foot for the leg that's screwed into a heat set threaded insert
show_foot = false;
// The cover for the connection light.  Gets screwed into the side wall after printing
show_light_cover = false;

// Displays the trackball itself (turn off before exporting)
show_trackball = false;
// Display a rough approximation of the where the PCB for the buttons switches will be (turn off before exporting)
show_mouse_buttons_pcb_placeholder = false;
show_static_bearing_fit_test = false;

/* [Common settings] */
// The size of the trackball.  Set to 34 to use the trackball included with the M575
trackball_diameter = 55; //[34:1:55]
trackball_z_offset = 3;
// The diameter of the opening for the static bearings. This should be slightly larger (~0.15 mm) than the actual diameter of the bearings to allow the bearings to fit inside
static_bearing_diameter = 2.725;
// How high the top of the static bearing sits above the trackball holder
static_bearing_exposed_height = 0.51; //[0:0.05:1.5]
// The thickness of the top shell, which also controls how far down the trackball's center is
top_shell_thickness = 2.5;

// TODO: add documentation for these
/* [Mouse button shape] */
mouse_buttons_straight_width = 14;
mouse_buttons_angled_width = 9;
mouse_button_curve_rounding = 20;
mouse_button_top_and_bottom_rounding = 1.5;
mouse_button_thickness = 1.5;
mouse_buttons_additional_height = 8.25;
height_past_left_mouse_button = 5;

/* [Screw and threaded insert sizing] */
// The outer diameter of the m4 threaded insert used to secure the leg
leg_threaded_insert_od = 6;
// The length of the m4 threaded insert used to secure the leg
leg_threaded_insert_length = 8;
// The type of screw used to hold all the parts together
assembly_screw_type = "m2.5";
// The length of screw used to hold all the parts together
assembly_screw_length = 8;

/* [Threading slop] */
// Increase (or decrease) these values slightly if the threading is too tight (or loose) for the screw
assembly_screw_slop = 0.1025;
foot_screw_slop = 0.115;
// The screws for mounting the PCB with the button switches
mouse_button_screw_slop = 0.105;
// The screws for mounting the PCB with the trackball sensor
sensor_pcb_screw_slop = 0.03;
// the screws for connecting the trackball to the Glove80
sidecar_screw_hole_slop = 0.1;
connection_light_screw_slop = 0.08;

/* [Hidden] */
trackball_holder_wall_thickness = 2.25;
bottom_floor_thickness = 2.5;
wall_thickness = 2.4;
sidecar_upper_length_top = 77;
sidecar_upper_length_bottom_delta = 1.64766226;
sidecar_angled_portion_height = 18.41204006;
sidecar_lower_straight_length_top = 13.74439678;
sidecar_lower_straight_length_bottom = 9.0162589;
sidecar_lower_straight_length_outer = 13.75;
sidecar_angle = 116.881;
case_height = 47.5;
top_shell_rim_height = 2.5;
top_shell_rim_thickness = 1.5;
top_shell_trackball_clearance = 1.5;
top_shell_rim_radial_clearance = 0; //0.05;
// TODO: implement this
top_shell_rim_axial_clearance = 1.5;
thumb_cluster_lower_brace_width = 20;
thumb_cluster_lower_brace_thickness = 1.5;
thumb_cluster_lower_brace_chamfer = 4;

sidecar_arc_radius_top = 106.93109836;
sidecar_arc_radius_bottom = 110.42994393;
sidecar_arc_angle_bottom = 25.3165577045166976742;
sidecar_arc_angle_top = sidecar_arc_angle_bottom;


top_x_offset = 6.01926525;

trackball_center_nudge_x = 3.35;
trackball_center_nudge_y = 3.5;

lower_sidecar_mount_z_offset_top = 14.267;
lower_sidecar_mount_straight_length_top = 10.088;
lower_sidecar_mount_straight_length_top_outer = 4.26756633;
lower_sidecar_mount_straight_length_bottom = 9.55464375;
lower_sidecar_mount_straight_length_bottom_outer = 3.51383955;
lower_sidecar_mount_delta_y = 13.32323;
lower_sidecar_mount_delta_z = 0.5;
sidecar_mount_thickness = 2.4;

upper_sidecar_sphere_center = [68.6246, -26, 85.7375];
upper_sidecar_sphere_radius = 114.27537;
upper_sidecar_screw_hole_offset = [3.26442536, -18.99521386, -6.8];
upper_sidecar_upper_back_inner_corner_coords = [top_x_offset - 2.956, 40.5, -9.0997];
sidecar_screw_carve_out_diameter = 6;
sidecar_screw_carve_out_straight_width = 9;
sidecar_screw_carve_out_bottom_scale = 2;
sidecar_screw_carve_out_straight_length = 17;
sidecar_screw_carve_out_wall_thickness = 1.5;

sidecar_upper_length_bottom = sidecar_upper_length_top - sidecar_upper_length_bottom_delta;

glove80_thumb_cluster_length = 52.5;
sidecar_outer_edge_chamfer = 0.6;

mouse_buttons_additional_length = 25;
side_wall_offset_from_mouse_buttons_end = 2.5;
mouse_buttons_shell_segments_per_arc = min($fn / 4, 48);
mouse_buttons_rim_width = 2;

mouse_buttons_and_wheel_x_offset = 40;
// how many mm from the left edge of the mouse button PCB to the gap between the
// mini button switches (i.e. buttons 4 and 5) and the left button switch
left_button_switch_mini_button_switch_x = 6.5;
mouse_buttons_pcb_x_rotate = 90;
mouse_buttons_pcb_y_offset = mouse_buttons_additional_height - wall_thickness - mouse_button_thickness;
mouse_buttons_pcb_z_offset = 3.75;
// the distance from the center of the mouse wheel to the left-click switch
// side of the PCB
mouse_buttons_pcb_x_offset = 28.5;
mouse_buttons_back_thickness = 1.5;
mouse_button_palm_end_droop = 8;

mouse_button_screw_type = "m2";
mouse_button_screw_hole_length = 5;
mouse_button_peg_diameter = 1.45;
mouse_button_peg_clearance = 0.5;
mouse_button_upper_peg_height = 3.2;
mouse_wheel_opening_width = 11.25;
mouse_wheel_rounding = 3.5;
mouse_wheel_elevation = 9;
mouse_wheel_opening_radius = 14.5;
mouse_wheel_pcb_x = 28.25;
mouse_wheel_pcb_y = -12.25;
mouse_buttons_pcb_thickness = 1.75;
mouse_button_pad_elevation = 7;
mouse_button_mini_pad_reduced_elevation = 1.5;
mouse_button_main_pad_width = 5;
mouse_button_mini_pad_width = 3;
mouse_button_cutout_width = 0.65;
mouse_button_length = 50;
mouse_button_width = 20;
mouse_button_width_left = mouse_button_width;
mouse_button_width_right = 14;
mouse_button_rounding = 4;
width_between_mouse_buttons = 2.5;
mini_mouse_button_length = 23;
mouse_wheel_mount_width = 12;
mouse_wheel_mount_height = 14;
mouse_wheel_mount_length_from_center = 13;
mouse_wheel_mount_cover_width = 1.25;
mouse_wheel_mount_cover_width_thin = 0.75;
mouse_wheel_mount_cover_top_thickness = 1.0;
mouse_wheel_mount_cover_clearance = 0.3;
mouse_wheel_mount_cover_clearance_from_wheel = 1.25;
mouse_wheel_mount_cover_side_rounding = 1;
mouse_wheel_mount_cover_top_rounding = 2;

mouse_wheel_switch_width = 8;
mouse_wheel_switch_length_from_center = 16;
mouse_wheel_switch_height = 12.5;
// shifts give distance over 10 mm of height
mouse_button_left_pad_shift = 0;
// mouse_button_left_pad_horizontal_shift = 12;
mouse_button_right_pad_shift = 10;
mouse_button_lower_mini_pad_shift = -8;
mouse_buttons_pcb_peg_and_screw_hole_upper_coords = [39, -4.25];
mouse_buttons_pcb_peg_and_screw_hole_lower_coords = [19.5, -29];
mouse_buttons_pcb_screw_hole_without_peg_coords = [17, -2.25];
mouse_buttons_pcb_wall_height = 32.5;
mouse_buttons_pcb_wall_cable_passthrough_height = 6;
mouse_buttons_pcb_wall_cable_passthrough_width = 13;
mouse_buttons_pcb_wall_cable_passthrough_x_offset = 4;

mouse_buttons_upper_pcb_holder_thickness = 2;
mouse_buttons_upper_pcb_holder_width = 5;
mouse_buttons_upper_pcb_holder_elevation_above_pcb = 1.5;

// The maximum allowed internal width for the battery compartment.  The
// compartment *may* be narrower than this if the case is not wide enough.
battery_compartment_max_internal_width = 57;
battery_terminal_thickness = 0.5;
battery_terminal_height = 11.75;
battery_terminal_width = 14.5;
battery_terminal_divider_wall_thickness = 0.75;
battery_terminal_divider_wall_width = 2.25;
battery_terminal_dimple_height = 5;
battery_terminal_dimple_size = 1.75;
battery_terminal_spring_length = 12.5;
battery_terminal_nub_length = 2.5;
battery_compartment_depth = 17;
battery_compartment_height = 14.75;
battery_compartment_inner_wall_thickness = 2;
battery_compartment_cover_thickness = 1.4;
dongle_holder_depth = 12.25;
dongle_holder_width = 12.3;
dongle_holder_height = 5;
dongle_holder_outer_height = 11;
dongle_holder_top_depth = 8.5;
dongle_holder_x_offset = 6.5;

battery_compartment_cover_floor_thickness = 1.5;
battery_compartment_cover_floor_depth = 7;
battery_compartment_cover_floor_catch_thickness = 2.5;
battery_compartment_cover_chamfer = 1;
// how much wider should the battery compartment receiver be than the battery
// compartment itself
battery_compartment_cover_clearance = 0.1;
// how much space is there below the battery compartment cover so that we can
// push down on the cover to unlatch and remove it
battery_compartment_cover_spacing = 2;
// the chamfer in the upper corners of the cover
battery_compartment_cover_upper_chamfer = 2;
battery_compartment_cover_clip_width = 7.5;
battery_compartment_cover_clip_thickness = 2;
battery_compartment_cover_clip_length = 4;
battery_compartment_cover_clip_mount_length = 3;
battery_compartment_cover_clip_inset = 0.5;
battery_compartment_cover_grip_z_offset = 2.5;
battery_compartment_cover_grip_line_height = 1.5;
battery_compartment_cover_grip_width = 15;
battery_compartment_cover_grip_depth = 0.6;

battery_compartment_total_depth = battery_compartment_depth + battery_compartment_inner_wall_thickness + wall_thickness + battery_compartment_cover_spacing;

trackball_holder_dongle_holder_clearance = 0.15;
trackball_holder_pcb_opening_length = 8.75;
trackball_holder_pcb_opening_width = 7;
trackball_holder_pcb_opening_rounding = 1.5;
trackball_holder_pcb_mounting_dist = 6.75;
sensor_pcb_mounting_height = 3;
sensor_mounting_height = 6;
trackball_holder_split_clearance = 0.01;
sensor_pcb_center_coords = [4, -8];
sensor_pcb_screw_type = "m1.6";
sensor_pcb_screw_hole_length = 3.5;
sensor_pcb_peg_diameter = 1.4;
sensor_pcb_thickness = 2;

trackball_holder_pcb_outer_opening_width = 28;
trackball_holder_pcb_outer_opening_length_past_center = 17;
trackball_holder_pcb_outer_opening_y_offset = -2.5;
trackball_back_bearing_vertical_angle = 60;
trackball_bearing_vertical_angle = 60;
trackball_bearing_opening_diameter = 1.05;
trackball_holder_outer_screw_x_coord = -50;
trackball_holder_outer_front_screw_y_coord = -5;
trackball_holder_screw_plate_thickness = 8.5;
trackball_holder_pcb_mount_split_length = 26.5;

leg_threaded_insert_extra_length = 2;
leg_post_wall_thickness = 2;
leg_post_screw_size = 4;
leg_post_screw_clearance = 0.25;
leg_post_top_thickness = 3;

foot_diameter = 12;
foot_upper_diameter = 10.75;
foot_upper_height = 1.25;
foot_main_height = 6.0;
foot_screw_type = "m4";

foot_screw_hole_base = 2;

assembly_screw_extra_length = 1;

assembly_screw_receiver_diameter = 6.5;
assembly_screw_receiver_rounding = 1;
assembly_screw_head_height_clearance = 0.3;
assembly_screw_head_height = struct_val(
    screw_info(assembly_screw_type, head="button"),
    "head_height") + assembly_screw_head_height_clearance;
assembly_screw_head_diameter = struct_val(
    screw_info(assembly_screw_type, head="button"),
    "head_size") + 0.35;
assembly_screw_diameter = struct_val(screw_info(assembly_screw_type),
                                     "diameter");
// length of the extra threaded length of the assembly screw holes, just in case
// the screw winds up scraping off plastic that accumulates at the bottom
assembly_screw_threading_additional_length = 2.25;
assembly_screw_threading_length = assembly_screw_length - wall_thickness + assembly_screw_threading_additional_length;
assembly_screw_threading_end_length = 1;
assembly_screw_threading_total_length = assembly_screw_threading_length + assembly_screw_threading_end_length;

assembly_screw_upper_side_rear_wall_y_offset = 2;
assembly_screw_lower_side_rear_wall_x_offset = 1.5;
assembly_screw_lower_side_rear_wall_y_offset = 2;
assembly_screw_side_wall_bottom_receiver_width = 5.5;
assembly_screw_bottom_bottom_mouse_shell_offset = 3;
assembly_screw_rear_wall_trackball_holder_x_offset = 2;
assembly_screw_rear_wall_trackball_holder_y_offset = 2;
mouse_buttons_palm_end_assembly_screw_offset = [6, -20];
top_shell_inner_assembly_screw_y = -25;
assembly_screw_upper_front_side_wall_y_offset = 13.5;
assembly_screw_lower_front_side_wall_y_offset = 1.5;
assemblY_screw_bottom_shell_mouse_buttons_back_wall_x = -67.5;
assembly_screw_mouse_buttons_bottom_front_x_offset = 2.25;
assembly_screw_mouse_buttons_bottom_rear_y_offset = 4;
assembly_screw_mouse_buttons_top_front_x_offset = 4;
assembly_screw_mouse_buttons_top_front_z_offset = 8;

light_cover_upper_diameter = 4.5;
light_cover_upper_height = 1;
light_cover_notch_depth = 0.6;
light_cover_notch_width = 0.8;
light_cover_knurling = [2, 1];
light_cover_knurling_cutoff = 0.75;
light_cover_screw_type = "m4";

pcb_bottom_height = 3;
pcb_top_height = 4.45;
pcb_clip_additional_height = 2.75;
pcb_clip_wall_thickness = 1;
pcb_clip_width = 4.5;
pcb_clip_embed_depth = 1.8;
pcb_clip_embed_clearance_x = 0.2;
pcb_clip_embed_clearance_y = 0.07;
pcb_clip_clip_thickness = 1.4;
pcb_support_wall_thickness = 1.25;
pcb_support_dist_past_edge = 2.5;
pcb_support_dist_past_edge_bottom = 2.25;
pcb_support_height_past_top = 2.5;
main_pcb_y_offset = 3;
main_pcb_z_offset = -24.5;
main_pcb_rotation = -34;
connection_button_peg_diameter = 1.5;
connection_button_peg_clearance = 1.0;
connection_button_pip_clearance = 0.6;
connection_button_diameter_difference = 0.75;
connection_button_inner_diameter = 4.5;
connection_button_lower_height = 0.2;
connection_button_hinge_length = 12.5;
connection_button_hinge_height = 1;
connection_button_hinge_base_width = 5.5;
connection_button_hinge_base_length = 3;
connection_button_hinge_clearance = 0.2;

side_wall_top_rim_gap_center_y = 30;
side_wall_top_rim_gap_width = 30;

// Derived values

bottom_path_tat = tangent_arc_tangent(
    sidecar_lower_straight_length_bottom,
    sidecar_angle,
    sidecar_arc_radius_bottom,
    sidecar_arc_angle_bottom,
    sidecar_lower_straight_length_outer + wall_thickness);
thumb_cluster_end_normal = line_normal(list_tail(bottom_path_tat, -2));
thumb_cluster_end_vector = [last(bottom_path_tat), last(bottom_path_tat) + thumb_cluster_end_normal];
thumb_cluster_unit_vector = unit(thumb_cluster_end_vector[1] - thumb_cluster_end_vector[0]);
thumb_cluster_wall_angle = v_theta(thumb_cluster_unit_vector);
thumb_cluster_wall_start = thumb_cluster_end_vector[0] - wall_thickness * thumb_cluster_unit_vector;
mouse_buttons_shell_wall_start = thumb_cluster_end_vector[0] - mouse_buttons_additional_length * thumb_cluster_unit_vector + (wall_thickness - mouse_buttons_back_thickness) * unit(line_normal(thumb_cluster_end_vector));
mouse_buttons_shell_rear_corner = thumb_cluster_end_vector[0] - (mouse_buttons_additional_length + side_wall_offset_from_mouse_buttons_end) * thumb_cluster_unit_vector;
assembly_screw_bottom_shell_mouse_buttons_back_wall_loc = line_intersection(
    thumb_cluster_end_vector,
    [[assemblY_screw_bottom_shell_mouse_buttons_back_wall_x, 0],
     [assemblY_screw_bottom_shell_mouse_buttons_back_wall_x, -50]]);

bottom_path = tangent_arc_tangent_wall(
    sidecar_lower_straight_length_bottom,
    sidecar_angle,
    sidecar_arc_radius_bottom,
    sidecar_arc_angle_bottom,
    thumb_cluster_end_vector,
    upper_length=sidecar_upper_length_bottom);
top_path = move(
    [top_x_offset, -sidecar_upper_length_bottom_delta],
    tangent_arc_tangent_wall(
        sidecar_lower_straight_length_top,
        sidecar_angle,
        sidecar_arc_radius_top,
        sidecar_arc_angle_top,
        translate_thumb_cluster_end_vector([top_x_offset, -sidecar_upper_length_bottom_delta])));

trackball_wall_outer_diameter = trackball_diameter + 2 * (static_bearing_exposed_height + trackball_holder_wall_thickness);
trackball_center_calc_x = -trackball_wall_outer_diameter / 2 - wall_thickness + trackball_center_nudge_x;
trackball_center_min_x = -( wall_thickness + assembly_screw_receiver_diameter / 2 + assembly_screw_diameter / 2 + 1.5 + trackball_holder_pcb_outer_opening_length_past_center);
trackball_center = [
    min(trackball_center_calc_x, trackball_center_min_x),
    (trackball_wall_outer_diameter / 2 + trackball_center_nudge_y) / tan(sidecar_angle / 2),
    -top_shell_thickness - trackball_z_offset];

rear_wall_width = -mouse_buttons_shell_rear_corner.x - 2 * wall_thickness;
leg_post_lower_diameter = leg_threaded_insert_od + 2 * leg_post_wall_thickness;
battery_compartment_cover_height = bottom_floor_thickness + 3 * battery_compartment_inner_wall_thickness + battery_compartment_height + dongle_holder_outer_height;

mouse_buttons_thump_tip_pts = move(
    mouse_buttons_shell_wall_start, 
    [for (i = [0:1 / min($fn, 100):1])
        zrot(
            thumb_cluster_wall_angle + 90 - i * (thumb_cluster_wall_angle + 180),
            [mouse_buttons_shell_path(mouse_buttons_thumb_tip_end_scaling(i), "bottom_x_only"),
                0])]);
filtered_mouse_buttons_thumb_tip_points = [for (pt = mouse_buttons_thump_tip_pts) if (pt.y <= mouse_buttons_shell_rear_corner.y || pt.x <= mouse_buttons_shell_rear_corner.x) pt];

thumb_cluster_divider_wall_vector = wall_thickness * unit(select(bottom_path_tat, -2) - last(bottom_path_tat));
thumb_cluster_end_minus_wall_vector = translate_thumb_cluster_end_vector(-thumb_cluster_divider_wall_vector);

palm_end_length = mouse_buttons_palm_end_scaling(1)[0] * mouse_buttons_straight_width;
straight_shell_length = glove80_thumb_cluster_length + mouse_buttons_additional_length - 0.25 * mouse_buttons_straight_width - palm_end_length;

mouse_buttons_palm_end_pts = move(
    mouse_buttons_shell_wall_start + straight_shell_length * thumb_cluster_unit_vector,
    zrot(
        thumb_cluster_wall_angle + 90,
        [for (i = [0:1 / min($fn, 100):1])
            right(
                mouse_button_thickness,
                zrot(
                    90 * i,
                    [mouse_buttons_shell_path(mouse_buttons_palm_end_scaling(i), "bottom_x_only") - mouse_button_thickness,
                    0]
                ))]));

bottom_shell_wall_end = tangent_arc_tangent_wall(
    sidecar_lower_straight_length_bottom, 
    sidecar_angle,
    sidecar_arc_radius_bottom,
    sidecar_arc_angle_bottom,
    translate_thumb_cluster_end_vector(-thumb_cluster_divider_wall_vector),
    upper_length=sidecar_upper_length_bottom,
    wall_end_only=true);

bottom_shell_wall_end_plus_wall_thickness = tangent_arc_tangent_wall(
    sidecar_lower_straight_length_bottom, 
    sidecar_angle,
    sidecar_arc_radius_bottom,
    sidecar_arc_angle_bottom,
    thumb_cluster_end_vector,
    upper_length=sidecar_upper_length_bottom,
    wall_end_only=true);
top_shell_wall_end_plus_wall_thickness = move(
    [top_x_offset, -sidecar_upper_length_bottom_delta],
    tangent_arc_tangent_wall(
    sidecar_lower_straight_length_top, 
    sidecar_angle,
    sidecar_arc_radius_top,
    sidecar_arc_angle_top,
    move(-[top_x_offset, -sidecar_upper_length_bottom_delta],
        thumb_cluster_end_vector),
    upper_length=sidecar_upper_length_top,
    wall_end_only=true));
thumb_cluster_wall_chamfer_x = norm(top_shell_wall_end_plus_wall_thickness[1] - bottom_shell_wall_end_plus_wall_thickness[1]);
mouse_button_bottom_thumb_tip_pts = [for (pt = filtered_mouse_buttons_thumb_tip_points) if (which_side_of_line(bottom_shell_wall_end, pt)) pt];
main_bottom_thumb_tip_pts = [for (pt = filtered_mouse_buttons_thumb_tip_points) if (!which_side_of_line(bottom_shell_wall_end, pt)) pt];
divider_bottom_thumb_tip_pts = line_intersection(bottom_shell_wall_end, [last(mouse_button_bottom_thumb_tip_pts), main_bottom_thumb_tip_pts[0]]);

// path for the wedge outside of the side wall
wedge_center = line_intersection(
    thumb_cluster_end_minus_wall_vector,
    [mouse_buttons_shell_rear_corner,
        back(1, mouse_buttons_shell_rear_corner)]);
wedge_arc_end = line_intersection(
    [last(main_bottom_thumb_tip_pts),
        select(main_bottom_thumb_tip_pts, -2)],
    [mouse_buttons_shell_rear_corner,
        back(1, mouse_buttons_shell_rear_corner)]);
wedge_outside_of_side_wall_path = flatten([
    [divider_bottom_thumb_tip_pts],
    main_bottom_thumb_tip_pts,
    [wedge_arc_end,
        wedge_center]
]);
wedge_outside_of_side_wall_centroid = centroid([wedge_center, wedge_arc_end, divider_bottom_thumb_tip_pts]);


function translate_thumb_cluster_end_vector(offset) =
    move(-offset, thumb_cluster_end_vector);

function trackball_support_path(tat, include_cutout_for_dongle_holder=true) =
    let(
        support_left_x = mouse_buttons_shell_rear_corner.x + wall_thickness,
        dongle_holder_center_x = support_left_x + leg_post_lower_diameter + battery_compartment_inner_wall_thickness + battery_terminal_thickness + battery_terminal_nub_length + battery_compartment_inner_wall_thickness + dongle_holder_mount_width / 2,
        dongle_holder_left_x = dongle_holder_center_x - dongle_holder_width / 2 - battery_compartment_inner_wall_thickness,
        dongle_holder_right_x = dongle_holder_center_x + dongle_holder_width / 2 + battery_compartment_inner_wall_thickness,
        dongle_holder_inner_y = sidecar_upper_length_bottom - wall_thickness - dongle_holder_top_depth - dongle_holder_depth - battery_compartment_inner_wall_thickness - battery_compartment_cover_spacing,
        path = [
            [support_left_x, last(tat).y],
            [support_left_x, tat[0].y],
            [dongle_holder_left_x - trackball_holder_dongle_holder_clearance, tat[0].y],
            [dongle_holder_left_x - trackball_holder_dongle_holder_clearance, min(dongle_holder_inner_y - trackball_holder_dongle_holder_clearance, tat[0].y)],
            [dongle_holder_right_x + trackball_holder_dongle_holder_clearance, min(dongle_holder_inner_y - trackball_holder_dongle_holder_clearance, tat[0].y)],
            [dongle_holder_right_x + trackball_holder_dongle_holder_clearance, tat[0].y]
        ]
    )
    flatten([
        tat,
        include_cutout_for_dongle_holder ? path :
            flatten([list_head(path, 2), list_tail(path, -1)])
    ]);

support_top_tat = move(
    [top_x_offset, -sidecar_upper_length_bottom_delta],
    tangent_arc_tangent_wall(
        sidecar_lower_straight_length_top,
        sidecar_angle,
        sidecar_arc_radius_top,
        sidecar_arc_angle_top,
        0,
        upper_length=sidecar_upper_length_top - battery_compartment_total_depth,
        inner_only=true));
opening_dist_from_center = sqrt((trackball_diameter / 2 + static_bearing_exposed_height)^2 - (trackball_holder_pcb_opening_length / 2)^2);

module difference_or_intersection(type) {
    if (type == "difference") {
        difference() {
            children(0);
            children(1);
        }
    } else if (type == "intersection") {
        intersection() {
            children(0);
            children(1);
        }
    }
}

module trackball_holder_split(inner_or_outer) {
    clearance = inner_or_outer == "inner" ? trackball_holder_split_clearance : 0;
    difference_or_intersection(inner_or_outer == "inner" ? "intersection" : "difference") {
        trackball_holder();
        translate(
            trackball_center +
            [trackball_holder_pcb_outer_opening_length_past_center - clearance,
             trackball_holder_pcb_outer_opening_y_offset,
             -opening_dist_from_center - (trackball_holder_pcb_mounting_dist - sensor_mounting_height)])
                cuboid([trackball_holder_pcb_mount_split_length - 2 * clearance,
                        trackball_holder_pcb_outer_opening_width - 2 * clearance,
                        trackball_diameter],
                    rounding=3,
                    edges=[RIGHT + FRONT, RIGHT + BACK],
                    anchor=RIGHT + TOP);
    }
}

module trackball_holder() {
    bottom_tat = tangent_arc_tangent_wall(
            sidecar_lower_straight_length_bottom,
            sidecar_angle,
            sidecar_arc_radius_bottom,
            sidecar_arc_angle_bottom,
            0,
            upper_length=sidecar_upper_length_bottom - battery_compartment_total_depth,
            inner_only=true);
    support_path_bottom = trackball_support_path(bottom_tat);
    support_path_top = trackball_support_path(support_top_tat);


    diff() {
        intersection() {
            union() {
                down(sidecar_angled_portion_height)
                    prism_from_paths(support_path_bottom, support_path_top, sidecar_angled_portion_height);
                down(case_height)
                    prism_from_paths(support_path_bottom, support_path_bottom, case_height - sidecar_angled_portion_height);
                // the mounting block doesn't need to avoid the dongle holder, so fill that area back in
                translate([trackball_holder_outer_screw_x_coord - assembly_screw_receiver_diameter / 2, sidecar_upper_length_bottom - battery_compartment_total_depth, -case_height + bottom_floor_thickness])
                    cuboid([-trackball_holder_outer_screw_x_coord, dongle_holder_depth, trackball_holder_screw_plate_thickness],
                           anchor=LEFT + BACK + BOTTOM);
            }
            union() {
                holder_height = case_height - top_shell_thickness - bottom_floor_thickness;
                translate([trackball_center.x, trackball_center.y, -top_shell_thickness]) {
                    cyl(d=trackball_wall_outer_diameter, h=holder_height, anchor=TOP);
                    cuboid([-trackball_center.x + top_x_offset, trackball_wall_outer_diameter, holder_height], anchor=TOP + LEFT);
                }
                // the mounting block with the screw holes
                translate([trackball_holder_outer_screw_x_coord - assembly_screw_receiver_diameter / 2,
                        trackball_holder_outer_front_screw_y_coord - assembly_screw_receiver_diameter / 2,
                        -case_height + bottom_floor_thickness])
                    cuboid([-2 * trackball_holder_outer_screw_x_coord, 2 * sidecar_upper_length_top, trackball_holder_screw_plate_thickness],
                        rounding=assembly_screw_receiver_rounding,
                        edges=LEFT + FRONT,
                        anchor=FRONT + LEFT + BOTTOM);
            }
        }
        
        tag("remove")
            upper_sidecar_screw_carve_out(sidecar_screw_carve_out_wall_thickness);
        
        support_path_bottom_without_cutout = trackball_support_path(bottom_tat, include_cutout_for_dongle_holder=false);
        support_path_top_without_cutout = trackball_support_path(support_top_tat, include_cutout_for_dongle_holder=false);
        intersection() {
            union() {
                down(sidecar_angled_portion_height)
                    prism_from_paths(support_path_bottom_without_cutout, support_path_top_without_cutout, sidecar_angled_portion_height);
                down(case_height)
                    prism_from_paths(support_path_bottom_without_cutout, support_path_bottom_without_cutout, case_height - sidecar_angled_portion_height);
            }
            translate(trackball_center) {
                bottom_half()
                    sphere(d=trackball_wall_outer_diameter);
                cyl(d=trackball_wall_outer_diameter, h=trackball_z_offset, anchor=BOTTOM);
                tag("remove") {
                    // the static bearing mounts
                    zrot_copies(n=3, sa=-(180 - sidecar_angle))
                        yrot($idx ? -trackball_bearing_vertical_angle : -trackball_back_bearing_vertical_angle) {
                            cyl(d=static_bearing_diameter, h=trackball_diameter / 2 + static_bearing_diameter - static_bearing_exposed_height,
                                rounding1=static_bearing_diameter / 2,
                                anchor=TOP);
                        }
                    // hollow out the sphere to make room for the trackball
                    sphere(d=trackball_diameter + 2 * static_bearing_exposed_height);
                    cyl(d=trackball_diameter + 2 * static_bearing_exposed_height, h=trackball_z_offset, anchor=BOTTOM);
                    // the opening for the sensor at the bottom of the trackball
                    down(opening_dist_from_center - 1)
                        left(0.25)
                        // we extend this cuboid by 1 mm in height so that the opening is visible even when $fn is low
                        cuboid([trackball_holder_pcb_opening_width, trackball_holder_pcb_opening_length, trackball_holder_pcb_mounting_dist + 1 + EXTRA],
                            rounding=trackball_holder_pcb_opening_rounding,
                            edges="Z",
                            anchor=TOP);
                    translate(point3d(-sensor_pcb_center_coords, -opening_dist_from_center - trackball_holder_pcb_mounting_dist))
                        sensor_pcb_mount();
                    // carve out the bottom to make space for the PCB and the cable
                    translate([trackball_holder_pcb_outer_opening_length_past_center, trackball_holder_pcb_outer_opening_y_offset, -opening_dist_from_center - trackball_holder_pcb_mounting_dist])
                        cuboid([2 * trackball_diameter + trackball_holder_pcb_outer_opening_length_past_center,
                                trackball_holder_pcb_outer_opening_width,
                                trackball_diameter],
                            rounding=3,
                            edges="Z",
                            anchor=RIGHT + TOP);
                }
            }
        }

        // screw holes
        move_copies(path3d([
            [trackball_holder_outer_screw_x_coord, sidecar_upper_length_bottom - battery_compartment_total_depth - assembly_screw_receiver_diameter / 2],
            [trackball_holder_outer_screw_x_coord, trackball_holder_outer_front_screw_y_coord],
            [-wall_thickness - assembly_screw_receiver_diameter / 2, wall_thickness + assembly_screw_receiver_diameter / 2],
            [-wall_thickness - assembly_screw_receiver_diameter / 2 - assembly_screw_lower_side_rear_wall_y_offset,
             sidecar_upper_length_bottom - battery_compartment_total_depth - assembly_screw_receiver_diameter / 2 - assembly_screw_lower_side_rear_wall_y_offset]
        ], -case_height + bottom_floor_thickness))
            assembly_screw_hole_threaded();
    }
}

module sensor_pcb_mount() {
    screw_hole_coords = [
        [9.5, -1],
        [2.75, -19.5]
    ];
    peg_coords = [
        [14, -4],
        [6.25, -19.5]
    ];
    // the outermost cutout covering the whole PCB
    tag_diff("remove", "inner_remove", "inner_keep") {
        translate([-1, 1, -EXTRA])
            cuboid([17, 23, sensor_pcb_mounting_height + EXTRA],
                    anchor=LEFT + BACK + BOTTOM)
                edge_profile(RIGHT + BACK)
                    tag("inner_remove")
                    mask2d_chamfer(x=7, y=6);
        tag("inner_remove")
            move_copies(screw_hole_coords)
                cyl(d=2.75, h=sensor_pcb_mounting_height + EXTRA, anchor=BOTTOM);
    }
    // the corners of the cutout
    tag("keep") {
        translate([-1, 1]) {
            cuboid([3.5, 1.5, sensor_mounting_height + EXTRA], anchor=LEFT + BACK + BOTTOM);
            cuboid([1.4, 2.4, sensor_mounting_height + EXTRA], anchor=LEFT + BACK + BOTTOM);
        }
        translate([16.5, -22]) {
            cuboid([5, 2, sensor_mounting_height + EXTRA], anchor=RIGHT + FRONT + BOTTOM);
            cuboid([2, 5, sensor_mounting_height + EXTRA], anchor=RIGHT + FRONT + BOTTOM);
        }
        move_copies(path3d(peg_coords, -sensor_pcb_thickness)) {
            cyl(d=sensor_pcb_peg_diameter, h=sensor_pcb_mounting_height + sensor_pcb_thickness + EXTRA, anchor=BOTTOM);
        }
    }
    tag("remove") {
        // the deeper cutout for the sensor itself
        translate([-1, -1, EXTRA])
            cuboid([10.25, 17.25, sensor_mounting_height + EXTRA],
                rounding=3,
                edges=[LEFT + BACK, RIGHT + BACK],
                anchor=LEFT + BACK + BOTTOM);
        move_copies(screw_hole_coords)
            screw_hole(sensor_pcb_screw_type, thread=true, length=sensor_pcb_screw_hole_length, $slop=sensor_pcb_screw_slop, orient=DOWN, anchor=TOP);
    }
}

// uncomment for sensor PCB mount test
// !diff() {
//     color("burlywood") {
//         translate([-8, 5])
//         cuboid([30, 32, 7], anchor=BOTTOM + BACK + LEFT);
//         sensor_pcb_mount();
//     }
// }

module prism_from_paths(bottom, top, h) {
    num_pts = len(bottom);
    assert(len(top) == num_pts);
    points = [
        for (pt = top) [pt.x, pt.y, h],
        for (pt = bottom) [pt.x, pt.y, 0],
    ];
    faces = flatten([
        [for (i = [0 : num_pts - 2]) [i + 1, i, num_pts + i, num_pts + i + 1]],
        [[0, num_pts - 1, 2 * num_pts - 1, num_pts]],
        [[for (i = [0 : num_pts - 1]) i]],
        [[for (i = [num_pts : 2 * num_pts - 1]) i]],
    ]);
    polyhedron(points, faces);
}

function tangent_arc_tangent(starting_tangent_distance, starting_tangent_angle, arc_radius, arc_angle, ending_tangent_distance, reversed=false) =
    let (
        arc_path = arc($fn, r=arc_radius, cp=[-starting_tangent_distance, -arc_radius], angle=[90, 90 + arc_angle]),
        arc_end = arc_path[$fn - 1],

        ending_tan_vector_length = is_matrix(ending_tangent_distance) ? 9.01626 : ending_tangent_distance,
        ending_tangent_end_by_distance = [arc_end.x - ending_tan_vector_length * cos(arc_angle), arc_end.y - ending_tan_vector_length * sin(arc_angle)],
        ending_tangent_end = is_matrix(ending_tangent_distance) ?
            line_intersection(
                zrot(-(starting_tangent_angle - 90), ending_tangent_distance),
                [arc_end, ending_tangent_end_by_distance])
            : ending_tangent_end_by_distance,
        path = flatten([[[0, 0]], arc_path, [ending_tangent_end]]),
        rotated = zrot(starting_tangent_angle-90, path)
    )
    reversed? reverse(rotated) : rotated;

function tangent_arc_tangent_wall(starting_tangent_distance, starting_tangent_angle, arc_radius, arc_angle, ending_tangent_distance, wall_thickness=wall_thickness, upper_length=sidecar_upper_length_top, inner_only=false, wall_end_only=false) =
    let(
        inner_offset = [-wall_thickness, -wall_thickness * sin(-sidecar_angle) + (wall_thickness * cos(-sidecar_angle) + wall_thickness) * tan(sidecar_angle - 90)],
        ending_tangent_end = is_matrix(ending_tangent_distance) ? move(-inner_offset, ending_tangent_distance) : ending_tangent_distance,
        inner_starting_tangent_distance = starting_tangent_distance - (wall_thickness * cos(-sidecar_angle) + wall_thickness) / sin(sidecar_angle - 90)
    )
    inner_only ?
        flatten([
            [[-wall_thickness, upper_length]],
            move(inner_offset,
                tangent_arc_tangent(inner_starting_tangent_distance, starting_tangent_angle, arc_radius + wall_thickness, arc_angle, ending_tangent_end))
        ]) :
    wall_end_only ?
        [
            last(tangent_arc_tangent(starting_tangent_distance, starting_tangent_angle, arc_radius, arc_angle, ending_tangent_distance)),
            last(
                move(inner_offset,
                tangent_arc_tangent(inner_starting_tangent_distance, starting_tangent_angle, arc_radius + wall_thickness, arc_angle, ending_tangent_end))
            )
        ]
    :
        flatten([
        [
            [-wall_thickness, upper_length],
            [0, upper_length],
        ],
        tangent_arc_tangent(starting_tangent_distance, starting_tangent_angle, arc_radius, arc_angle, ending_tangent_distance),
        move(inner_offset,
            tangent_arc_tangent(inner_starting_tangent_distance, starting_tangent_angle, arc_radius + wall_thickness, arc_angle, ending_tangent_end, reversed=true)),
    ]);

function lower_mount_path(z_offset, straight_length_inner, straight_length_outer) =
    let (
        z_offset_as_fraction = (z_offset) / sidecar_angled_portion_height,
        y_offset = -lerp(sidecar_upper_length_bottom_delta, 0, z_offset_as_fraction),
        x_offset = lerp(top_x_offset, 0, z_offset_as_fraction),
        inner_arc_radius = lerp(sidecar_arc_radius_top, sidecar_arc_radius_bottom, z_offset_as_fraction),
        outer_arc_radius = inner_arc_radius - lower_sidecar_mount_delta_y,
        arc_angle = lerp(sidecar_arc_angle_top, sidecar_arc_angle_bottom, z_offset_as_fraction),
        inner_path_2d = move(
            [x_offset, y_offset],
            tangent_arc_tangent(
                straight_length_inner,
                sidecar_angle,
                inner_arc_radius,
                arc_angle,
                translate_thumb_cluster_end_vector([x_offset, y_offset] - thumb_cluster_divider_wall_vector))
        ),
        outer_path_offset = [x_offset, y_offset - lower_sidecar_mount_delta_y],
        outer_path_2d = move(
            outer_path_offset,
            tangent_arc_tangent(
                straight_length_outer,
                sidecar_angle,
                outer_arc_radius,
                arc_angle,
                translate_thumb_cluster_end_vector(outer_path_offset - thumb_cluster_divider_wall_vector))
        ),
        inner_path = path3d(inner_path_2d, -z_offset),
        outer_path = path3d(outer_path_2d, lower_sidecar_mount_delta_z - z_offset)
    )
        flatten([inner_path, outer_path]);

function which_side_of_line(line, pt) =
  ((line[1].x - line[0].x) * (pt.y - line[0].y) - (line[1].y - line[0].y) * (pt.x - line[0].x)) > 0;

bottom_path_minus_wall = tangent_arc_tangent_wall(
    sidecar_lower_straight_length_bottom,
    sidecar_angle,
    sidecar_arc_radius_bottom,
    sidecar_arc_angle_bottom,
    thumb_cluster_end_minus_wall_vector,
    upper_length=sidecar_upper_length_bottom);
top_path_minus_wall = move(
    [top_x_offset, -sidecar_upper_length_bottom_delta],
    tangent_arc_tangent_wall(
        sidecar_lower_straight_length_top,
        sidecar_angle,
        sidecar_arc_radius_top,
        sidecar_arc_angle_top,
        move(-[top_x_offset, -sidecar_upper_length_bottom_delta], thumb_cluster_end_minus_wall_vector)));
module bottom_shell() {
    // the points for the floor along the sidecar edges
    bottom_floor_tat = tangent_arc_tangent(
        sidecar_lower_straight_length_bottom,
        sidecar_angle,
        sidecar_arc_radius_bottom,
        sidecar_arc_angle_bottom,
        translate_thumb_cluster_end_vector(-thumb_cluster_divider_wall_vector));
    
    
    bottom_floor_path = flatten([
        bottom_floor_tat,
        [
         [mouse_buttons_shell_rear_corner.x + wall_thickness, mouse_buttons_shell_rear_corner.y + mouse_button_thickness * cos(thumb_cluster_wall_angle)],
         [mouse_buttons_shell_rear_corner.x + wall_thickness, last(main_bottom_thumb_tip_pts).y],
         [mouse_buttons_shell_rear_corner.x + wall_thickness, sidecar_upper_length_bottom - battery_compartment_total_depth],
         [-2 * assembly_screw_receiver_diameter - assembly_screw_rear_wall_trackball_holder_x_offset - assembly_screw_rear_wall_trackball_holder_y_offset - wall_thickness,
          sidecar_upper_length_bottom - battery_compartment_total_depth],
         [-assembly_screw_receiver_diameter - wall_thickness - assembly_screw_rear_wall_trackball_holder_x_offset,
          sidecar_upper_length_bottom - battery_compartment_total_depth - assembly_screw_receiver_diameter - assembly_screw_rear_wall_trackball_holder_y_offset],
         [0,
          sidecar_upper_length_bottom - battery_compartment_total_depth - assembly_screw_receiver_diameter - assembly_screw_rear_wall_trackball_holder_y_offset],
        ],
    ]);

    diff() {
        force_tag("") {
            // the bottoms of the sidecar edge walls
            down(case_height)
                prism_from_paths(bottom=bottom_path_minus_wall, top=bottom_path_minus_wall, h=case_height - sidecar_angled_portion_height);
            // the tops of the sidecar edge walls
            down(sidecar_angled_portion_height)
                prism_from_paths(bottom=bottom_path_minus_wall, top=top_path_minus_wall, h=sidecar_angled_portion_height);
            // the bottom floor
            down(case_height)
                linear_extrude(height=bottom_floor_thickness)
                polygon(bottom_floor_path);
        }

        // screw holes
        move_copies(path3d([
            [trackball_holder_outer_screw_x_coord,
                sidecar_upper_length_bottom - battery_compartment_total_depth - assembly_screw_receiver_diameter / 2],
            [trackball_holder_outer_screw_x_coord,
                trackball_holder_outer_front_screw_y_coord],
            [-wall_thickness - assembly_screw_receiver_diameter / 2,
                wall_thickness + assembly_screw_receiver_diameter / 2],
            [mouse_buttons_shell_rear_corner.x + wall_thickness + leg_post_lower_diameter + assembly_screw_receiver_diameter / 2,
                sidecar_upper_length_bottom - battery_compartment_total_depth - assembly_screw_receiver_diameter / 2]
        ], -case_height))
            assembly_screw_hole_unthreaded(bottom_floor_thickness, DOWN);

        tag("remove") {
            upper_sidecar_screw_carve_out();
            mouse_buttons_back_wall_undecorated();
        }
        intersection() {
            upper_sidecar_screw_carve_out(1.5);
            cuboid([100, 100, case_height], anchor=RIGHT + FRONT + TOP);
        }
        // remove the very top of the wall, since that's included in the top shell
        up(EXTRA)
            tag("remove")
            cuboid([200, 200, top_shell_thickness + EXTRA], anchor=TOP);
        
        // add the screw hole for the inner top shell assembly screw
        translate([top_shell_inner_assembly_screw_receiver_pt.x - (top_shell_inner_assembly_screw_receiver_offset - 1)  * cos(top_shell_inner_assembly_screw_receiver_angle),
                top_shell_inner_assembly_screw_receiver_pt.y - (top_shell_inner_assembly_screw_receiver_offset - 1)  * sin(top_shell_inner_assembly_screw_receiver_angle),
                -top_shell_thickness])
            zrot(top_shell_inner_assembly_screw_receiver_angle)
            cuboid([1 + top_shell_inner_assembly_screw_receiver_chamfer_x, assembly_screw_receiver_diameter, assembly_screw_receiver_diameter],
                    anchor=RIGHT + TOP) {
                edge_profile(LEFT + TOP)
                    mask2d_chamfer(x=top_shell_inner_assembly_screw_receiver_chamfer_x, y=assembly_screw_receiver_diameter);
                position(RIGHT)
                    // this 0.85 was eyeballed and would likely need to be increased if we use something substantially larger than an
                    // m2.5 for the assembly screws
                    right(0.85)
                    tag("remove")
                    screw_hole(assembly_screw_type, thread=false, length=5 + EXTRA, orient=RIGHT, anchor=TOP)
                        position(TOP)
                            cyl(d=assembly_screw_head_diameter, h=2 * assembly_screw_head_height, anchor=CENTER);
                position(BOTTOM + LEFT)
                    // fill in below the wall so that we don't leave an unsupported overhang
                    cuboid([top_shell_inner_assembly_screw_receiver_chamfer_x / 2, assembly_screw_receiver_diameter, assembly_screw_receiver_diameter],
                           anchor=TOP + LEFT);
            }
    }
    
    // add an assembly screw receiver for the upper rear wall screw
    translate([top_x_offset - top_shell_thickness * top_x_offset / sidecar_angled_portion_height - wall_thickness,
               sidecar_upper_length_bottom - wall_thickness - battery_compartment_inner_wall_thickness - battery_compartment_cover_spacing,
               -top_shell_thickness])
        diff()
            cuboid([assembly_screw_receiver_diameter + assembly_screw_receiver_diameter * top_x_offset / sidecar_angled_portion_height,
                    assembly_screw_threading_total_length,
                    2 * assembly_screw_receiver_diameter],
                   chamfer=assembly_screw_receiver_diameter,
                   edges=LEFT + BOTTOM,
                   anchor=RIGHT + TOP + BACK) {
                edge_profile(RIGHT + BOTTOM)
                    mask2d_chamfer(y=2 * assembly_screw_receiver_diameter,
                                   x=2 * assembly_screw_receiver_diameter * top_x_offset / sidecar_angled_portion_height);
                position(LEFT + BACK + TOP)
                    translate([assembly_screw_receiver_diameter / 2,
                               0,
                               -assembly_screw_receiver_diameter / 2])
                        assembly_screw_hole_threaded(BACK);
            }

    thumb_cluster_sidecar_mounting_bracket();
    upper_sidecar_mounting_bracket();

    // the lower brace piece below the keyboard thumb cluster corner
    brace_height = case_height - lower_sidecar_mount_z_offset_top - bottom_floor_thickness + lower_sidecar_mount_delta_z;
    // I'm not sure where the 2 is coming from
    brace_length = glove80_thumb_cluster_length - palm_end_length - 2;
    brace_corner = last(bottom_floor_tat);
    brace_length_unit_vector = unit(last(mouse_buttons_palm_end_pts) - brace_corner);
    brace_width_unit_vector = unit(select(bottom_floor_tat, -2) - brace_corner);
    brace_path = [
        brace_corner,
        brace_corner + brace_length * brace_length_unit_vector,
        brace_corner + brace_length * brace_length_unit_vector + mouse_buttons_back_thickness * brace_width_unit_vector,
        brace_corner + thumb_cluster_lower_brace_width * brace_width_unit_vector,
    ];
    screw_receiver_y_offset = thumb_cluster_lower_brace_thickness * brace_length / thumb_cluster_lower_brace_width;
    down(case_height)
        linear_extrude(height=bottom_floor_thickness)
            polygon(brace_path);
    translate(point3d(brace_corner, -case_height + bottom_floor_thickness - EXTRA))
        zrot(thumb_cluster_wall_angle + 90)
        diff()
        cuboid([thumb_cluster_lower_brace_thickness, brace_length, brace_height + EXTRA],
               anchor=LEFT + BACK + BOTTOM) {
            edge_profile(BACK + TOP)
                // trim the edge so it doesn't interfere with the sidecar edge
                mask2d_chamfer(x=lower_sidecar_mount_straight_length_top + thumb_cluster_lower_brace_thickness + lower_sidecar_mount_z_offset_top * (sidecar_upper_length_bottom_delta / sidecar_angled_portion_height),
                               y=lower_sidecar_mount_delta_z + sidecar_mount_thickness / 2);
            // angled support at the bottom of the wall
            position(RIGHT + BACK + BOTTOM)
                cuboid([thumb_cluster_lower_brace_chamfer, brace_length - assembly_screw_receiver_diameter, thumb_cluster_lower_brace_chamfer],
                       chamfer=thumb_cluster_lower_brace_chamfer,
                       edges=RIGHT + TOP,
                       anchor=LEFT + BACK + BOTTOM)
            edge_profile(RIGHT + FRONT)
                mask2d_chamfer(x=thumb_cluster_lower_brace_thickness, y=thumb_cluster_lower_brace_thickness * brace_length / thumb_cluster_lower_brace_width);
            position(LEFT + TOP + FRONT)
                // the upper assembly screw receiver
                cuboid([assembly_screw_threading_total_length, assembly_screw_receiver_diameter, assembly_screw_receiver_diameter],
                        anchor=LEFT + FRONT + TOP) {
                    position(LEFT)
                        assembly_screw_hole_threaded(LEFT);
                    position(BOTTOM)
                        cuboid([assembly_screw_threading_total_length, assembly_screw_receiver_diameter, assembly_screw_threading_total_length],
                                chamfer=assembly_screw_threading_total_length,
                                edges=BOTTOM + RIGHT,
                                anchor=TOP);
                }
            position(LEFT + BOTTOM + FRONT)
                // the lower assembly screw receiver
                translate([0, assembly_screw_receiver_diameter / 2, assembly_screw_receiver_diameter / 2]) {
                    assembly_screw_hole_threaded(LEFT);
                    tag_diff("keep", "inner_remove", "inner_keep")
                        cuboid([assembly_screw_threading_total_length, assembly_screw_receiver_diameter, assembly_screw_receiver_diameter],
                            // rounding=assembly_screw_receiver_rounding,
                            // edges=["X", RIGHT],
                            anchor=LEFT)
                            position(LEFT)
                                assembly_screw_hole_threaded(LEFT, tag="inner_remove");
                }
        }


    // receiver for the front-lower side wall assembly screw
    translate([mouse_buttons_shell_rear_corner.x + wall_thickness,
               mouse_buttons_shell_rear_corner.y + assembly_screw_lower_front_side_wall_y_offset,
               -case_height + bottom_floor_thickness])
        diff()
        cuboid([assembly_screw_threading_total_length, assembly_screw_receiver_diameter, assembly_screw_receiver_diameter],
               rounding=assembly_screw_receiver_rounding,
               edges=[RIGHT, TOP],
               except=[BOTTOM, LEFT],
               anchor=LEFT + FRONT + BOTTOM)
            position(LEFT)
                assembly_screw_hole_threaded(LEFT);
    
    // assembly screw receiver for the mouse buttons back wall
    translate(point3d(assembly_screw_bottom_shell_mouse_buttons_back_wall_loc, -case_height + bottom_floor_thickness))
        zrot(thumb_cluster_wall_angle)
        back(wall_thickness)
        diff()
        cuboid([assembly_screw_receiver_diameter, assembly_screw_threading_total_length, assembly_screw_receiver_diameter],
               rounding=assembly_screw_receiver_rounding,
               edges=[BACK, TOP],
               except=[FRONT, BOTTOM],
               anchor=FRONT + BOTTOM)
            position(FRONT)
                assembly_screw_hole_threaded(FRONT);
}


module assembly_screw_hole_threaded(orient=DOWN, tag="remove", length=assembly_screw_threading_length) {
    tag(tag)
        screw_hole(assembly_screw_type, thread=true, length=length, $slop=assembly_screw_slop, orient=orient, anchor=TOP);
}

module assembly_screw_hole_unthreaded(length, orient=DOWN) {
    tag("remove")
        screw_hole(assembly_screw_type, thread=false, length=length + EXTRA, orient=orient, anchor=TOP)
            position(TOP)
                cyl(d=assembly_screw_head_diameter, h=assembly_screw_head_height, anchor=TOP);
}

module exposed_assembly_screw_hole_unthreaded(length=mouse_button_thickness, orient=DOWN, anchor=TOP) {
    tag("remove")
        screw_hole(assembly_screw_type, thread=false, length=length + EXTRA, orient=orient, anchor=anchor)
            position(TOP)
                down(length - 1)
                cyl(d=assembly_screw_head_diameter, h=assembly_screw_head_height, anchor=BOTTOM);
}

module thumb_cluster_wall_palm_end(extra_width=0) {
    mouse_buttons_path = mouse_buttons_shell_path(mouse_buttons_palm_end_scaling(1), "inner_only", lowered_top=mouse_button_palm_end_droop);
    translate(point3d(mouse_buttons_shell_wall_start + straight_shell_length * thumb_cluster_unit_vector, mouse_buttons_additional_height))
        rotate([90, 0, thumb_cluster_wall_angle + 180])
        left(mouse_button_thickness)
        linear_extrude(mouse_button_thickness + extra_width)
        polygon(mouse_buttons_path);
}
    
module thumb_cluster_sidecar_mounting_bracket() {
    lower_mount_pts = flatten([
        lower_mount_path(lower_sidecar_mount_z_offset_top, lower_sidecar_mount_straight_length_top, lower_sidecar_mount_straight_length_top_outer),
        lower_mount_path(lower_sidecar_mount_z_offset_top + sidecar_mount_thickness, lower_sidecar_mount_straight_length_bottom, lower_sidecar_mount_straight_length_bottom_outer)
    ]);
    pts_per_tat = len(lower_mount_pts) / 4;
    // lower_mount_pts contents:
    // top inner, right-to-left    at index 0               through pts_per_tat - 1
    // top outer, right-to-left    at index pts_per_tat     through 2 * pts_per_tat - 1
    // bottom inner, right-to-left at index 2 * pts_per_tat through 3 * pts_per_tat - 1
    // bottom outer, right-to-left at index 3 * pts_per_tat through 4 * pts_per_tat - 1
    lower_mount_faces = [
        flatten([list([pts_per_tat - 1:-1:0]), list([pts_per_tat:2 * pts_per_tat - 1])]), // top
        flatten([list([4 * pts_per_tat - 1:-1:3 * pts_per_tat]), list([2 * pts_per_tat:3 * pts_per_tat - 1])]), // bottom
        [pts_per_tat - 1, 2 * pts_per_tat - 1, 4 * pts_per_tat - 1, 3 * pts_per_tat - 1], // left
        [pts_per_tat, 0, 2 * pts_per_tat, 3 * pts_per_tat], // right
        flatten([list([2 * pts_per_tat - 1:-1:pts_per_tat]), list([3 * pts_per_tat:4 * pts_per_tat - 1])]), // front
        flatten([list([0:pts_per_tat - 1]), list([3 * pts_per_tat - 1:-1:2 * pts_per_tat])]), // back
    ];
    difference() {
        polyhedron(lower_mount_pts, lower_mount_faces);
        translate(lower_mount_pts[0] - [17.89413341, 18, 0])
            screw_hole("m2.5", l=10, $slop=sidecar_screw_hole_slop);
    }
}

module upper_sidecar_mounting_bracket() {
    translate(upper_sidecar_upper_back_inner_corner_coords) {
        screw_hole_relative_pos = (upper_sidecar_screw_hole_offset - upper_sidecar_sphere_center);
        intersection() {
            diff() {
                translate(upper_sidecar_sphere_center) {
                    // we're using a really small portion of the sphere, so increase the number of segments
                    $fn = $fn * 4;
                    sphere(r=upper_sidecar_sphere_radius + sidecar_mount_thickness);
                    tag("remove")
                        sphere(r=upper_sidecar_sphere_radius);
                    }
                translate(upper_sidecar_screw_hole_offset)
                    // angle the screw hole so it points towards the center of the sphere  
                    rotate([-atan(screw_hole_relative_pos.x / screw_hole_relative_pos.y) + 90,
                            atan(screw_hole_relative_pos.z / sqrt(screw_hole_relative_pos.x ^ 2 + screw_hole_relative_pos.y ^ 2)) - 90,
                            0])
                    tag("remove")
                        screw_hole("m2.5", l=10, $slop=sidecar_screw_hole_slop, anchor=TOP);
            }
            // trim the sphere to just the part we want
            left(2.5)
                diff()
                cuboid([2.5 + 7.24218247, 40.65, 15], anchor=TOP + BACK + LEFT) {
                    edge_profile(RIGHT + FRONT)
                        mask2d_chamfer(x=1.33408038 + 7.24218247 - EXTRA, y=6.70471954);
                    edge_profile(LEFT + TOP)
                        mask2d_chamfer(x=1.5, y=1.5);
                }
        }
    }
}

module upper_sidecar_screw_carve_out(additional_diameter=0) {
    start_pos = upper_sidecar_upper_back_inner_corner_coords + upper_sidecar_screw_hole_offset;
    sphere_center_to_start = unit(upper_sidecar_screw_hole_offset - upper_sidecar_sphere_center);
    diam = sidecar_screw_carve_out_diameter + additional_diameter;
    pt2_temp = start_pos + sidecar_screw_carve_out_straight_length * sphere_center_to_start;
    // we don't want the cutout to be at a funny angle in the XZ plane
    pt2 = [pt2_temp.x, start_pos.y, pt2_temp.z];
    path = [start_pos,
            pt2,
            [pt2.x, pt2.y, -case_height + bottom_floor_thickness],
            [pt2.x, pt2.y, -case_height - 5]];
    scale = [[1, 1],
             [1, 1],
             [1, 1],
             [1, sidecar_screw_carve_out_bottom_scale]];
    shape = back(
        diam / 2,
        rect([diam + sidecar_screw_carve_out_straight_width, 2 * diam],
             rounding=[diam / 2, diam / 2, 0, 0],
             anchor=BACK));
    path_sweep(shape, path, scale=scale);
}


function find_pt_and_angle_at_y(list, target_y) =
    let(
        diffs = [for (list_val = list) abs(list_val.y - target_y)],
        min_index = search(min(diffs), diffs)[0],
        other_index = diffs[min_index - 1] < diffs[min_index + 1] ? min_index - 1 : min_index + 1,
        x_val = lookup(target_y, [[list[min_index].y, list[min_index].x], [list[other_index].y, list[other_index].x]]),
        min_index_angle = v_theta(list[min_index + 1] - list[min_index - 1]) + 90,
        other_index_angle = v_theta(list[other_index + 1] - list[other_index - 1]) + 90,
        angle = lookup(target_y, [[list[min_index].y, min_index_angle], [list[other_index].y, other_index_angle]])
    )
    [[x_val, target_y], angle];

function top_shell_inner_assembly_screw_receiver_pt_and_angle() =
    let(
        top_path_tat = move(
            [top_x_offset, -sidecar_upper_length_bottom_delta],
            tangent_arc_tangent(
                sidecar_lower_straight_length_top,
                sidecar_angle,
                sidecar_arc_radius_top,
                sidecar_arc_angle_top,
                sidecar_lower_straight_length_outer + wall_thickness))
    )
    find_pt_and_angle_at_y(top_path_tat, top_shell_inner_assembly_screw_y);

top_shell_inner_assembly_screw_receiver_pt = top_shell_inner_assembly_screw_receiver_pt_and_angle()[0];
top_shell_inner_assembly_screw_receiver_angle = top_shell_inner_assembly_screw_receiver_pt_and_angle()[1];
top_shell_inner_assembly_screw_receiver_chamfer_x = assembly_screw_receiver_diameter * top_x_offset / sidecar_angled_portion_height;
top_shell_inner_assembly_screw_receiver_offset = top_shell_thickness * top_x_offset / sidecar_angled_portion_height + wall_thickness + 0.5;
top_shell_inner_assembly_screw_receiver_rim_clearence = 1;

module top_shell_inner_assembly_screw_receiver() {
    translate([
               top_shell_inner_assembly_screw_receiver_pt.x - top_shell_inner_assembly_screw_receiver_offset  * cos(top_shell_inner_assembly_screw_receiver_angle),
               top_shell_inner_assembly_screw_receiver_pt.y - top_shell_inner_assembly_screw_receiver_offset  * sin(top_shell_inner_assembly_screw_receiver_angle),
               -top_shell_thickness])
        zrot(top_shell_inner_assembly_screw_receiver_angle)
        diff()
            cuboid([assembly_screw_threading_total_length + top_shell_inner_assembly_screw_receiver_chamfer_x, assembly_screw_receiver_diameter, assembly_screw_receiver_diameter],
                   anchor=RIGHT + TOP) {
                // edge_profile(RIGHT + TOP)
                //     // trim the outer top back a little bit.  It overlaps with
                //     // the rim, so it's not actually needed, and we don't want
                //     // it to stick out past the rim
                //     mask2d_chamfer(x=top_shell_rim_thickness / 4, y=top_shell_rim_height);
                edge_profile(RIGHT + BOTTOM)
                    // angle the front of the block to match the slant of the sidecar wall
                    mask2d_chamfer(x=top_shell_inner_assembly_screw_receiver_chamfer_x, y=assembly_screw_receiver_diameter);
                position(RIGHT)
                    assembly_screw_hole_threaded(RIGHT, length=assembly_screw_threading_length + top_shell_inner_assembly_screw_receiver_chamfer_x);
            }
    
}

module top_shell_undecorated() {
    top_cover_tat_offset = [top_x_offset + wall_thickness * cos(-sidecar_angle), -sidecar_upper_length_bottom_delta - wall_thickness * sin(-sidecar_angle)];
    top_cover_tat = move(
        top_cover_tat_offset,
        tangent_arc_tangent(
            sidecar_lower_straight_length_top,
            sidecar_angle,
            sidecar_arc_radius_top,
            sidecar_arc_angle_top,
            translate_thumb_cluster_end_vector(top_cover_tat_offset - thumb_cluster_divider_wall_vector)));
    top_cover_path = flatten([
            top_cover_tat,
            [
                [mouse_buttons_shell_rear_corner.x, mouse_buttons_shell_rear_corner.y - wall_thickness * sin(thumb_cluster_wall_angle)],
                [mouse_buttons_shell_rear_corner.x, sidecar_upper_length_bottom],
                [top_cover_tat[0].x, sidecar_upper_length_bottom]],
    ]);
    difference() {
        down(top_shell_thickness)
            linear_extrude(height=top_shell_thickness)
            polygon(top_cover_path);
        mouse_buttons_back_wall_undecorated();
    }
}

module top_shell() {
    support_path = flatten([
        support_top_tat,
        [
            [mouse_buttons_shell_rear_corner.x, last(support_top_tat).y],
            [mouse_buttons_shell_rear_corner.x, sidecar_upper_length_top],
            [top_x_offset, sidecar_upper_length_top]
        ]
    ]);
    
    back_of_trackball_holder_rim_y = min(
            trackball_wall_outer_diameter / 2,
            sidecar_upper_length_bottom - battery_compartment_total_depth - trackball_center.y);
    
    diff() {
        force_tag("")
            top_shell_undecorated();
        // cut out a hole for the trackball
        tag("remove")
        translate(trackball_center)
            sphere(d=trackball_diameter + static_bearing_exposed_height + 2 * top_shell_trackball_clearance);
    }
    top_shell_inner_assembly_screw_receiver();
    
    // beveled top of the sidecar join
    intersection() {
        down(sidecar_angled_portion_height)
            prism_from_paths(bottom=bottom_path_minus_wall, top=top_path_minus_wall, h=sidecar_angled_portion_height);
        cuboid([200, 200, top_shell_thickness], anchor=TOP);
    }
    diff() {
        // rim around the trackball holder
        intersection() {
            down(top_shell_thickness + top_shell_rim_height)
                linear_extrude(height=top_shell_rim_height)
                polygon(support_path);
            translate(point3d(trackball_center, -top_shell_thickness)) {
                tube(od=trackball_wall_outer_diameter + 2 * (top_shell_rim_radial_clearance + top_shell_rim_thickness), wall=top_shell_rim_thickness, h=top_shell_rim_height, anchor=TOP);
                back(back_of_trackball_holder_rim_y + top_shell_rim_radial_clearance)
                    cuboid([trackball_wall_outer_diameter / 2, top_shell_rim_thickness, top_shell_rim_height], anchor=LEFT + FRONT + TOP);
                fwd(trackball_wall_outer_diameter / 2 + top_shell_rim_radial_clearance)
                    cuboid([trackball_wall_outer_diameter / 2, top_shell_rim_thickness, top_shell_rim_height], anchor=LEFT + BACK + TOP);
            }
        }
        // rim around the sidecar walls
        shorten_sidecar_rim_by = wall_thickness + battery_compartment_cover_spacing + battery_compartment_inner_wall_thickness + assembly_screw_threading_total_length;
        bottom_path_with_rim = tangent_arc_tangent_wall(
            sidecar_lower_straight_length_bottom,
            sidecar_angle,
            sidecar_arc_radius_bottom,
            sidecar_arc_angle_bottom,
            translate_thumb_cluster_end_vector(-thumb_cluster_divider_wall_vector),
            wall_thickness=wall_thickness + top_shell_rim_radial_clearance + top_shell_rim_thickness,
            upper_length=sidecar_upper_length_bottom - shorten_sidecar_rim_by);
        top_path_with_rim = move(
            [top_x_offset, -sidecar_upper_length_bottom_delta],
            tangent_arc_tangent_wall(
                sidecar_lower_straight_length_top,
                sidecar_angle,
                sidecar_arc_radius_top,
                sidecar_arc_angle_top,
                translate_thumb_cluster_end_vector([top_x_offset, -sidecar_upper_length_bottom_delta] - thumb_cluster_divider_wall_vector),
                wall_thickness=wall_thickness + top_shell_rim_radial_clearance + top_shell_rim_thickness,
                upper_length=sidecar_upper_length_top - shorten_sidecar_rim_by));
        intersection() {
            down(sidecar_angled_portion_height)
                prism_from_paths(bottom=bottom_path_with_rim, top=top_path_with_rim, h=sidecar_angled_portion_height);
            down(top_shell_thickness - EXTRA)
                cuboid([200, 200, top_shell_rim_height], anchor=TOP);
        }
        // rim along the back wall
        // shorten_for_assembly_screw = assembly_screw_receiver_diameter + assembly_screw_receiver_diameter * top_x_offset / sidecar_angled_portion_height;
        translate([top_x_offset - wall_thickness - top_shell_thickness * top_x_offset / sidecar_angled_portion_height - assembly_screw_receiver_diameter * top_x_offset / sidecar_angled_portion_height - assembly_screw_receiver_diameter - top_shell_rim_axial_clearance,
                   sidecar_upper_length_bottom - wall_thickness - top_shell_rim_radial_clearance,
                   -top_shell_thickness])
            cuboid([top_x_offset - mouse_buttons_shell_rear_corner.x - top_shell_thickness * top_x_offset / sidecar_angled_portion_height - assembly_screw_receiver_diameter * (1 + top_x_offset / sidecar_angled_portion_height) - 2 * wall_thickness - leg_post_upper_width - 2 * top_shell_rim_axial_clearance,
                    top_shell_rim_thickness,
                    top_shell_rim_height],
                    anchor=RIGHT + BACK + TOP);

        // rim for the side wall
        translate([mouse_buttons_shell_rear_corner.x + wall_thickness + top_shell_rim_radial_clearance,
                    sidecar_upper_length_bottom - wall_thickness - leg_post_upper_width - top_shell_rim_axial_clearance,
                    -top_shell_thickness])
            cuboid([top_shell_rim_thickness,
                    sidecar_upper_length_bottom - wall_thickness - leg_post_upper_width - top_shell_rim_axial_clearance - mouse_buttons_shell_rear_corner.y - assembly_screw_upper_front_side_wall_y_offset,
                    top_shell_rim_height],
                    anchor=LEFT + BACK + TOP);
        
        // the front assembly screw hole on the side wall side
        translate([mouse_buttons_shell_rear_corner.x + wall_thickness, mouse_buttons_shell_rear_corner.y + assembly_screw_upper_front_side_wall_y_offset, -top_shell_thickness])
            cuboid([assembly_screw_threading_total_length,
                    assembly_screw_receiver_diameter,
                    assembly_screw_receiver_diameter],
                rounding=assembly_screw_receiver_rounding,
                edges=[FRONT + BOTTOM, BACK + BOTTOM],
                anchor=LEFT + FRONT + TOP)
                position(LEFT)
                    assembly_screw_hole_threaded(LEFT);
        // rear assembly screw hole on the side wall side
        translate([mouse_buttons_shell_rear_corner.x + wall_thickness,
                   sidecar_upper_length_top - 2 * wall_thickness - leg_post_lower_diameter - assembly_screw_receiver_diameter - assembly_screw_upper_side_rear_wall_y_offset,
                   -top_shell_thickness])
            cuboid([assembly_screw_threading_total_length, assembly_screw_receiver_diameter, assembly_screw_receiver_diameter],
                rounding=assembly_screw_receiver_rounding,
                edges=[FRONT + BOTTOM, BACK + BOTTOM],
                anchor=LEFT + BACK + TOP)
                position(LEFT)
                    assembly_screw_hole_threaded(LEFT);
        // assembly screw hole against the rear wall
        translate([-wall_thickness - assembly_screw_receiver_diameter,
                   sidecar_upper_length_bottom - wall_thickness,
                   -top_shell_thickness])
            cuboid([assembly_screw_receiver_diameter, assembly_screw_threading_total_length, assembly_screw_receiver_diameter],
                rounding=assembly_screw_receiver_rounding,
                edges=[LEFT + BOTTOM, RIGHT + BOTTOM],
                anchor=RIGHT + BACK + TOP)
                position(BACK)
                    assembly_screw_hole_threaded(BACK);
        
        force_tag("remove") {
            // make sure the rim doesn't intersect with the bottom shell
            bottom_path_with_clearance = right(
                EXTRA,
                tangent_arc_tangent_wall(
                    sidecar_lower_straight_length_bottom,
                    sidecar_angle,
                    sidecar_arc_radius_bottom,
                    sidecar_arc_angle_bottom,
                    2 * sidecar_lower_straight_length_outer,
                    wall_thickness=wall_thickness + top_shell_rim_radial_clearance + EXTRA,
                    upper_length=sidecar_upper_length_bottom + EXTRA));
            top_path_with_clearance = move(
                    [top_x_offset + EXTRA, -sidecar_upper_length_bottom_delta],
                    tangent_arc_tangent_wall(
                        sidecar_lower_straight_length_top,
                        sidecar_angle,
                        sidecar_arc_radius_top,
                        sidecar_arc_angle_top,
                        2 * sidecar_lower_straight_length_outer,
                        wall_thickness=wall_thickness + top_shell_rim_radial_clearance + EXTRA,
                        upper_length=sidecar_upper_length_top + EXTRA));
            down(sidecar_angled_portion_height)
                prism_from_paths(bottom=bottom_path_with_clearance, top=top_path_with_clearance, h=sidecar_angled_portion_height);
            // make sure the rim doesn't intersect with the trackball holder
            translate([trackball_center.x, trackball_center.y - trackball_wall_outer_diameter / 2, -top_shell_thickness + EXTRA])
                cuboid([trackball_diameter,
                        trackball_wall_outer_diameter / 2 + back_of_trackball_holder_rim_y + 2 * top_shell_rim_axial_clearance,
                        top_shell_rim_height + 2 * EXTRA], 
                    anchor=LEFT + FRONT + TOP);
            translate([trackball_center.x, trackball_center.y, -top_shell_thickness + EXTRA])
                cyl(d=trackball_wall_outer_diameter + 2 * top_shell_rim_radial_clearance, 
                    h=top_shell_rim_height + 2 * EXTRA,
                    anchor=TOP);
            // carve space out of the side wall rim for the PCB
            translate([mouse_buttons_shell_rear_corner.x + wall_thickness + top_shell_rim_radial_clearance,
                    side_wall_top_rim_gap_center_y,
                    -top_shell_thickness + EXTRA])
                cuboid([top_shell_rim_thickness,
                        side_wall_top_rim_gap_width,
                        top_shell_rim_height + 2 * EXTRA],
                        chamfer=top_shell_rim_height + EXTRA,
                        edges=[FRONT + TOP, BACK + TOP],
                        anchor=LEFT + BACK + TOP);
            // carve out space around the inner assembly screw
            translate(point3d(top_shell_inner_assembly_screw_receiver_pt, -top_shell_thickness))
                zrot(top_shell_inner_assembly_screw_receiver_angle)
                    cuboid([2 * assembly_screw_threading_total_length,
                            assembly_screw_receiver_diameter + 2 * top_shell_inner_assembly_screw_receiver_rim_clearence,
                            assembly_screw_receiver_diameter],
                           anchor=TOP);
            mouse_buttons_back_wall_undecorated();
        }
    }
}


function my_circlecorner(points, parm) =
    let(
        angle = vector_angle(points)/2,
        d = parm[0],
        r = parm[1],
        prev = unit(points[0]-points[1]),
        next = unit(points[2]-points[1])
    )
    approx(angle,90) ? [points[1]+prev*d, points[1]+next*d] :
    let(
        center = r/sin(angle) * unit(prev+next)+points[1],
                start = points[1]+prev*d,
                end = points[1]+next*d
    )     // 90-angle is half the angle of the circular arc
    arc(mouse_buttons_shell_segments_per_arc, cp=center, points=[start,end]);

function my_round_corners(path, r) =
    let(
        parm = r,
        // dk is a list of parameters, where distance is the joint length to move away from the corner
        //     "circle" method: [distance, radius]
        dk = [
              for(i=[0:1:len(path)-1])
                  let(
                      pathbit = select(path,i-1,i+1),
                      // This is the half-angle at the corner
                      angle = approx(pathbit[0],pathbit[1]) || approx(pathbit[1],pathbit[2]) ? undef
                            : vector_angle(select(path,i-1,i+1))/2
                  )
                  parm[i]==0 ? [0]    : // If no rounding requested then don't try to compute parameters
                  [parm[i]/tan(angle), parm[i]]
        ],
        lengths = [for(i=[0:1:len(path)]) norm(select(path,i)-select(path,i-1))],
        scalefactors = [
            for(i=[0:1:len(path)-1])
                 min(
                    lengths[i]/(select(dk,i-1)[0]+dk[i][0]),
                    lengths[i+1]/(dk[i][0]+select(dk,i+1)[0])
                 )
        ]
    )
    assert(min(scalefactors)>=1,str("Roundovers are too big for the path.  If you multiply them by this vector they should fit: ",scalefactors))
    [
        for(i=[0:1:len(path)-1]) each
            (dk[i][0] == 0)? [path[i]] :
            my_circlecorner(select(path,i-1,i+1), dk[i])
    ];

// path_type can be "shell", "inner_only", "bottom_x_only", "solid"
function mouse_buttons_shell_path(scaling=[1, 1], path_type="shell", lowered_top=0) =
    let (
        mouse_wheel_center_y = mouse_wheel_pcb_y - mouse_buttons_pcb_y_offset,
        straight_width = scaling[0] * mouse_buttons_straight_width,
        angled_width = scaling[1] * mouse_buttons_angled_width,
        angled_height = mouse_button_width_left + height_past_left_mouse_button,
        outer_top = -(1 - scaling[0]) * lowered_top,
        
        inner_floor_pos_x = -straight_width - angled_width,
        straight_path = [
            [0, 0],
            [-straight_width, outer_top],
            [-straight_width, mouse_wheel_center_y],
            [-straight_width - angled_width, mouse_wheel_center_y - mouse_button_width_left - height_past_left_mouse_button],
            [0, mouse_wheel_center_y - mouse_button_width_left - height_past_left_mouse_button],
            [0, mouse_wheel_center_y - mouse_button_width_left - height_past_left_mouse_button + mouse_button_thickness],
            [-straight_width - angled_width + mouse_button_thickness + mouse_button_thickness * angled_width / angled_height, mouse_wheel_center_y - mouse_button_width_left - height_past_left_mouse_button + mouse_button_thickness],
            [-straight_width + mouse_button_thickness, mouse_wheel_center_y - mouse_button_thickness * angled_width / angled_height],
            [-straight_width + mouse_button_thickness, outer_top - mouse_button_thickness - mouse_button_thickness * -outer_top / straight_width],
            [0, -mouse_button_thickness],
        ],
        radii = [
            0,
            mouse_button_top_and_bottom_rounding - 2 * outer_top,
            mouse_button_curve_rounding,
            mouse_button_top_and_bottom_rounding,
            0, 
            0,
            max(0, mouse_button_top_and_bottom_rounding - mouse_button_thickness),
            max(0, mouse_button_curve_rounding - mouse_button_thickness),
            // if this switches from 0 to non-zero due to scaling, we'll wind up
            // generating different numbers of points, which will cause our
            // point grid to not be a grid.  To avoid that, use a very small
            // value instead of 0
            max(lowered_top ? 0.01 : 0, mouse_button_top_and_bottom_rounding - 2 * outer_top - mouse_button_thickness),
            0,
        ],
        inner_only_path = reverse(flatten([
            select(straight_path, 5, 9),
            [[0, -case_height]]])),
        inner_only_radii = reverse(flatten([
            select(radii, 5, 9),
            [0]])),
        solid_path = flatten([
            select(straight_path, 0, 4),
            [[0, -case_height]]]),
        solid_radii = flatten([
            select(radii, 0, 4),
            [0]])
    )
    path_type == "shell" ?
        my_round_corners(straight_path, r=radii) :
    path_type == "inner_only" ?
        my_round_corners(inner_only_path, r=inner_only_radii) :
    path_type == "bottom_x_only" ?
        inner_floor_pos_x :
    path_type == "solid" ?
        my_round_corners(solid_path, r=solid_radii) :
    assert(false, "invalid path_type") undef;

function mouse_buttons_palm_end_scaling(i) = [
    0.2 + 0.8 * sqrt(1 - 0.90 * i), 
    0.2 + 0.8 * (1 - 0.90 * i)^0.85
];
function mouse_buttons_thumb_tip_end_scaling(i) = [
    0.2 + 0.8 * (1 - 0.70 * i)^(2),
    0.2 + 0.8 * (1 - 0.50 * i)^(0.85)
];

module mouse_buttons_thumb_tip_end_polyhedron(path_type="shell") {
    vertex_grid_thumb_tip_end = [
        for (i = [0:1 / min($fn, 100):1])
            yrot(
                -i * (thumb_cluster_wall_angle + 180),
                path3d(
                    mouse_buttons_shell_path(
                        mouse_buttons_thumb_tip_end_scaling(i),
                        path_type=path_type)))];
    vnf_thumb_tip_end = vnf_vertex_array(vertex_grid_thumb_tip_end, caps=true, col_wrap=true);
    
    i_at_90_degrees = (90 / (thumb_cluster_wall_angle + 180));
    
    translate(point3d(mouse_buttons_shell_wall_start, mouse_buttons_additional_height))
        rotate([90, 0, thumb_cluster_wall_angle + 90]) {
            vnf_polyhedron(vnf_thumb_tip_end);
        }
}

module mouse_buttons_shell() {
    diff() {
        translate(point3d(mouse_buttons_shell_wall_start, mouse_buttons_additional_height)) {
            rotate([90, 0, thumb_cluster_wall_angle + 90])
                force_tag("") {
                    linear_extrude(height=straight_shell_length)
                        polygon(mouse_buttons_shell_path());
            }
            rotate([mouse_buttons_pcb_x_rotate, 0, thumb_cluster_wall_angle])
                translate([mouse_buttons_and_wheel_x_offset - 0.65,
                           -wall_thickness - mouse_button_thickness + mouse_wheel_pcb_y,
                           0]) {
                    up(mouse_buttons_pcb_z_offset + mouse_buttons_pcb_thickness + mouse_wheel_elevation)
                        back(0.5)
                        tag("remove")
                        // cutout for the mouse wheel
                        xcyl(r=mouse_wheel_opening_radius, h=mouse_wheel_opening_width, rounding=mouse_wheel_rounding);
                    up(5)
                        // the up(5) ensures that we're clear of the back of the thumb tip end
                        mouse_button_cutouts();
                }
            intersection() {
                union() {
                    rotate([mouse_buttons_pcb_x_rotate, 0, thumb_cluster_wall_angle])
                        translate([mouse_buttons_and_wheel_x_offset - mouse_buttons_pcb_x_offset,
                                    -wall_thickness - mouse_button_thickness,
                                    mouse_buttons_pcb_z_offset + mouse_buttons_pcb_thickness + mouse_button_pad_elevation]) {
                            // for the height of the switch pads, we just need a big number that we know is greater than
                            // the distance from the shell to the PCB, since we trim off everything that extends outside
                            // the mouse buttons shell
                            mouse_buttons_switch_pads(50);
                            // add extra support between the left mouse button and the mini mouse buttons
                            right(left_button_switch_mini_button_switch_x + mouse_button_cutout_width / 2 - 0.4)
                                cuboid([width_between_mouse_buttons - mouse_button_cutout_width, 50, 50], anchor=LEFT + BACK+ BOTTOM);
                        }
                }
                rotate([90, 0, thumb_cluster_wall_angle + 90])
                    linear_extrude(height=straight_shell_length)
                    polygon(mouse_buttons_shell_path(path_type="inner_only"));
            }
        }
        
        translate(point3d(mouse_buttons_shell_wall_start,
                          mouse_buttons_additional_height + mouse_wheel_pcb_y - mouse_buttons_pcb_y_offset - mouse_button_width_left - height_past_left_mouse_button + mouse_button_thickness))
            zrot(thumb_cluster_wall_angle) {
                // the lower assembly screw receiver on the left/right button side
                right(straight_shell_length + assembly_screw_mouse_buttons_bottom_front_x_offset)
                    tag_diff("keep", "inner_remove", "inner_keep")
                    cuboid([assembly_screw_receiver_diameter, assembly_screw_threading_total_length, assembly_screw_receiver_diameter],
                        rounding=assembly_screw_receiver_rounding,
                        edges=[TOP, FRONT],
                        anchor=LEFT + BACK + BOTTOM)
                        position(BACK)
                            assembly_screw_hole_threaded(BACK, tag="inner_remove");
                // the screw hole on bottom of the mini button side
                translate([assembly_screw_receiver_diameter / 2 - mouse_button_thickness * cos(thumb_cluster_wall_angle),
                           -assembly_screw_receiver_diameter / 2 - assembly_screw_mouse_buttons_bottom_rear_y_offset,
                           -mouse_button_thickness])
                    exposed_assembly_screw_hole_unthreaded();
            }
        // the upper assembly screw receiver on the left/right button side
        tag_intersect("keep", "intersect", "inner_keep") {
            translate(point3d(mouse_buttons_shell_wall_start,
                            mouse_buttons_additional_height + mouse_wheel_pcb_y - mouse_buttons_pcb_y_offset + assembly_screw_mouse_buttons_top_front_z_offset))
                zrot(thumb_cluster_wall_angle) {
                    right(straight_shell_length - assembly_screw_mouse_buttons_top_front_x_offset)
                    tag_diff("intersect", "inner_remove", "inner_inner_keep")
                        cuboid([2 * assembly_screw_receiver_diameter, assembly_screw_threading_total_length, 2 * assembly_screw_receiver_diameter],
                            rounding=assembly_screw_receiver_rounding,
                            edges=LEFT + FRONT + BOTTOM,
                            anchor=LEFT + BACK + BOTTOM)
                            position(LEFT + BACK + BOTTOM)
                                translate([assembly_screw_receiver_diameter / 2, 0, assembly_screw_receiver_diameter / 2])
                                assembly_screw_hole_threaded(BACK, tag="inner_remove");
                }
            translate(point3d(mouse_buttons_shell_wall_start + straight_shell_length * thumb_cluster_unit_vector, mouse_buttons_additional_height))
                rotate([90, 0, thumb_cluster_wall_angle + 90]) {
                    vnf_polyhedron(vnf_palm_end_solid, convexity=10);
                    cuboid([10, 10, 10], anchor=RIGHT + BACK + TOP);
                }
        }
        // the upper assembly screw receiver on the mini button side
        translate(point3d(mouse_buttons_shell_wall_start,
                          mouse_buttons_additional_height - mouse_button_thickness))
            zrot(thumb_cluster_wall_angle)
                left(mouse_button_thickness * cos(thumb_cluster_wall_angle))
                tag_diff("keep", "inner_remove", "inner_keep")
                cuboid([assembly_screw_receiver_diameter, assembly_screw_threading_total_length, assembly_screw_receiver_diameter],
                    rounding=assembly_screw_receiver_rounding,
                    edges=[BOTTOM, FRONT],
                    except=BACK,
                    anchor=LEFT + BACK + TOP)
                    position(BACK)
                        assembly_screw_hole_threaded(BACK, tag="inner_remove");
        
        translate(point3d(mouse_buttons_shell_wall_start,
                          mouse_buttons_additional_height - mouse_button_thickness))
            zrot(thumb_cluster_wall_angle)
                right(40)
                cuboid([8, wall_thickness, 2],
                       rounding=1,
                       edges=FRONT,
                       except=TOP,
                       anchor=BACK + TOP);

        mouse_buttons_thumb_tip_end_polyhedron();
        translate([mouse_buttons_shell_wall_start.x, mouse_buttons_shell_wall_start.y + 1, 0])
            cuboid([mouse_button_thickness, 2, mouse_buttons_additional_height - mouse_button_thickness],
                   anchor=RIGHT + FRONT + BOTTOM);

        vertex_grid_palm_end = [
            for (i = [0:1 / min($fn, 100):1]) 
                right(
                    mouse_buttons_back_thickness,
                    yrot(
                        90 * i,
                        path3d(left(
                            mouse_buttons_back_thickness,
                            mouse_buttons_shell_path(mouse_buttons_palm_end_scaling(i), lowered_top=mouse_button_palm_end_droop)))))];
        vertex_grid_palm_end_solid = [
            for (i = [0:1 / min($fn, 100):1]) 
                right(
                    mouse_buttons_back_thickness,
                    yrot(
                        90 * i,
                        path3d(left(
                            mouse_buttons_back_thickness,
                            mouse_buttons_shell_path(mouse_buttons_palm_end_scaling(i), lowered_top=mouse_button_palm_end_droop, path_type="solid")))))];
        vnf_palm_end = vnf_vertex_array(vertex_grid_palm_end, caps=true, col_wrap=true, reverse=true);
        vnf_palm_end_solid = vnf_vertex_array(vertex_grid_palm_end_solid, caps=true, col_wrap=true, reverse=true);
        difference() {
            translate(point3d(mouse_buttons_shell_wall_start + straight_shell_length * thumb_cluster_unit_vector, mouse_buttons_additional_height))
                rotate([90, 0, thumb_cluster_wall_angle + 90]) {
                    vnf_polyhedron(vnf_palm_end, convexity=10);
                }
            thumb_cluster_wall_palm_end(EXTRA);
        }
        tag("remove") {
            mouse_buttons_back_wall_undecorated();
            side_wall_undecorated(wall_thickness);
        }
        force_tag("remove")
            top_shell_undecorated();

        top_start_point = mouse_buttons_shell_wall_start - mouse_buttons_thumb_tip_end_scaling(1)[0] * mouse_buttons_straight_width * sin(thumb_cluster_wall_angle + 180) * thumb_cluster_unit_vector;
        translate(point3d(top_start_point, mouse_buttons_additional_height))
            rotate(thumb_cluster_wall_angle + 90) {
                cuboid([mouse_buttons_back_thickness,
                        glove80_thumb_cluster_length + mouse_buttons_additional_length + mouse_buttons_back_thickness - palm_end_length - 1,
                        mouse_button_thickness],
                       rounding=mouse_button_thickness,
                       edges=LEFT + FRONT,
                       anchor=TOP + LEFT + BACK) {
                    // chamfer the corner of the cuboid *and* the palm-end vnf_polyhedron
                    fwd(6.25)
                    edge_profile(TOP + RIGHT, excess=5)
                        mask2d_chamfer(x=sidecar_outer_edge_chamfer, y=sidecar_outer_edge_chamfer);
                }
            }
    }
    
    // TODO: grooves for fingers
    // TODO: walls under the buttons to keep dust out
    // TODO: add some shaping to the top of the mini-buttons so that they're easier to feel and hit
}

// !mouse_buttons_shell_for_printing();
module mouse_buttons_shell_for_printing() {
    down(60)
    xrot(-90)
    zrot(-thumb_cluster_wall_angle)
    render()
    mouse_buttons_shell();
}

module mouse_button(size, rounding, edges, anchor, inner_anchor) {
    cuboid([size.x + mouse_button_cutout_width, size.y + mouse_button_cutout_width, size.z],
            rounding=rounding + mouse_button_cutout_width / 2,
            edges=edges,
            anchor=anchor + BOTTOM)
        position(inner_anchor)
            tag("inner_remove")
            cuboid([size.x, size.y - mouse_button_cutout_width, size.z],
                    rounding=rounding - mouse_button_cutout_width / 2,
                    edges=edges,
                    anchor=inner_anchor);
}

module mouse_button_cutouts() {
    // this value doesn't matter so long as it's large
    cutout_height = 200;
    mini_buttons_x_offset = mouse_wheel_pcb_x - left_button_switch_mini_button_switch_x;
    extra_left_button_width = mouse_wheel_switch_width / 2 + mouse_wheel_mount_width / 2 + 2 * mouse_wheel_mount_cover_width + 0.1;// - mouse_wheel_mount_cover_clearance;
    tag_diff("remove", "inner_remove", "inner_keep") {
        // left button
        translate([-mini_buttons_x_offset - mouse_button_cutout_width / 2 + width_between_mouse_buttons,
                   -(mouse_wheel_switch_width / 2 + mouse_wheel_mount_cover_width + mouse_wheel_mount_cover_clearance) + mouse_button_cutout_width]) {
            mouse_button([mouse_button_length - 12, mouse_button_width_left - mouse_wheel_switch_width / 2 - mouse_wheel_mount_cover_width - mouse_wheel_mount_cover_clearance, cutout_height], 
                            rounding=mouse_button_rounding,
                            edges=FRONT + LEFT,
                            anchor=BACK + LEFT,
                            inner_anchor=RIGHT);
            cuboid([20, extra_left_button_width, cutout_height],
                   rounding=mouse_button_rounding + mouse_button_cutout_width,
                   edges=BACK + LEFT,
                   anchor=FRONT + LEFT);
            tag("inner_remove")
                translate([mouse_button_cutout_width, -mouse_button_cutout_width])
                cuboid([20, extra_left_button_width, cutout_height],
                    rounding=mouse_button_rounding,
                    edges=BACK + LEFT,
                    anchor=FRONT + LEFT);
        }
        // right button
        translate([mouse_wheel_opening_width / 2 - mouse_button_cutout_width, -(mouse_wheel_switch_width / 2 + mouse_wheel_mount_cover_width + mouse_wheel_mount_cover_clearance)]) {
            mouse_button([mouse_button_length - mini_buttons_x_offset - mouse_wheel_opening_width / 2 + mouse_button_cutout_width / 2 + width_between_mouse_buttons + 6,
                          mouse_button_width_right + mouse_wheel_switch_width / 2 + mouse_wheel_mount_cover_width + mouse_wheel_mount_cover_clearance - mouse_button_cutout_width / 2 - 2,
                          cutout_height],
                         rounding=mouse_button_rounding,
                         edges=BACK + LEFT,
                         anchor=FRONT + LEFT,
                         inner_anchor=RIGHT);
        }
        
        // left mini button
        translate([-mini_buttons_x_offset + mouse_button_cutout_width / 2, mouse_button_cutout_width / 2])
            mouse_button([mini_mouse_button_length, mouse_button_width_left, cutout_height],
                        rounding=mouse_button_rounding,
                        edges=FRONT + RIGHT,
                        anchor=BACK + RIGHT,
                        inner_anchor=LEFT);
        // right mini button
        translate([-mini_buttons_x_offset + mouse_button_cutout_width / 2, -mouse_button_cutout_width / 2])
            mouse_button([mini_mouse_button_length, mouse_button_width_right, cutout_height],
                            rounding=mouse_button_rounding,
                            edges=BACK + RIGHT,
                            anchor=FRONT + RIGHT,
                            inner_anchor=LEFT);
    }
    // cutouts for the mouse wheel mount and switch/axle
    tag("remove") {
        cuboid([mouse_wheel_mount_length_from_center + mouse_wheel_mount_cover_width + mouse_wheel_mount_cover_clearance,
                mouse_wheel_mount_width + 2 * (mouse_wheel_mount_cover_width + mouse_wheel_mount_cover_clearance),
                cutout_height],
               rounding=mouse_wheel_mount_cover_side_rounding + mouse_wheel_mount_cover_clearance,
               edges="Z",
               except=BACK + LEFT,
               anchor=RIGHT);
        cuboid([mouse_wheel_switch_length_from_center + mouse_wheel_mount_cover_width + mouse_wheel_mount_cover_clearance,
                mouse_wheel_switch_width + 2 * (mouse_wheel_mount_cover_width + mouse_wheel_mount_cover_clearance),
                cutout_height],
               rounding=mouse_wheel_mount_cover_side_rounding,
               edges="Z",
               except=FRONT + RIGHT,
               anchor=LEFT);
    }
    
}

module mouse_button_pcb_placeholder() {
    translate(point3d(mouse_buttons_shell_wall_start))
        rotate([mouse_buttons_pcb_x_rotate, 0, thumb_cluster_wall_angle])
            translate([mouse_buttons_and_wheel_x_offset - mouse_buttons_pcb_x_offset,
                       mouse_buttons_pcb_y_offset,
                       mouse_buttons_pcb_placeholder_z_offset - wall_thickness + mouse_buttons_back_thickness]) {
                diff()
                    cuboid([52, 31.5, 8], anchor=LEFT + BACK + BOTTOM) {
                        position(LEFT + TOP)
                            right(6)
                            cuboid([52 - 6, 31.5, 2], anchor=LEFT + BOTTOM)
                                position(LEFT + TOP)
                                    right(8)
                                    cuboid([52 - 6 - 8 - 8, 31.5, 6], anchor=LEFT + BOTTOM);
                    }
                translate([mouse_wheel_pcb_x, mouse_wheel_pcb_y, mouse_buttons_pcb_thickness + mouse_wheel_elevation])
                    xcyl(h=10.5, r=14, rounding=4);
    }
}

// !mouse_button_pcb_placeholder();

// !diff() {
//     cuboid([31.5, 55, 1.5], anchor=BACK);
//     back(20)
//         cuboid([80, 80, 1], anchor=BACK + TOP);
//     mouse_button_cutouts();
// }

module mouse_buttons_back_wall_undecorated() {
    wall_length = norm(bottom_shell_wall_end_plus_wall_thickness[1] - (mouse_buttons_shell_wall_start + (straight_shell_length + mouse_buttons_back_thickness) * thumb_cluster_unit_vector)) + mouse_buttons_additional_length + wall_thickness * sin(thumb_cluster_wall_angle) + EXTRA;
    translate(point3d(bottom_shell_wall_end_plus_wall_thickness[1], mouse_buttons_additional_height - mouse_button_thickness))
        rotate(thumb_cluster_wall_angle + 90) 
            translate([wall_thickness - mouse_buttons_back_thickness, mouse_buttons_additional_length + wall_thickness * sin(thumb_cluster_wall_angle), 0])
                // the wall between the keyboard and the mouse thumb clusters
                cuboid([mouse_buttons_back_thickness,
                        wall_length - 0.01,
                        case_height - mouse_button_thickness + mouse_buttons_additional_height],
                       anchor=TOP + LEFT + BACK)
                    children();
}

module mouse_buttons_back_wall() {
    diff() {
        mouse_buttons_back_wall_undecorated() {
            // the screw hole for the bottom rear mouse button shell assembly screw
            position(LEFT + BACK + TOP)
                up(mouse_wheel_pcb_y - mouse_buttons_pcb_y_offset - mouse_button_width_left - height_past_left_mouse_button + 2 * mouse_button_thickness)
                cuboid([assembly_screw_receiver_diameter + assembly_screw_mouse_buttons_bottom_rear_y_offset,
                        assembly_screw_receiver_diameter,
                        assembly_screw_threading_total_length],
                       rounding=assembly_screw_receiver_rounding,
                       edges=[TOP, LEFT],
                       except=BOTTOM,
                       anchor=RIGHT + BACK + BOTTOM)
                    position(LEFT + BOTTOM)
                        right(assembly_screw_receiver_diameter / 2)
                        assembly_screw_hole_threaded();
                    
            tag("remove") {
                position(LEFT + FRONT + BOTTOM)
                    back(assembly_screw_receiver_diameter / 2) {
                        zcopies([case_height - lower_sidecar_mount_z_offset_top + lower_sidecar_mount_delta_z - assembly_screw_receiver_diameter / 2,
                                bottom_floor_thickness + assembly_screw_receiver_diameter / 2])
                        exposed_assembly_screw_hole_unthreaded(orient=LEFT);
                }
                position(LEFT + BACK + TOP)
                    translate([0, -assembly_screw_receiver_diameter / 2, -mouse_buttons_additional_height - assembly_screw_receiver_diameter / 2 - 1])
                        exposed_assembly_screw_hole_unthreaded(orient=LEFT);
                position(BACK + TOP)
                    translate([0, -assembly_screw_receiver_diameter, mouse_wheel_pcb_y - mouse_buttons_pcb_y_offset - mouse_button_width_left - height_past_left_mouse_button + 2 * mouse_button_thickness])
                        cuboid([mouse_buttons_back_thickness + 2 * EXTRA, 15, 7.5],
                               rounding=2,
                               edges="X",
                               anchor=BACK + BOTTOM);
                // the screw hole for the upper rear assembly screw that connects to the mouse button shell
                position(RIGHT + BACK + TOP)
                    translate([0, -assembly_screw_receiver_diameter / 2, -assembly_screw_receiver_diameter / 2])
                        exposed_assembly_screw_hole_unthreaded(orient=RIGHT);
                // the screw hole for the upper front assembly screw that connects to the mouse button shell
                position(RIGHT + FRONT + TOP)
                    translate([0,
                              -assembly_screw_receiver_diameter / 2 + assembly_screw_mouse_buttons_top_front_x_offset + mouse_button_thickness,
                              mouse_wheel_pcb_y - mouse_buttons_pcb_y_offset + assembly_screw_mouse_buttons_top_front_z_offset + mouse_button_thickness + assembly_screw_receiver_diameter / 2])
                        exposed_assembly_screw_hole_unthreaded(orient=RIGHT);
                // the screw hole for the lower front assembly screw that connects to the mouse button shell
                position(RIGHT + FRONT + TOP)
                    translate([0,
                              -assembly_screw_receiver_diameter / 2 + mouse_button_thickness - assembly_screw_mouse_buttons_bottom_front_x_offset,
                              mouse_wheel_pcb_y - mouse_buttons_pcb_y_offset - mouse_button_width_left - height_past_left_mouse_button + 2 * mouse_button_thickness + assembly_screw_receiver_diameter / 2])
                        exposed_assembly_screw_hole_unthreaded(orient=RIGHT);
                    
            }
        }
        translate(point3d(assembly_screw_bottom_shell_mouse_buttons_back_wall_loc,
                          -case_height + bottom_floor_thickness + assembly_screw_receiver_diameter / 2))
            zrot(thumb_cluster_wall_angle)
            back(wall_thickness + EXTRA)
            tag("remove")
            exposed_assembly_screw_hole_unthreaded(orient=FRONT, anchor=BOTTOM);
        force_tag("")
            thumb_cluster_wall_palm_end();
    }
    translate(point3d(mouse_buttons_shell_wall_start))
        intersection() {
            rotate([mouse_buttons_pcb_x_rotate, 0, thumb_cluster_wall_angle])
                translate([mouse_buttons_and_wheel_x_offset - mouse_buttons_pcb_x_offset,
                          mouse_buttons_pcb_y_offset,
                          mouse_buttons_pcb_z_offset])
                    mouse_buttons_pcb_mount(mouse_buttons_pcb_z_offset + EXTRA);
            zrot(thumb_cluster_wall_angle)
                translate([0, wall_thickness - mouse_buttons_back_thickness, mouse_buttons_additional_height])
                cuboid([200, 100, case_height + mouse_buttons_additional_height - bottom_floor_thickness], anchor=TOP + BACK);
        }
}

module mouse_buttons_pcb_mount(height) {
    translate(mouse_buttons_pcb_screw_hole_without_peg_coords)
        diff() {
            cyl(d=5, h=height, anchor=TOP);
            tag("remove")
                screw_hole(mouse_button_screw_type, thread=true, length=mouse_button_screw_hole_length, $slop=mouse_button_screw_slop, anchor=TOP);
        }
    translate(mouse_buttons_pcb_peg_and_screw_hole_upper_coords)
        mouse_buttons_pcb_peg_and_screw_hole_mount(height);
    translate(mouse_buttons_pcb_peg_and_screw_hole_lower_coords)
        mouse_buttons_pcb_peg_and_screw_hole_mount(height);

    // the supports under the middle and right button switches
    translate([mouse_wheel_pcb_x + 6.5, mouse_wheel_pcb_y - 3.25])
        cuboid([11, 0.8, height], anchor=TOP + LEFT);
    translate([mouse_wheel_pcb_x + 6.5, mouse_wheel_pcb_y + 3.25])
        cuboid([11, 0.8, height], anchor=TOP + LEFT);
    translate([mouse_wheel_pcb_x + 10.5, mouse_wheel_pcb_y, -2])
        cuboid([0.8, 6.5, height - 2], anchor=TOP);
    translate([mouse_wheel_pcb_x + 14.5, mouse_wheel_pcb_y, -2])
        cuboid([0.8, 6.5, height - 2], anchor=TOP);
    
    // the support under the left button and mini buttons switches
    translate([mouse_wheel_pcb_x - 15, mouse_wheel_pcb_y + 8])
        cuboid([0.8, 11, height], anchor=TOP + BACK);
    translate([mouse_wheel_pcb_x - 21.5, mouse_wheel_pcb_y + 5])
        cuboid([0.8, 10, height], anchor=TOP + BACK);
    translate([mouse_wheel_pcb_x - 26.5, mouse_wheel_pcb_y + 5])
        cuboid([0.8, 10, height], anchor=TOP + BACK);
    translate([mouse_wheel_pcb_x - 26.5, mouse_wheel_pcb_y + 4, -2])
        cuboid([20, 0.8, height - 2], anchor=TOP + BACK + LEFT);
    translate([mouse_wheel_pcb_x - 26.5, mouse_wheel_pcb_y - 3, -2])
        cuboid([20, 0.8, height - 2], anchor=TOP + FRONT + LEFT);

    // supports for mouse wheel axle
    axle_support_thickness = 1.5;
    axle_support_height_mount_end = 8 - mouse_buttons_pcb_thickness;
    axle_support_opening_diameter_mount_end = 4.5;
    
    axle_support_height_switch_end = 7 - mouse_buttons_pcb_thickness;
    axle_support_opening_diameter_switch_end = 5.5;
    translate([mouse_wheel_pcb_x - 6.25, mouse_wheel_pcb_y, -height])
        diff()
        cuboid([axle_support_thickness,
               10,
               height + mouse_buttons_pcb_thickness + mouse_wheel_mount_height - mouse_wheel_mount_cover_top_rounding],
              anchor=BOTTOM) {
            position(TOP)
                tag("remove")
                cuboid([axle_support_thickness + 2 * EXTRA,
                        axle_support_opening_diameter_mount_end,
                        mouse_wheel_mount_height - mouse_wheel_mount_cover_top_rounding - axle_support_height_mount_end - axle_support_opening_diameter_mount_end / 2],
                       anchor=TOP)
                    position(BOTTOM)
                        xcyl(d=axle_support_opening_diameter_mount_end, h=axle_support_thickness + 2 * EXTRA);
            edge_profile(BOTTOM + RIGHT)
                tag("")
                xflip()
                yscale(2)
                mask2d_roundover(r=3.5);
            edge_profile(BOTTOM + LEFT)
                tag("")
                xflip()
                yscale(2)
                mask2d_roundover(r=2);
        }
    translate([mouse_wheel_pcb_x + 6.25, mouse_wheel_pcb_y, -height])
        diff()
        cuboid([axle_support_thickness,
                7.75,
                height + mouse_buttons_pcb_thickness + mouse_wheel_switch_height - mouse_wheel_mount_cover_top_rounding],
               anchor=BOTTOM) {
            position(TOP)
                tag("remove")
                cuboid([axle_support_thickness + 2 * EXTRA,
                        axle_support_opening_diameter_switch_end,
                        mouse_wheel_switch_height - mouse_wheel_mount_cover_top_rounding - axle_support_height_switch_end - axle_support_opening_diameter_switch_end / 2],
                       anchor=TOP)
                    position(BOTTOM)
                        xcyl(d=axle_support_opening_diameter_switch_end, h=axle_support_thickness + 2 * EXTRA);
            edge_profile(BOTTOM + LEFT)
                tag("")
                xflip()
                yscale(2)
                mask2d_roundover(r=3.5);
        }
}

module mouse_buttons_switch_pads(height) {
    translate([3, -7.25, -mouse_button_mini_pad_reduced_elevation])
        // right mini mouse button pad
        cuboid([mouse_button_mini_pad_width, mouse_button_mini_pad_width, height + mouse_button_mini_pad_reduced_elevation],
               rounding=0.5,
               edges="Z",
               anchor=BOTTOM);
    translate([3, -15.25 + mouse_button_mini_pad_width / 2, -mouse_button_mini_pad_reduced_elevation])
        // left mini mouse button pad
        cuboid([mouse_button_mini_pad_width, mouse_button_mini_pad_width + 4, height],
               rounding=0.5,
               edges="Z",
               anchor=BACK + BOTTOM);
    diff("inner_remove", "inner_keep")
        translate([8.8, -7.6 + mouse_button_main_pad_width / 2, 0])
            // left button pad
            cuboid([30, mouse_button_main_pad_width + 21.75, 50],
                rounding=3,
                edges=[LEFT + FRONT, LEFT + BACK],
                anchor=LEFT + BACK + BOTTOM)
                tag("inner_remove") {
                    edge_profile(RIGHT + BOTTOM)
                        // taper the edge near the hinge
                        mask2d_chamfer(x=5, y=8);
                    edge_profile(RIGHT + BACK)
                        // make sure the shape doesn't intersect the right mouse button
                        mask2d_chamfer(x=8, y=8);
                }
    translate([49 + mouse_button_main_pad_width / 2, -15 - mouse_button_main_pad_width / 2, 0])
        // right button pad
        cuboid([mouse_button_main_pad_width + 15, mouse_button_main_pad_width + 10, 2],
               rounding=0.5,
               edges="Z",
               anchor=BOTTOM + RIGHT + FRONT);
}

module mouse_buttons_pcb_peg_and_screw_hole_mount(height) {
    left(1.25)
        diff()
            cuboid([7, 4.25, height], rounding=1.25, edges=[LEFT + FRONT, LEFT + BACK], anchor=TOP + LEFT)
                position(TOP + LEFT) {
                    right(1.25)
                        cyl(d=mouse_button_peg_diameter,
                            h=mouse_buttons_pcb_thickness + mouse_buttons_upper_pcb_holder_thickness,
                            anchor=BOTTOM);
                    right(4.5)
                        tag("remove")
                        screw_hole(mouse_button_screw_type, thread=true, length=mouse_button_screw_hole_length, $slop=mouse_button_screw_slop, anchor=TOP);
                }
}

// uncomment for PCB mount test
// !union(){
//     color("burlywood")
//         cuboid([70, 51, 1], anchor=TOP + BACK + LEFT);
//     up(10)
//         mouse_buttons_pcb_mount(10);
// }

module mouse_buttons_upper_pcb_holder_in_position() {
    translate(point3d(mouse_buttons_shell_wall_start))
        rotate([mouse_buttons_pcb_x_rotate, 0, thumb_cluster_wall_angle])
            translate([mouse_buttons_and_wheel_x_offset - mouse_buttons_pcb_x_offset, mouse_buttons_pcb_y_offset, mouse_buttons_pcb_z_offset + mouse_buttons_pcb_thickness])
                mouse_buttons_upper_pcb_holder();
}

module mouse_buttons_upper_pcb_holder() {
    // the screw hole without an accompanying peg hole
    translate(mouse_buttons_pcb_screw_hole_without_peg_coords) {
        diff() {
            cyl(d=5, h=mouse_buttons_upper_pcb_holder_thickness, anchor=BOTTOM);
            cyl(d=6, h=mouse_buttons_upper_pcb_holder_elevation_above_pcb + mouse_buttons_upper_pcb_holder_thickness, anchor=BOTTOM);
            tag("remove")
                screw_hole(mouse_button_screw_type, thread=false, length=mouse_buttons_upper_pcb_holder_thickness + EXTRA, $slop=mouse_button_screw_slop, anchor=BOTTOM)
                    position(TOP)
                        cyl(d=5, h=mouse_buttons_upper_pcb_holder_elevation_above_pcb + EXTRA, anchor=BOTTOM);
            up(mouse_buttons_upper_pcb_holder_elevation_above_pcb)
                cuboid([6,
                        mouse_buttons_pcb_screw_hole_without_peg_coords.y - mouse_wheel_pcb_y - mouse_wheel_mount_width / 2 - EXTRA,
                        mouse_buttons_upper_pcb_holder_thickness],
                    anchor=BACK + BOTTOM);
        }
    }

    // the screw and peg holes under the right mouse button
    translate(mouse_buttons_pcb_peg_and_screw_hole_upper_coords)
        left(2.25)
        diff()
            cuboid([8, 4.25, mouse_buttons_upper_pcb_holder_thickness],
                   rounding=1.25,
                   edges=[LEFT + BACK, RIGHT + BACK],
                   anchor=BOTTOM + LEFT) {
                position(BOTTOM + LEFT)
                    down(EXTRA)
                    tag("remove") {
                        right(2.25)
                            cyl(d=mouse_button_peg_diameter + mouse_button_peg_clearance,
                                h=mouse_buttons_upper_pcb_holder_thickness + 2 * EXTRA,
                                anchor=BOTTOM);
                        right(5.5)
                            screw_hole(mouse_button_screw_type,
                                       thread=false,
                                       length=mouse_buttons_upper_pcb_holder_thickness + 2 * EXTRA,
                                       anchor=BOTTOM);
                    }
                position(FRONT)
                    cuboid([8,
                            mouse_buttons_pcb_peg_and_screw_hole_upper_coords.y - 4.25 / 2 - mouse_wheel_pcb_y - mouse_wheel_switch_width / 2,
                            mouse_buttons_upper_pcb_holder_thickness],
                           chamfer=1,
                           edges=FRONT + BOTTOM,
                           anchor=BACK)
                        edge_profile(FRONT + RIGHT)
                            mask2d_roundover(1.25);
            }

    // the screw and peg holes under the left mouse button, plus the bars that connect it to the two covers
    bar_width = 6.5;
    plate_width = 6.5;
    plate_length = 9;
    left_overlap_length = 2.25;
    right_overlap_length = 2.5;
    mouse_wheel_mount_length = mouse_wheel_mount_length_from_center - mouse_wheel_opening_width / 2 - mouse_wheel_mount_cover_clearance_from_wheel;
    translate(mouse_buttons_pcb_peg_and_screw_hole_lower_coords)
        left(left_overlap_length + mouse_wheel_mount_cover_width)
        diff()
            cuboid([plate_length + 2 * mouse_wheel_mount_cover_width, plate_width, mouse_buttons_upper_pcb_holder_thickness],
                   anchor=BOTTOM + LEFT) {
                position(BOTTOM + LEFT)
                    down(EXTRA)
                    tag("remove") {
                        right(left_overlap_length + mouse_wheel_mount_cover_width) {
                            cyl(d=mouse_button_peg_diameter + mouse_button_peg_clearance, h=mouse_buttons_upper_pcb_holder_thickness + 2 * EXTRA, anchor=BOTTOM);
                            right(3)
                                screw_hole(mouse_button_screw_type, thread=false, length=mouse_buttons_upper_pcb_holder_thickness + 2 * EXTRA, anchor=BOTTOM);
                        }
                    }
                translate([left_overlap_length, 0, mouse_buttons_upper_pcb_holder_elevation_above_pcb - mouse_buttons_upper_pcb_holder_thickness])
                    position(LEFT + FRONT + TOP) {
                        x_width = mouse_buttons_pcb_peg_and_screw_hole_lower_coords.x - 1.25 - (mouse_wheel_pcb_x - mouse_wheel_mount_length_from_center - mouse_wheel_mount_cover_width);
                        y_length = -(mouse_buttons_pcb_peg_and_screw_hole_lower_coords.y + bar_width / 2 - (mouse_wheel_pcb_y - mouse_wheel_mount_width / 2));
                        // TODO: figure out why I needed to repair this geometry in the slicer
                        cuboid([x_width, y_length + bar_width, mouse_buttons_upper_pcb_holder_thickness],
                                rounding=2,
                                edges=LEFT + FRONT,
                                anchor=RIGHT + FRONT + BOTTOM)
                            position(RIGHT + BACK)
                                cuboid([mouse_wheel_mount_length - x_width + mouse_wheel_mount_cover_width,
                                        y_length,
                                        mouse_buttons_upper_pcb_holder_thickness],
                                       anchor=LEFT + BACK)
                                position(FRONT + BOTTOM)
                                    cuboid([mouse_wheel_mount_length - x_width + mouse_wheel_mount_cover_width,
                                            1.5,
                                            mouse_buttons_upper_pcb_holder_elevation_above_pcb],
                                           anchor=FRONT + TOP);
                    }
                translate([-right_overlap_length, 0, mouse_buttons_upper_pcb_holder_elevation_above_pcb - mouse_buttons_upper_pcb_holder_thickness])
                    position(RIGHT + TOP) {
                        y_thickness = 5;
                        x_length = mouse_wheel_pcb_x + mouse_wheel_opening_width / 2 + y_thickness - (mouse_buttons_pcb_peg_and_screw_hole_lower_coords.x + 8 - right_overlap_length) + mouse_wheel_mount_cover_clearance_from_wheel;
                        y_length = -(mouse_buttons_pcb_peg_and_screw_hole_lower_coords.y + bar_width / 2 - (mouse_wheel_pcb_y - mouse_wheel_switch_width / 2));
                        cuboid([x_length + 2, bar_width, mouse_buttons_upper_pcb_holder_thickness],
                                rounding=2,
                                edges=RIGHT + FRONT,
                                anchor=LEFT + BOTTOM) {
                            position(RIGHT + BACK)
                                cuboid([y_thickness + 2, y_length, mouse_buttons_upper_pcb_holder_thickness],
                                        edges=LEFT + TOP,
                                        anchor=RIGHT + FRONT);
                        }
                    }
            }

    // the cover for the mouse wheel mount (on the thumb tip side of the mouse wheel)
    translate([mouse_wheel_pcb_x - mouse_wheel_opening_width / 2 - mouse_wheel_mount_cover_clearance_from_wheel,
               mouse_wheel_pcb_y,
               mouse_buttons_upper_pcb_holder_elevation_above_pcb])
        diff()
        cuboid([mouse_wheel_mount_length + mouse_wheel_mount_cover_width,
                mouse_wheel_mount_width + 2 * mouse_wheel_mount_cover_width,
                mouse_wheel_mount_height + mouse_wheel_mount_cover_top_thickness - mouse_buttons_upper_pcb_holder_elevation_above_pcb],
               rounding=mouse_wheel_mount_cover_top_rounding + mouse_wheel_mount_cover_width,
               edges=[TOP + BACK, TOP + FRONT],
               anchor=RIGHT + BOTTOM) {
            edge_profile([LEFT + FRONT, LEFT + BACK, LEFT + TOP])
                mask2d_roundover(mouse_wheel_mount_cover_side_rounding);
            position(RIGHT + BOTTOM)
                tag("remove")
                    cuboid([mouse_wheel_mount_length,
                            mouse_wheel_mount_width,
                            mouse_wheel_mount_height - mouse_buttons_upper_pcb_holder_elevation_above_pcb],
                           rounding=mouse_wheel_mount_cover_top_rounding,
                           edges=[TOP + BACK, TOP + FRONT],
                           anchor=RIGHT + BOTTOM);
        }

    // the cover for the mouse wheel switch (on the palm side of the mouse wheel)
    mouse_wheel_switch_length = mouse_wheel_switch_length_from_center - 2 - mouse_wheel_opening_width / 2;
    translate([mouse_wheel_pcb_x + mouse_wheel_opening_width / 2 + mouse_wheel_mount_cover_clearance_from_wheel,
               mouse_wheel_pcb_y,
               mouse_buttons_upper_pcb_holder_elevation_above_pcb])
        diff()
        cuboid([mouse_wheel_switch_length + mouse_wheel_mount_cover_width,
                mouse_wheel_switch_width + 2 * mouse_wheel_mount_cover_width,
                mouse_wheel_switch_height + mouse_wheel_mount_cover_top_thickness - mouse_buttons_upper_pcb_holder_elevation_above_pcb],
               rounding=mouse_wheel_mount_cover_top_rounding + mouse_wheel_mount_cover_width,
               edges=[TOP + BACK, TOP + FRONT],
               anchor=LEFT + BOTTOM) {
            edge_profile([RIGHT + FRONT, RIGHT + BACK, RIGHT + TOP])
                mask2d_roundover(mouse_wheel_mount_cover_side_rounding);
            tag("remove") {
                position(LEFT + BOTTOM)
                        cuboid([mouse_wheel_switch_length,
                                mouse_wheel_switch_width,
                                mouse_wheel_switch_height - mouse_buttons_upper_pcb_holder_elevation_above_pcb],
                            rounding=mouse_wheel_mount_cover_top_rounding,
                            edges=[TOP + BACK, TOP + FRONT],
                            anchor=LEFT + BOTTOM);
                // leave a cutout for the middle button switch, since the space
                // between that and the right button switch is too narrow for
                // the cover to fit
                position(RIGHT + BOTTOM)
                    translate([EXTRA, 0, -EXTRA])
                    cuboid([mouse_wheel_mount_cover_width + 2 * EXTRA,
                            mouse_wheel_switch_width,
                            6.75 - mouse_buttons_upper_pcb_holder_elevation_above_pcb + EXTRA],
                           anchor=RIGHT + BOTTOM);
            }
        }
}

leg_post_upper_width = (leg_post_lower_diameter + leg_post_screw_size + leg_post_screw_clearance) / 2 + leg_post_wall_thickness;
module rear_wall() {
    sidecar_angle_top_width = top_x_offset * (sidecar_angled_portion_height - top_shell_thickness) / sidecar_angled_portion_height;
    
    leg_post_lower_height = leg_threaded_insert_length + leg_threaded_insert_extra_length - bottom_floor_thickness;
    leg_post_upper_height = case_height - bottom_floor_thickness - top_shell_thickness - leg_post_lower_height;
    
    diff()
        translate([-wall_thickness, sidecar_upper_length_bottom, -top_shell_thickness])
            cuboid([rear_wall_width,
                    wall_thickness,
                    case_height - wall_thickness - top_shell_thickness],
                    anchor=BACK + TOP + RIGHT) {
                position(TOP + RIGHT + BACK)
                    // angled potion of the wall to match the sidecar wall
                    cuboid([sidecar_angle_top_width,
                            wall_thickness + battery_compartment_inner_wall_thickness + battery_compartment_cover_spacing,
                            sidecar_angled_portion_height - top_shell_thickness],
                            anchor=TOP + LEFT + BACK) {
                        edge_profile(BOTTOM + RIGHT)
                            mask2d_chamfer(x=sidecar_angle_top_width, y=sidecar_angled_portion_height - top_shell_thickness);
                        position(TOP + LEFT)
                            cuboid([assembly_screw_receiver_diameter + assembly_screw_receiver_diameter * top_x_offset / sidecar_angled_portion_height - sidecar_angle_top_width,
                                    wall_thickness + battery_compartment_inner_wall_thickness + battery_compartment_cover_spacing,
                                    case_height - battery_compartment_cover_height - battery_compartment_inner_wall_thickness],
                                   anchor=TOP + RIGHT);
                    }
                position(BOTTOM + BACK)
                    cuboid([rear_wall_width, battery_compartment_total_depth, wall_thickness], anchor=TOP + BACK)
                        position(BOTTOM + FRONT + RIGHT)
                            // place to screw in the trackball holder
                            cuboid([2 * assembly_screw_receiver_diameter + assembly_screw_rear_wall_trackball_holder_x_offset + assembly_screw_rear_wall_trackball_holder_y_offset,
                                    assembly_screw_receiver_diameter + assembly_screw_rear_wall_trackball_holder_y_offset,
                                    bottom_floor_thickness],
                                   chamfer=assembly_screw_receiver_diameter + assembly_screw_rear_wall_trackball_holder_y_offset,
                                   edges=LEFT + FRONT,
                                   anchor=RIGHT + BACK + BOTTOM)
                                position(RIGHT + FRONT + BOTTOM)
                                    translate([-assembly_screw_receiver_diameter / 2 - assembly_screw_rear_wall_trackball_holder_x_offset, assembly_screw_receiver_diameter / 2, -EXTRA])
                                        assembly_screw_hole_unthreaded(bottom_floor_thickness);
                position(RIGHT + TOP + BACK) {
                    // screw hole for the top shell screw
                    translate([- 1.5 * assembly_screw_receiver_diameter, 0, -assembly_screw_receiver_diameter / 2])
                        assembly_screw_hole_unthreaded(wall_thickness, BACK);
                    // screw hole for the upper bottom shell screw
                    translate([top_x_offset - top_shell_thickness * top_x_offset / sidecar_angled_portion_height - assembly_screw_receiver_diameter * top_x_offset / sidecar_angled_portion_height - assembly_screw_receiver_diameter / 2,
                               0,
                               -assembly_screw_receiver_diameter / 2])
                        tag("remove")
                            ycyl(d=assembly_screw_head_diameter, h=wall_thickness + battery_compartment_inner_wall_thickness + battery_compartment_cover_spacing - 1.2, anchor=BACK)
                                position(FRONT)
                                    screw_hole(assembly_screw_type, thread=false, length=1.2 + EXTRA, orient=BACK, anchor=TOP);
                }
                position(BOTTOM + FRONT + LEFT)
                    // place to screw in a leg
                    cuboid([leg_post_lower_diameter, leg_post_lower_diameter, leg_post_lower_height],
                            anchor=BOTTOM + BACK + LEFT) {
                        position(BOTTOM + FRONT + LEFT) {
                            down(bottom_floor_thickness)
                                cuboid([wall_thickness, leg_post_lower_diameter + wall_thickness, case_height - top_shell_thickness],
                                    anchor=BOTTOM + FRONT + RIGHT);
                            translate([assembly_screw_receiver_diameter / 2 + assembly_screw_lower_side_rear_wall_x_offset, -assembly_screw_receiver_diameter / 2 - assembly_screw_lower_side_rear_wall_y_offset, -bottom_floor_thickness])
                            assembly_screw_hole_unthreaded(bottom_floor_thickness);
                        }
                        position(TOP + BACK + LEFT)
                            cuboid([leg_post_upper_width, leg_post_upper_width, leg_post_upper_height],
                                   rounding=(leg_post_screw_size + leg_post_screw_clearance + leg_post_wall_thickness) / 2,
                                   edges=FRONT + RIGHT,
                                   anchor=BOTTOM + BACK + LEFT)
                                position(LEFT + FRONT + TOP)
                                    down(top_shell_rim_height + top_shell_rim_radial_clearance)
                                    // place to screw in the side wall
                                    cuboid([assembly_screw_threading_total_length,
                                            assembly_screw_receiver_diameter + assembly_screw_upper_side_rear_wall_y_offset + leg_post_lower_diameter - leg_post_upper_width,
                                            assembly_screw_receiver_diameter],
                                           rounding=assembly_screw_receiver_rounding,
                                           edges=RIGHT + FRONT,
                                           anchor=LEFT + BACK + TOP) {
                                        position(FRONT + LEFT)
                                            back(assembly_screw_receiver_diameter / 2)
                                            tag("remove")
                                            assembly_screw_hole_threaded(LEFT);
                                        position(BACK + RIGHT)
                                            cuboid([assembly_screw_threading_total_length / 2,
                                                   (leg_post_screw_size + leg_post_screw_clearance + leg_post_wall_thickness) / 2,
                                                   assembly_screw_receiver_diameter],
                                                   anchor=FRONT + RIGHT);
                                    }
                        position(TOP + BACK)
                            cuboid([leg_post_lower_diameter, leg_post_upper_width, battery_compartment_height + 2 * battery_compartment_inner_wall_thickness - leg_post_lower_height],
                                   anchor=BOTTOM + BACK)
                                position(TOP + BACK + RIGHT)
                                    cuboid([leg_post_lower_diameter - leg_post_upper_width, battery_compartment_inner_wall_thickness, dongle_holder_outer_height + battery_compartment_inner_wall_thickness],
                                           anchor=BOTTOM + BACK + RIGHT);
                        position(BOTTOM)
                            tag("remove")
                            down(bottom_floor_thickness + EXTRA)
                            cyl(d=leg_threaded_insert_od, h=leg_post_lower_height + bottom_floor_thickness + EXTRA, anchor=BOTTOM)
                                position(TOP)
                                    cyl(d=leg_post_screw_size + leg_post_screw_clearance,
                                        h=leg_post_upper_height - leg_post_top_thickness,
                                        chamfer1=-(leg_threaded_insert_od - leg_post_screw_size + leg_post_screw_clearance) / 2,
                                        from_end=true,
                                        anchor=BOTTOM);
                        position(RIGHT + BOTTOM + BACK) {
                            battery_and_dongle_compartment(anchor=LEFT + BOTTOM + BACK);
                            tag("remove")
                                // make space for the battery compartment cover
                                translate([battery_compartment_inner_wall_thickness + battery_terminal_thickness + battery_terminal_divider_wall_thickness,
                                           -battery_compartment_cover_spacing,
                                           -bottom_floor_thickness]) {
                                cuboid([battery_compartment_internal_width,
                                        wall_thickness + battery_compartment_cover_spacing + EXTRA,
                                        battery_compartment_cover_height],
                                       chamfer=battery_compartment_cover_upper_chamfer,
                                       edges=[TOP + LEFT, TOP + RIGHT],
                                       anchor=LEFT + BOTTOM + FRONT) {
                                    position(BOTTOM + BACK)
                                        // cut out the floor of the battery compartment 
                                        cuboid([battery_compartment_internal_width,
                                                wall_thickness + battery_compartment_cover_floor_depth + EXTRA,
                                                battery_compartment_cover_floor_thickness],
                                               anchor=BOTTOM + BACK)
                                            position(TOP + FRONT)
                                                // cut out for the floor catch
                                                cuboid([battery_compartment_internal_width, battery_compartment_cover_floor_catch_thickness, bottom_floor_thickness - battery_compartment_cover_floor_thickness],
                                                       chamfer=battery_compartment_cover_chamfer,
                                                       edges=[TOP + FRONT, TOP + BACK],
                                                       anchor=BOTTOM + FRONT);
                                    position([BACK + LEFT + BOTTOM, BACK + RIGHT + BOTTOM])
                                        left(EXTRA * $attach_anchor[0].x)
                                            cuboid([battery_compartment_cover_thickness / 2, battery_compartment_cover_thickness, battery_compartment_cover_height - battery_compartment_cover_upper_chamfer],
                                                   chamfer=battery_compartment_cover_thickness / 2,
                                                   edges=[[$attach_anchor[0].x, 1, 0], [$attach_anchor[0].x, -1, 0]],
                                                   anchor=xflip($attach_anchor[0]));
                                    position(TOP + FRONT)
                                        translate([0, - battery_compartment_cover_clip_thickness, -2 * battery_compartment_inner_wall_thickness - dongle_holder_outer_height])
                                        // the catch for the battery compartment cover upper clip
                                        cuboid([battery_compartment_cover_clip_width,
                                                wall_thickness + battery_compartment_cover_spacing - battery_compartment_cover_clip_inset + battery_compartment_cover_clip_thickness / 2,
                                                dongle_holder_outer_height + battery_compartment_inner_wall_thickness + battery_compartment_inner_wall_thickness + battery_compartment_cover_clip_length + 0.1],
                                               anchor=BOTTOM + FRONT) {
                                            position(TOP + BACK)
                                                cuboid([battery_compartment_cover_clip_width,
                                                        battery_compartment_cover_clip_thickness / 2,
                                                        battery_compartment_cover_clip_thickness / 2 + 0.1],
                                                       anchor=TOP + FRONT);
                                        }
                                }
                                }
                        }
                    }
            }
}

battery_compartment_max_total_width = battery_compartment_max_internal_width + 2 * (battery_terminal_divider_wall_thickness + battery_terminal_thickness + battery_compartment_inner_wall_thickness);
battery_compartment_total_width = min(battery_compartment_max_total_width, rear_wall_width - leg_post_lower_diameter);
battery_compartment_internal_width = battery_compartment_total_width - 2 * (battery_terminal_divider_wall_thickness + battery_terminal_thickness + battery_compartment_inner_wall_thickness);
dongle_holder_mount_width = battery_compartment_internal_width - 2 * (battery_terminal_thickness + battery_terminal_divider_wall_thickness) - battery_terminal_nub_length - battery_terminal_spring_length;
module battery_and_dongle_compartment(anchor) {
    tag_scope()
    diff()
        cuboid([battery_compartment_total_width,
                battery_compartment_depth + battery_compartment_inner_wall_thickness + battery_compartment_cover_spacing,
                2 * battery_compartment_inner_wall_thickness + battery_compartment_height],
               anchor=anchor) {
            position(BACK + TOP) {
                translate([0, EXTRA, -battery_compartment_inner_wall_thickness])
                    tag("remove")
                    // the battery opening
                    cuboid([battery_compartment_internal_width,
                            battery_compartment_depth + battery_compartment_cover_spacing + EXTRA,
                            battery_compartment_height],
                          rounding = battery_compartment_height / 2 - EXTRA,
                          edges = [FRONT + TOP, FRONT + BOTTOM],
                          anchor=BACK + TOP)
                        position([BOTTOM + FRONT + LEFT, BOTTOM + FRONT + RIGHT])
                            translate([battery_terminal_divider_wall_thickness * $attach_anchor[0].x,
                                        battery_terminal_width / 2,
                                        0]) {
                                // cut openings at the top of the battery compartment for the spring and nub of the battery terminals
                                translate([EXTRA * $attach_anchor[0].x, 0, 1.5])
                                    tag_diff("remove", "inner_remove", "inner_keep")
                                    cuboid([battery_terminal_divider_wall_thickness + EXTRA + $attach_anchor[0].x < 0 ? battery_terminal_nub_length : battery_terminal_spring_length,
                                            battery_terminal_width - 2 * battery_terminal_divider_wall_width,
                                            battery_compartment_height + battery_compartment_inner_wall_thickness + EXTRA - 1.5],
                                        rounding=battery_terminal_width / 2 - battery_terminal_divider_wall_width - EXTRA,
                                        edges = [BOTTOM + FRONT, BOTTOM + BACK],
                                        anchor=[$attach_anchor[0].x, 0, -1])
                                        if ($attach_anchor[0].x < 0)
                                            tag("inner_remove")
                                            edge_profile([FRONT + RIGHT, BACK + RIGHT])
                                                mask2d_chamfer(x=battery_terminal_nub_length, y=battery_terminal_nub_length);
                                // cut openings at the top for the battery terminal plates
                                cuboid([battery_terminal_thickness,
                                        battery_terminal_width,
                                        battery_compartment_height + battery_compartment_inner_wall_thickness + EXTRA],
                                    anchor=[-$attach_anchor[0].x, 0, -1])
                                    position([[-$attach_anchor[0].x, 1, -1], [-$attach_anchor[0].x, -1, -1]])
                                        up(battery_terminal_dimple_height)
                                        cuboid([battery_terminal_divider_wall_thickness + EXTRA, 2 * battery_terminal_divider_wall_width, battery_terminal_dimple_size],
                                            chamfer=battery_terminal_dimple_size / 3,
                                            edges=[[0, $attach_anchor[0].y, 1], [0, $attach_anchor[0].y, -1]],
                                            anchor=[-$attach_anchor[0].x, $attach_anchor[0].y, 0]);
                                
                        }
                // the full width portion of the dongle shell
                cuboid([battery_compartment_total_width,
                        battery_compartment_inner_wall_thickness + battery_compartment_cover_spacing,
                        dongle_holder_outer_height + 2 * battery_compartment_inner_wall_thickness],
                       anchor=BACK + BOTTOM);
                left((battery_terminal_spring_length - battery_terminal_nub_length) / 2)
                    cuboid([dongle_holder_mount_width,
                            battery_compartment_cover_spacing + dongle_holder_top_depth + battery_compartment_inner_wall_thickness,
                            dongle_holder_outer_height + battery_compartment_inner_wall_thickness],
                           anchor=BACK + BOTTOM) {
                        position(BACK + TOP)
                            translate([0, EXTRA, -battery_compartment_inner_wall_thickness])
                            tag("remove")
                            // the cutout outside of the dongle itself
                            cuboid([dongle_holder_mount_width - 2 * battery_compartment_inner_wall_thickness,
                                    battery_compartment_cover_spacing + dongle_holder_top_depth + EXTRA,
                                    dongle_holder_outer_height + battery_compartment_inner_wall_thickness],
                                   anchor=BACK + TOP);
                        position(FRONT + TOP)
                            // the actual dongle compartment
                            cuboid([dongle_holder_width + 2 * battery_compartment_inner_wall_thickness,
                                    dongle_holder_depth,
                                    dongle_holder_outer_height + 2 * battery_compartment_inner_wall_thickness],
                                   chamfer=max(0, dongle_holder_top_depth + dongle_holder_depth - battery_compartment_depth),
                                   edges=[TOP, FRONT], except=BACK,
                                   anchor=BACK + TOP)
                                position(BACK)
                                    back(battery_compartment_inner_wall_thickness + EXTRA)
                                    tag("remove")
                                    cuboid([dongle_holder_width, dongle_holder_depth + EXTRA, dongle_holder_height],
                                        anchor=BACK);
                    }
            }
            position(LEFT + FRONT + BOTTOM)
                cuboid([assembly_screw_receiver_diameter, assembly_screw_receiver_diameter, assembly_screw_threading_total_length],
                       rounding=assembly_screw_receiver_rounding,
                       edges=[LEFT + FRONT, RIGHT + FRONT],
                       anchor=LEFT + BACK + BOTTOM)
                    position(BOTTOM)
                        assembly_screw_hole_threaded();
        }
}

// !battery_and_dongle_compartment();

module battery_compartment_cover() {
    translate([mouse_buttons_shell_rear_corner.x + wall_thickness + leg_post_lower_diameter + battery_compartment_inner_wall_thickness + battery_terminal_thickness + battery_terminal_divider_wall_thickness + battery_compartment_cover_clearance / 2 - battery_compartment_cover_thickness / 2,
               sidecar_upper_length_bottom,
               -case_height])
        diff()
        cuboid([battery_compartment_internal_width - battery_compartment_cover_clearance + battery_compartment_cover_thickness,
                battery_compartment_cover_thickness,
                battery_compartment_cover_height],
               chamfer=battery_compartment_cover_thickness / 2,
               edges="Z",
               anchor=BACK + BOTTOM + LEFT) {
            edge_profile([TOP + LEFT, TOP + RIGHT])
                mask2d_chamfer(x=battery_compartment_cover_upper_chamfer + battery_compartment_cover_thickness / 2);
            position(TOP + BACK)
                translate([0, -battery_compartment_cover_clip_thickness / 2 - battery_compartment_cover_clip_inset, -battery_compartment_cover_clip_mount_length])
                    cuboid([battery_compartment_cover_clip_width,
                            battery_compartment_cover_clip_thickness / 2,
                            battery_compartment_cover_clip_length + battery_compartment_cover_clip_mount_length],
                        chamfer=battery_compartment_cover_clip_thickness / 2,
                        edges=BOTTOM + FRONT, 
                        anchor=BOTTOM + BACK) {
                        position(TOP + BACK)
                            cuboid([battery_compartment_cover_clip_width,
                                    battery_compartment_cover_clip_thickness / 2,
                                    battery_compartment_cover_clip_thickness / 2],
                                   chamfer=battery_compartment_cover_clip_thickness / 2,
                                   edges=TOP + BACK,
                                   anchor=TOP + FRONT);
                        position(BOTTOM + BACK)
                            cuboid([battery_compartment_cover_clip_width,
                                    battery_compartment_cover_clip_inset,
                                    battery_compartment_cover_clip_mount_length],
                                   anchor=BOTTOM + FRONT);
                    }
            position(BOTTOM + BACK)
                cuboid([battery_compartment_internal_width - battery_compartment_cover_clearance,
                        wall_thickness + battery_compartment_cover_floor_depth - battery_compartment_cover_clearance / 2,
                        battery_compartment_cover_floor_thickness],
                       anchor=BOTTOM + BACK)
                    position(TOP + FRONT)
                        cuboid([battery_compartment_internal_width - battery_compartment_cover_clearance,
                                battery_compartment_cover_floor_catch_thickness,
                                bottom_floor_thickness - battery_compartment_cover_floor_thickness],
                               chamfer=battery_compartment_cover_chamfer,
                               edges=[TOP + FRONT, TOP + BACK],
                               anchor=BOTTOM + FRONT);
            position(TOP + BACK)
                tag("remove")
                back(EXTRA) {
                    down(battery_compartment_cover_grip_z_offset)
                        cuboid([battery_compartment_cover_grip_width,
                                battery_compartment_cover_grip_depth + EXTRA,
                                battery_compartment_cover_grip_line_height],
                               chamfer=battery_compartment_cover_grip_line_height,
                               edges=[BOTTOM + LEFT, BOTTOM + RIGHT],
                               anchor=TOP + BACK);
                    down(battery_compartment_cover_grip_z_offset + 2 * battery_compartment_cover_grip_line_height)
                        cuboid([battery_compartment_cover_grip_width - 4 * battery_compartment_cover_grip_line_height,
                                battery_compartment_cover_grip_depth + EXTRA,
                                battery_compartment_cover_grip_line_height],
                               chamfer=battery_compartment_cover_grip_line_height,
                               edges=[BOTTOM + LEFT, BOTTOM + RIGHT],
                               anchor=TOP + BACK);
                    down(battery_compartment_cover_grip_z_offset + 4 * battery_compartment_cover_grip_line_height)
                        cuboid([battery_compartment_cover_grip_width - 8 * battery_compartment_cover_grip_line_height,
                                battery_compartment_cover_grip_depth + EXTRA,
                                battery_compartment_cover_grip_line_height],
                               chamfer=battery_compartment_cover_grip_line_height,
                               edges=[BOTTOM + LEFT, BOTTOM + RIGHT],
                               anchor=TOP + BACK);
                }
        }
}

module side_wall_undecorated(extra_thickness=0) {
    translate(point3d(mouse_buttons_shell_rear_corner, -top_shell_thickness))
        cuboid([wall_thickness + extra_thickness,
                sidecar_upper_length_bottom - mouse_buttons_shell_rear_corner.y - leg_post_lower_diameter - wall_thickness,
                case_height - top_shell_thickness],
               chamfer=0.5,
               edges=LEFT + FRONT,
               anchor=TOP + LEFT + FRONT)
            children();
}

module side_wall() {
    diff() {
        side_wall_undecorated() {
            position(TOP + FRONT + RIGHT)
                translate([0, main_pcb_y_offset, main_pcb_z_offset])
                rotate([90, main_pcb_rotation, 90])
                main_pcb_mount();
            position(LEFT + TOP + BACK)
                translate([-EXTRA, -assembly_screw_receiver_diameter / 2 - assembly_screw_upper_side_rear_wall_y_offset, -top_shell_rim_height - top_shell_rim_radial_clearance - assembly_screw_receiver_diameter / 2])
                    assembly_screw_hole_unthreaded(wall_thickness, LEFT);
            position(RIGHT + BOTTOM + BACK)
                translate([0, -assembly_screw_lower_side_rear_wall_y_offset, bottom_floor_thickness])
                cuboid([assembly_screw_receiver_diameter + assembly_screw_lower_side_rear_wall_x_offset, assembly_screw_receiver_diameter, assembly_screw_threading_total_length],
                        rounding=assembly_screw_receiver_rounding,
                        edges=[RIGHT + FRONT, RIGHT + BACK],
                        anchor=LEFT + BOTTOM + BACK)
                    position(RIGHT + BOTTOM)
                        left(assembly_screw_receiver_diameter / 2)
                        assembly_screw_hole_threaded();
            position(LEFT + FRONT + BOTTOM)
                translate([0,
                           assembly_screw_receiver_diameter / 2 + assembly_screw_lower_front_side_wall_y_offset,
                           bottom_floor_thickness + assembly_screw_receiver_diameter / 2])
                assembly_screw_hole_unthreaded(wall_thickness, LEFT);
            }
        translate(point3d(mouse_buttons_shell_rear_corner, -top_shell_thickness - assembly_screw_receiver_diameter / 2)) {
            back(assembly_screw_receiver_diameter / 2 + assembly_screw_upper_front_side_wall_y_offset)
                assembly_screw_hole_unthreaded(wall_thickness, LEFT);
            back(-mouse_buttons_shell_rear_corner.y + sidecar_upper_length_top - 2 * wall_thickness - leg_post_lower_diameter - 1.5 * assembly_screw_receiver_diameter - assembly_screw_upper_side_rear_wall_y_offset)
                assembly_screw_hole_unthreaded(wall_thickness, LEFT);
        }
        tag("remove")
            mouse_buttons_back_wall_undecorated();
        
        // the receiver for the upper mouse buttons back wall assembly screw
        wall_right_x = mouse_buttons_shell_rear_corner.x + wall_thickness;
        mouse_buttons_assembly_screw_start =
            line_intersection(
                move([wall_thickness * cos(thumb_cluster_wall_angle + 90),
                      wall_thickness * sin(thumb_cluster_wall_angle + 90)],
                     thumb_cluster_end_vector),
                [[wall_right_x, 0],
                 [wall_right_x, -50]]);
        // the length of the gap between mouse_buttons_assembly_screw_start where
        // the receiver starts) and the corners of the mouse buttons back wall
        additional_length = norm(
            mouse_buttons_assembly_screw_start - 
            move([wall_thickness * cos(thumb_cluster_wall_angle + 90),
                  wall_thickness * sin(thumb_cluster_wall_angle + 90)],
                 bottom_shell_wall_end_plus_wall_thickness[1])) - mouse_buttons_additional_length -
                 wall_thickness * sin(thumb_cluster_wall_angle);
        translate(point3d(mouse_buttons_assembly_screw_start, -top_shell_thickness))
            intersection() {
                zrot(thumb_cluster_wall_angle)
                    translate([assembly_screw_receiver_diameter + additional_length, 0])
                    tag_diff("", "inner_remove", "inner_keep")
                    cuboid([25, // this value just has to be large enough to reach the side wall
                            assembly_screw_threading_total_length,
                            assembly_screw_receiver_diameter],
                           rounding=assembly_screw_receiver_rounding,
                           edges=[RIGHT, BACK],
                           except=[FRONT, TOP],
                           anchor=RIGHT + FRONT + TOP)
                        position(RIGHT + FRONT)
                            left(assembly_screw_receiver_diameter / 2)
                            assembly_screw_hole_threaded(FRONT, tag="inner_remove");
                // trim the part of the screw receiver that's outside of the side wall
                cuboid([50, 50, 50], anchor=LEFT);
            }
    }
}

connection_light_coords = [43.5, -11];
main_pcb_upper_left_clip_coords = [0.9, -6];
main_pcb_upper_left_clip_spin = 90;
main_pcb_upper_right_clip_coords = [47, -7.25];
main_pcb_upper_right_clip_spin = 0;
main_pcb_lower_right_clip_coords = [50.5, -45.5];
main_pcb_lower_right_clip_spin = 180;
module main_pcb_mount() {
    upper_peg_diameter = 1.5;
    upper_peg_support_diameter = 1.25;
    upper_peg_support_clearance = 0.2;
    translate(main_pcb_upper_left_clip_coords)
        // the clip in the upper-left corner
        pcb_clip_cutout(spin=main_pcb_upper_left_clip_spin);
    translate([3.25, -2.25]) {
        // the peg next to the clip
        zrot(-45)
        xscale(1.2) {
            zscale((pcb_bottom_height - upper_peg_support_clearance) / upper_peg_support_diameter)
                cyl(d=upper_peg_diameter,
                    h=upper_peg_support_diameter,
                    rounding1=-upper_peg_support_diameter,
                    anchor=BOTTOM);
            up(pcb_bottom_height - upper_peg_support_clearance)
                cyl(d=upper_peg_diameter,
                    h=pcb_top_height - pcb_bottom_height + upper_peg_support_clearance,
                    anchor=BOTTOM);
        }
    }
    // the three supports next to the peg
    translate([6, 0])
        pcb_edge_support(1.5, pcb_support_dist_past_edge, spin=-90);
    translate([10.5, 0])
        pcb_edge_support(1.5, pcb_support_dist_past_edge, spin=-90);
    translate([19.5, 0])
        cuboid([7, pcb_support_wall_thickness, pcb_bottom_height], anchor=BOTTOM + LEFT + BACK);
    translate(main_pcb_upper_right_clip_coords)
        // the clip at the top right/middle
        pcb_clip_cutout(main_pcb_upper_right_clip_spin);
    translate(connection_light_coords) 
        // cutout for a translucent cover for the light
        tag("remove")
        screw_hole(light_cover_screw_type, l=wall_thickness, thread=true, $slop=connection_light_screw_slop, anchor=TOP);
    translate([37, -11])
        connection_button();
    translate([47.4, -18.25])
        // the peg that's not actually a peg; it just supports the bottom of the
        // PCB. (That's how it is on the original mouse, so that's what I implemented)
        tube(od=4, id=2, l=pcb_bottom_height, anchor=BOTTOM) {
            position(FRONT)
                back(0.1)
                cuboid([pcb_support_wall_thickness, 4.1, pcb_bottom_height], anchor=BACK);
            position(RIGHT)
                left(0.1)
                cuboid([1, pcb_support_wall_thickness, pcb_bottom_height], anchor=LEFT);
        }
    translate([49.9, -17.75])
        // the straight vertical wall to the right of the not-actually-a-peg
        cuboid([pcb_support_wall_thickness, 9.75, pcb_bottom_height], anchor=BOTTOM + BACK);
    // the power switch
    translate([36.25, -20.75]) {
        tag("remove")
            up(EXTRA)
            cuboid([8.5, 4.3, wall_thickness + 2 * EXTRA], rounding=2.125, edges="Z", anchor=TOP)
                position(BOTTOM)
                    // carve out a bit of the outside of the wall around the
                    // power switch since out walls are thicker than the power
                    // switch piece
                    cuboid([10, 2 * 4.75 + wall_thickness - 1, wall_thickness - 1 + EXTRA],
                           chamfer=wall_thickness - 1,
                           edges=[TOP + FRONT, TOP + BACK],
                           anchor=BOTTOM)
                    position([LEFT, RIGHT])
                        cyl(d=2 * 4.75 + wall_thickness - 1, chamfer2=wall_thickness - 1, h=wall_thickness - 1 + EXTRA);
        // wall around the power switch
        wall_path = [
            [-7.5, 3.1],
            [6.5, 3.1],
            [9.25, -0.1875],
            [6.5, -3],
            [6.5, -4],
            [-7.5, -4],
            [-7.5, -2.8],
            [-8.25, -2.0],
            [-8.25, 1.9],
        ];
        wall_radii = [0, 3, 3, 0, 0, 0, 0, 0, 0];
        linear_extrude(h=1.25)
            stroke(round_corners(wall_path, r=wall_radii), width=0.8, closed=true);
        translate([-7.5, 3.1])
            // the small raised bit at the upper-left of the wall
            cuboid([1.5, 0.8, pcb_bottom_height], anchor=BOTTOM + LEFT);
        // the raised stuff at the bottom of/below the power switch wall
        translate([1.75, -4])
            cuboid([3.5, 0.8, pcb_bottom_height], anchor=BOTTOM)
                position(BOTTOM + FRONT)
                    cuboid([pcb_support_wall_thickness, 12, pcb_bottom_height], anchor=BOTTOM + BACK)
                        position(BOTTOM + FRONT)
                            left(1.5)
                            cuboid([11, pcb_support_wall_thickness, pcb_bottom_height], anchor=BOTTOM + LEFT + BACK);
    }
    translate([55.75, -41.15])
        // the hollow peg at the bottom-right of the board.  This one does go
        // through the PCB.
        tube(od=2.65, wall=0.8, h=pcb_top_height, anchor=BOTTOM);
    // the supports and clip below the hollow peg
    translate([55.75, main_pcb_lower_right_clip_coords.y])
        pcb_edge_support(3.2, pcb_support_dist_past_edge, spin=90);
    translate([58.5, main_pcb_lower_right_clip_coords.y])
        pcb_edge_support(2.5, pcb_support_dist_past_edge, spin=90);
    translate(main_pcb_lower_right_clip_coords)
        pcb_clip_cutout(spin=main_pcb_lower_right_clip_spin);
    translate([44, main_pcb_lower_right_clip_coords.y])
        pcb_edge_support(2.5, pcb_support_dist_past_edge, spin=90);
    translate([40, main_pcb_lower_right_clip_coords.y])
        pcb_edge_support(2.5, pcb_support_dist_past_edge_bottom, spin=90);
}

// uncomment for PCB mount test
// !diff() {
//     color("burlywood")
//         cuboid([70, 51, 1], anchor=TOP + BACK + LEFT);
//     main_pcb_mount();
// }

module pcb_clip_cutout(spin=0) {
    tag("remove")
        zrot(spin)
        fwd(pcb_clip_embed_clearance_y)
        cuboid([pcb_clip_width + 2 * pcb_clip_embed_clearance_x,
                pcb_clip_wall_thickness + 2 * pcb_clip_embed_clearance_y,
                pcb_clip_embed_depth],
               anchor=TOP + FRONT);
}

// !diff() {
//     cuboid([14, 14, bottom_floor_thickness], chamfer=3, edges=[FRONT + LEFT, FRONT + RIGHT])
//         position(FRONT + TOP)
//             up(EXTRA)
//             tag("remove") {
//                 back(2)
//                     cuboid([pcb_clip_width + 2 * 0.2,
//                             pcb_clip_wall_thickness + 2 * 0.05,
//                             pcb_clip_embed_depth + EXTRA],
//                         anchor=TOP);
//                 back(5)
//                     cuboid([pcb_clip_width + 2 * 0.20,
//                             pcb_clip_wall_thickness + 2 * 0.06,
//                             pcb_clip_embed_depth + EXTRA],
//                         anchor=TOP);
//                 back(8)
//                     cuboid([pcb_clip_width + 2 * 0.20,
//                             pcb_clip_wall_thickness + 2 * 0.07,
//                             pcb_clip_embed_depth + EXTRA],
//                         anchor=TOP);
//                 back(11)
//                     cuboid([pcb_clip_width + 2 * 0.2,
//                             pcb_clip_wall_thickness + 2 * 0.08,
//                             pcb_clip_embed_depth + EXTRA],
//                         anchor=TOP);
//             }
// }

// !pcb_clip();

module pcb_clip_in_position(pos, spin) {
    translate([mouse_buttons_shell_rear_corner.x + wall_thickness,
               mouse_buttons_shell_rear_corner.y + main_pcb_y_offset,
               -top_shell_thickness + main_pcb_z_offset])
        rotate([90, main_pcb_rotation, 90])
        translate(pos)
        pcb_clip(spin);
}

module pcb_clip(spin) {
    tag_diff("", "inner_remove", "inner_keep") {
        cuboid([pcb_clip_width, pcb_clip_wall_thickness, pcb_top_height],
               anchor=BOTTOM + FRONT,
               spin=spin)
            position(BACK + TOP)
                cuboid([pcb_clip_width, pcb_clip_wall_thickness + pcb_clip_clip_thickness, pcb_clip_additional_height], anchor=BACK + BOTTOM)
                    edge_profile(FRONT + TOP)
                        tag("inner_remove")
                        mask2d_chamfer(x = pcb_clip_wall_thickness + pcb_clip_clip_thickness - 0.5, y=pcb_clip_additional_height);
    cuboid([pcb_clip_width, pcb_clip_wall_thickness, pcb_clip_embed_depth],
           anchor=TOP + FRONT,
           spin=spin)
        edge_profile([BOTTOM + LEFT, BOTTOM + RIGHT])
            tag("inner_remove")
            mask2d_chamfer(x=0.2, y=0.4);
    }
}

module pcb_edge_support(length, dist_past_edge, spin=0) {
    zrot(spin) {
        cuboid([dist_past_edge, pcb_support_wall_thickness, pcb_top_height + pcb_support_height_past_top], anchor=BOTTOM + RIGHT);
        cuboid([length, pcb_support_wall_thickness, pcb_bottom_height], anchor=BOTTOM + LEFT);
    }
}

module connection_light_cover() {
    difference() {
        intersect() {
            cyl(d=light_cover_upper_diameter, h=light_cover_upper_height, texture="diamonds", tex_size=light_cover_knurling, anchor=BOTTOM)
                position(TOP)
                    tag("keep")
                    screw(light_cover_screw_type, l=wall_thickness, bevel2=false, orient=DOWN, anchor=TOP);
            tag("intersect")
                down(EXTRA)
                cyl(d=light_cover_upper_diameter + light_cover_knurling_cutoff, h=light_cover_upper_height + 2 * EXTRA, anchor=BOTTOM);
        }
        down(EXTRA)
            cuboid([light_cover_notch_width, 2 * light_cover_upper_diameter, light_cover_notch_depth + EXTRA],
                    anchor=BOTTOM);
    }
}

module connection_light_cover_in_position() {
    translate([mouse_buttons_shell_rear_corner.x + wall_thickness, mouse_buttons_shell_rear_corner.y, -top_shell_thickness])
    translate([0, main_pcb_y_offset, main_pcb_z_offset])
        rotate([90, main_pcb_rotation, 90])
        translate(point3d(connection_light_coords, light_cover_upper_height + EXTRA))
        xrot(180)
        connection_light_cover();
}

module connection_button() {
    connection_button_hinge_chamfer = (connection_button_hinge_base_width - connection_button_inner_diameter) / 2;
    // the peg that hits the actual button on the PCB
    cyl(d=connection_button_peg_diameter, h=pcb_bottom_height - connection_button_peg_clearance, anchor=BOTTOM);

    // the hinge that pushes the button back out
    cyl(d=connection_button_inner_diameter + connection_button_diameter_difference, h=connection_button_hinge_height + connection_button_hinge_clearance, anchor=BOTTOM);
    zrot(-34)
        up(connection_button_hinge_clearance)
        cuboid([connection_button_hinge_length, connection_button_inner_diameter, connection_button_hinge_height],
               anchor=RIGHT + BOTTOM) {
            position(LEFT)
                cuboid([connection_button_hinge_chamfer,
                        connection_button_inner_diameter + 2 * connection_button_hinge_chamfer,
                        connection_button_hinge_height],
                       chamfer=connection_button_hinge_chamfer,
                       edges=[RIGHT + FRONT, RIGHT + BACK],
                       anchor=LEFT);
            position(LEFT + TOP)
                cuboid([connection_button_hinge_base_length,
                        connection_button_hinge_base_width,
                        connection_button_hinge_height + connection_button_hinge_clearance],
                        anchor=RIGHT + TOP);
        }

    // carve the button itself out of the wall
    tag_diff("remove", "inner_remove", "inner_keep") {
        cyl(d=connection_button_inner_diameter + connection_button_diameter_difference + connection_button_pip_clearance,
            h=wall_thickness,
            chamfer1=connection_button_diameter_difference / 2,
            anchor=TOP);
        tag("inner_remove")
            cyl(d=connection_button_inner_diameter + connection_button_diameter_difference,
                h=connection_button_lower_height,
                anchor=TOP)
                position(BOTTOM)
                    cyl(d=connection_button_inner_diameter + connection_button_diameter_difference,
                        h=wall_thickness - connection_button_lower_height - connection_button_pip_clearance,
                        chamfer1=connection_button_diameter_difference / 2,
                        anchor=TOP)
                        position(BOTTOM)
                            cyl(d=connection_button_inner_diameter,
                                h=connection_button_pip_clearance,
                                anchor=TOP);
    }
}

module foot() {
    screw_hole_depth = foot_upper_height + foot_main_height - foot_screw_hole_base;
    difference() {
        cyl(d=foot_upper_diameter, h=foot_upper_height, anchor=TOP)
            position(BOTTOM)
                cyl(d=foot_diameter, h=foot_main_height, chamfer1=0.6, anchor=TOP);
        screw_hole(foot_screw_type, thread=true, length=screw_hole_depth, $slop=foot_screw_slop, anchor=TOP);
    }
}

if (show_trackball_holder)
    render()
    color("darkgray")
    trackball_holder_split("outer");
if (show_trackball_holder_pcb_mount)
    render()
    color("burlywood")
    trackball_holder_split("inner");
if (show_bottom_shell)
    render()
    // color("gray")
    // intersection() {
        bottom_shell();
        // translate([top_x_offset - 2.956, 41, 0])
        //     cuboid([23, 41.5, 2 * case_height], anchor=BACK + TOP);
        // translate([top_x_offset - 2.956, 41, -14])
        //     cuboid([15, 41.5, 20], anchor=BACK);
    // }
if (show_top_shell)
    // render()
    color("slategray")
    top_shell();
if (show_mouse_buttons_shell)
    render()
    color("powderblue")
    mouse_buttons_shell();
if (show_mouse_buttons_back_wall)
    render()
    color("lavender")
    mouse_buttons_back_wall();
if (show_mouse_buttons_upper_pcb_holder)
    render()
    mouse_buttons_upper_pcb_holder_in_position();
if (show_mouse_buttons_pcb_placeholder)
    // color("yellow")
    %mouse_button_pcb_placeholder();
if (show_rear_wall)
    render()
    color("lightsteelblue")
    rear_wall();
if (show_side_wall)
    render()
    // color("oldlace")
    side_wall();
if (show_pcb_clips)
    pcb_clip_in_position(main_pcb_upper_left_clip_coords,
                         main_pcb_upper_left_clip_spin);
if (show_pcb_clips)
    pcb_clip_in_position(main_pcb_upper_right_clip_coords,
                         main_pcb_upper_right_clip_spin);
if (show_pcb_clips)
    pcb_clip_in_position(main_pcb_lower_right_clip_coords,
                         main_pcb_lower_right_clip_spin);
if (show_battery_compartment_cover)
    render()
    color("bisque")
    battery_compartment_cover();
if (show_trackball)
    color("red")
    translate(trackball_center)
    sphere(d=trackball_diameter);
if (show_foot)
    right(25)
    foot();
if (show_light_cover)
    connection_light_cover_in_position();
if (show_static_bearing_fit_test)
    render()
    intersection() {
        trackball_holder();
        translate(trackball_center)
            zrot(-(180 - sidecar_angle))
                yrot(-trackball_back_bearing_vertical_angle)
                    cuboid([15, 15, trackball_diameter / 2 + 10], anchor=TOP);
    }