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
   import game.skin.JieJiLiangCaoSkin;
   import game.utils.SkinTools;
   
   public class YN2016XiaoFeiPanel extends BasePanel
   {
      
      public static const REQUEST_LINGQU:String = "REQUEST_LINGQU";
      
      private var guanbi:SimpleButton;
      
      private var lingqu:Button;
      
      public var $parent:DisplayObject;
      
      private var szi1:Label;
      
      private var szi2:Label;
      
      private var szi3:Label;
      
      private var szi4:Label;
      
      private var szi5:Label;
      
      public function YN2016XiaoFeiPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(JieJiLiangCaoSkin.skin,"xiaofei");
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
         this.lingqu = getChildByName("lingqu") as Button;
         this.lingqu.addEventListener(MouseEvent.CLICK,this.onClick);
         this.szi1 = getChildByName("szi1") as Label;
         this.szi2 = getChildByName("szi2") as Label;
         this.szi3 = getChildByName("szi3") as Label;
         this.szi4 = getChildByName("szi4") as Label;
         this.szi5 = getChildByName("szi5") as Label;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.guanbi:
               this.gotoClose(null);
               break;
            case this.lingqu:
               dispatchEvent(new Event(YN2016XiaoFeiPanel.REQUEST_LINGQU));
         }
      }
      
      public function setDatas(param1:int, param2:int, param3:int, param4:int) : *
      {
         this.szi1.htmlText = param1 + "";
         this.szi2.htmlText = param3 + "";
         this.szi3.htmlText = param2 + "";
         this.szi4.htmlText = param4 + "";
         this.szi5.htmlText = param1 + param2 + "";
      }
      
      public function showPanel(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.setDatas(param1,param2,param3,param4);
         UITools.showPanel(this);
      }
   }
}

