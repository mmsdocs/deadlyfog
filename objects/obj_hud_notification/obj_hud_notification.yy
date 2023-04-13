{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "obj_hud_notification",
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":64,"eventType":8,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":2,"isDnD":false,},
  ],
  "managed": true,
  "overriddenProperties": [
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_ui_text","path":"objects/obj_ui_text/obj_ui_text.yy",},"propertyId":{"name":"font","path":"objects/obj_ui_text/obj_ui_text.yy",},"value":"fnt_hud_notification",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_ui_item","path":"objects/obj_ui_item/obj_ui_item.yy",},"propertyId":{"name":"color","path":"objects/obj_ui_item/obj_ui_item.yy",},"value":"$00FFFFFF",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_ui_text","path":"objects/obj_ui_text/obj_ui_text.yy",},"propertyId":{"name":"shadow_size","path":"objects/obj_ui_text/obj_ui_text.yy",},"value":"2",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_ui_text","path":"objects/obj_ui_text/obj_ui_text.yy",},"propertyId":{"name":"shadow_color","path":"objects/obj_ui_text/obj_ui_text.yy",},"value":"$FF191919",},
  ],
  "parent": {
    "name": "Notifications",
    "path": "folders/Objects/UI/HUD/Notifications.yy",
  },
  "parentObjectId": {
    "name": "obj_ui_text",
    "path": "objects/obj_ui_text/obj_ui_text.yy",
  },
  "persistent": false,
  "physicsAngularDamping": 0.1,
  "physicsDensity": 0.5,
  "physicsFriction": 0.2,
  "physicsGroup": 1,
  "physicsKinematic": false,
  "physicsLinearDamping": 0.1,
  "physicsObject": false,
  "physicsRestitution": 0.1,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsShapePoints": [],
  "physicsStartAwake": true,
  "properties": [
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"separation","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"2","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"box_height","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"15","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"box_width","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"150","varType":0,},
  ],
  "solid": false,
  "spriteId": null,
  "spriteMaskId": null,
  "visible": true,
}