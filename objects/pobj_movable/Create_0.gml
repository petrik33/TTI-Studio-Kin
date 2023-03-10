// Inherit the parent event
event_inherited();

entity_add_component(get_movable_component(self, big), COMPONENT_TYPE.OBJECT_COLLIDER, self);