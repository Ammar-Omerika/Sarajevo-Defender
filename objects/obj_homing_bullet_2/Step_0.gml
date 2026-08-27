var seek_range = 700;
target = noone;

if (instance_exists(obj_player)) {
    with (obj_rock) {
        if (point_distance(x, y, obj_player.x, obj_player.y) <= seek_range) {
            if (other.target == noone ||
                point_distance(x, y, obj_player.x, obj_player.y) <
                point_distance(other.target.x, other.target.y,
                               obj_player.x, obj_player.y)) {
                other.target = id;
            }
        }
    }
}

if (target != noone) {
    direction += 2 * sign(
        angle_difference(
            point_direction(x, y, target.x, target.y),
            direction
        )
    );
}
