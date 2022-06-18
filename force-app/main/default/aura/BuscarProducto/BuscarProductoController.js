({
	doInit : function(component, event, helper) {
		var action = component.get("c.getInventario");
        action.setCallback(this, function(response){
            component.set("v.inventario", response.getReturnValue());               
         });
    $A.enqueueAction(action);
	}
})