package com.fireice.event
{
   import com.fireice.component.FComponent;
   import com.fireice.dragAndDrop.SourceData;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class DragAndDropEvent extends Event
   {
      
      public static const DRAG_RECOGNIZED:String = "dragRecongnized";
      
      public static const DRAG_START:String = "dragStart";
      
      public static const DRAG_ENTER:String = "dragEnter";
      
      public static const DRAG_OVERRING:String = "dragOverring";
      
      public static const DRAG_EXIT:String = "dragExit";
      
      public static const DRAG_DROP:String = "dragDrop";
      
      private var dragInitiator:FComponent;
      
      private var sourceData:SourceData;
      
      private var mousePos:Point;
      
      private var targetComponent:FComponent;
      
      private var relatedTargetComponent:FComponent;
      
      public function DragAndDropEvent(param1:String, param2:FComponent, param3:SourceData, param4:Point, param5:FComponent = null, param6:FComponent = null)
      {
         super(param1);
         this.dragInitiator = param2;
         this.sourceData = param3;
         this.mousePos = param4.clone();
         this.targetComponent = param5;
         this.relatedTargetComponent = param6;
      }
      
      override public function clone() : Event
      {
         return new DragAndDropEvent(type,this.dragInitiator,this.sourceData,this.mousePos,this.targetComponent);
      }
      
      public function getDragInitiator() : FComponent
      {
         return this.dragInitiator;
      }
      
      public function getSourceData() : SourceData
      {
         return this.sourceData;
      }
      
      public function getMousePosition() : Point
      {
         return this.mousePos;
      }
      
      public function getTargetComponent() : FComponent
      {
         return this.targetComponent;
      }
      
      public function getRelatedTargetComponent() : FComponent
      {
         return this.relatedTargetComponent;
      }
   }
}

