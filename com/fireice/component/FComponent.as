package com.fireice.component
{
   import com.fireice.base.FUIComponent;
   import com.fireice.dragAndDrop.SourceData;
   import com.fireice.event.DragAndDropEvent;
   import flash.events.*;
   import flash.geom.*;
   import flash.utils.Dictionary;
   
   public class FComponent extends FUIComponent
   {
      
      private var dropTrigger:Boolean;
      
      private var dragAcceptableInitiator:Dictionary;
      
      private var dragAcceptableInitiatorAppraiser:Function;
      
      public function FComponent()
      {
         super();
      }
      
      public function getMousePosition() : Point
      {
         return new Point(mouseX,mouseY);
      }
      
      public function set DropTrigger(param1:Boolean) : void
      {
         this.dropTrigger = param1;
      }
      
      public function get DropTrigger() : Boolean
      {
         return this.dropTrigger;
      }
      
      public function addDragAcceptableInitiator(param1:FComponent) : void
      {
         if(this.dragAcceptableInitiator == null)
         {
            this.dragAcceptableInitiator = new Dictionary(true);
         }
         this.dragAcceptableInitiator[param1] = true;
      }
      
      public function removeDragAcceptableInitiator(param1:FComponent) : void
      {
         if(this.dragAcceptableInitiator != null)
         {
            this.dragAcceptableInitiator[param1] = undefined;
            delete this.dragAcceptableInitiator[param1];
         }
      }
      
      public function setDragAcceptableInitiatorAppraiser(param1:Function) : void
      {
         this.dragAcceptableInitiatorAppraiser = param1;
      }
      
      public function isDragAcceptableInitiator(param1:FComponent) : Boolean
      {
         if(this.dragAcceptableInitiator != null)
         {
            return this.dragAcceptableInitiator[param1] == true;
         }
         if(this.dragAcceptableInitiatorAppraiser != null)
         {
            return this.dragAcceptableInitiatorAppraiser(param1);
         }
         return false;
      }
      
      private function fireDragRecognizedEvent(param1:FComponent) : void
      {
         dispatchEvent(new DragAndDropEvent(DragAndDropEvent.DRAG_RECOGNIZED,this,null,new Point(stage.mouseX,stage.mouseY)));
      }
      
      public function fireDragEnterEvent(param1:FComponent, param2:SourceData, param3:Point, param4:FComponent) : void
      {
         dispatchEvent(new DragAndDropEvent(DragAndDropEvent.DRAG_ENTER,param1,param2,param3,this,param4));
      }
      
      public function fireDragOverringEvent(param1:FComponent, param2:SourceData, param3:Point) : void
      {
         dispatchEvent(new DragAndDropEvent(DragAndDropEvent.DRAG_OVERRING,param1,param2,param3,this));
      }
      
      public function fireDragExitEvent(param1:FComponent, param2:SourceData, param3:Point, param4:FComponent) : void
      {
         dispatchEvent(new DragAndDropEvent(DragAndDropEvent.DRAG_EXIT,param1,param2,param3,this,param4));
      }
      
      public function fireDragDropEvent(param1:FComponent, param2:SourceData, param3:Point) : void
      {
         dispatchEvent(new DragAndDropEvent(DragAndDropEvent.DRAG_DROP,param1,param2,param3,this));
      }
   }
}

