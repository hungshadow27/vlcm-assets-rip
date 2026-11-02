package com.tgame.shell.view.components.ynSpecial
{
   import com.tgame.common.ui.componets.BasePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import game.display.Button;
   import game.display.List;
   import game.display.SimpleButton;
   import game.display.Stepper;
   import game.skin.wushenzhanlianpaihangbangSkin;
   import game.utils.SkinTools;
   
   public class YN2016WushenpaihangPanel extends BasePanel
   {
      
      private var guanbi:SimpleButton;
      
      private var tijiao:Button;
      
      private var lingqv:Button;
      
      private var list:List;
      
      private var step:Stepper;
      
      public var _parent:DisplayObject;
      
      public function YN2016WushenpaihangPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(wushenzhanlianpaihangbangSkin.skin,"wushenzhanlianpaihangbang");
         this.addEventListener(Event.REMOVED_FROM_STAGE,this.removeStage);
      }
      
      override public function onClose(param1:* = null) : void
      {
         super.onClose();
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
      
      protected function removeStage(param1:Event) : void
      {
         this.list.DataSource = [{
            "mingci":0,
            "name":"",
            "jifen":0
         }];
      }
      
      override protected function createVariableReference() : void
      {
         this.guanbi = getChildByName("guanbi") as SimpleButton;
         this.guanbi.addEventListener(MouseEvent.CLICK,this.gotoClose);
         this.tijiao = getChildByName("tijiao") as Button;
         this.tijiao.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lingqv = getChildByName("lingqu") as Button;
         this.lingqv.addEventListener(MouseEvent.CLICK,this.onClick);
         this.list = getChildByName("paihangbangleibiao") as List;
         this.list.ItemClass = ListElement;
         this.step = getChildByName("fanye") as Stepper;
         this.step.formatter = "vv";
         this.step.value = 1;
         this.step.maximum = 10;
         this.step.addEventListener(Event.CHANGE,this.stepHandler);
         this.step.editable = false;
      }
      
      private function stepHandler(param1:Event) : void
      {
         this._parent.dispatchEvent(new BaseEvent(YN2016WuShenzhanlianPanel.WUSHEN_FANYE,"",this.step.value));
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.lingqv:
               this._parent.dispatchEvent(new Event(YN2016WuShenzhanlianPanel.WUSHEN_LINGQU));
               break;
            case this.tijiao:
               this._parent.dispatchEvent(new Event(YN2016WuShenzhanlianPanel.WUSHEN_TIJIAO));
         }
      }
      
      public function setdata(param1:Array, param2:Object) : void
      {
         this.list.DataSource = param1;
         this.step.value = param2.yeshu;
         this.step.maximum = param2.yeshuMax;
      }
      
      public function gotoClose(param1:MouseEvent) : void
      {
         this.onClose();
      }
   }
}

import flash.text.TextFormat;
import game.display.Label;
import game.display.ListItemRender;

class ListElement extends ListItemRender
{
   
   private var _name:Label;
   
   private var _paihang:Label;
   
   private var _jifen:Label;
   
   public function ListElement()
   {
      super();
      this.buttonMode = true;
   }
   
   override protected function createVariableReference() : void
   {
      super.createVariableReference();
      this._jifen = this.getChildByName("wenben6") as Label;
      this._name = this.getChildByName("wenben5") as Label;
      this._paihang = this.getChildByName("wenben4") as Label;
   }
   
   override public function set data(param1:Object) : void
   {
      super.data = param1;
      var _loc2_:TextFormat = new TextFormat();
      _loc2_.align = "center";
      _loc2_.size = 8;
      this._paihang.text = String(param1.num);
      this._paihang.setTextFormat(_loc2_);
      this._name.text = param1.name;
      this._name.setTextFormat(_loc2_);
      this._jifen.text = String(param1.fenzhi);
      this._jifen.setTextFormat(_loc2_);
      this.height = 24;
   }
}
