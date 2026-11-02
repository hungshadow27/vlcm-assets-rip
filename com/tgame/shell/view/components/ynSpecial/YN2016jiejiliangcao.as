package com.tgame.shell.view.components.ynSpecial
{
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Button;
   import game.display.SimpleButton;
   import game.skin.JieJiLiangCaoSkin;
   import game.utils.SkinTools;
   
   public class YN2016jiejiliangcao extends BasePanel
   {
      
      private var guanbi:SimpleButton;
      
      private var btn1:Button;
      
      private var btn2:Button;
      
      private var buy:Button;
      
      public function YN2016jiejiliangcao()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(JieJiLiangCaoSkin.skin,"jiejiliangcao");
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
         this.btn1 = getChildByName("duihuan1") as Button;
         this.btn1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btn2 = getChildByName("duihuan2") as Button;
         this.btn2.addEventListener(MouseEvent.CLICK,this.onClick);
         this.buy = getChildByName("goumai") as Button;
         this.buy.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn1:
               PipeManager.sendMsg(PipeConstants.SEND_53095,[74]);
               break;
            case this.btn2:
               PipeManager.sendMsg(PipeConstants.SEND_53095,[75]);
               break;
            case this.buy:
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[712551,1]);
         }
      }
   }
}

