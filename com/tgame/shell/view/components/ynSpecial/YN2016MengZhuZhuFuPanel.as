package com.tgame.shell.view.components.ynSpecial
{
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.shell.view.components.utils.UITools;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import game.display.Button;
   import game.display.Label;
   import game.display.SimpleButton;
   import game.skin.mengzhuzhufuxiaojiemianSkin;
   import game.utils.SkinTools;
   
   public class YN2016MengZhuZhuFuPanel extends BasePanel
   {
      
      public static const REQUEST_LINGQU:String = "REQUEST_LINGQUMENGZHUZHUFU";
      
      private var guanbi:SimpleButton;
      
      private var lingqu:Button;
      
      public var $parent:DisplayObject;
      
      private var _name:Label;
      
      public function YN2016MengZhuZhuFuPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(mengzhuzhufuxiaojiemianSkin.skin,"jinyuanbaodihuodongtishi");
      }
      
      override public function onClose(param1:* = null) : void
      {
         super.onClose();
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function gotoClose(param1:MouseEvent) : void
      {
         this.onClose();
      }
      
      override protected function createVariableReference() : void
      {
         this.guanbi = getChildByName("guanbi") as SimpleButton;
         this.guanbi.addEventListener(MouseEvent.CLICK,this.gotoClose);
         this.lingqu = getChildByName("jinyuanbaodihuodongtishiqueding") as Button;
         this.lingqu.addEventListener(MouseEvent.CLICK,this.onClick);
         this._name = getChildByName("wenben2") as Label;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.guanbi:
               this.gotoClose(null);
               break;
            case this.lingqu:
               dispatchEvent(new Event(YN2016MengZhuZhuFuPanel.REQUEST_LINGQU));
         }
      }
      
      public function showPanel(param1:String) : void
      {
         this._name.text = param1;
         UITools.showPanel(this);
      }
   }
}

