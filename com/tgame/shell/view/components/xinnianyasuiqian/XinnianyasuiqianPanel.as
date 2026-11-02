package com.tgame.shell.view.components.xinnianyasuiqian
{
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import game.display.SimpleButton;
   import game.skin.HuaTianWanSeSkin;
   import game.utils.SkinTools;
   
   public class XinnianyasuiqianPanel extends BasePanel
   {
      
      private var btn2:SimpleButton;
      
      private var guanbi:SimpleButton;
      
      private var txt:TextField;
      
      public function XinnianyasuiqianPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(HuaTianWanSeSkin.skin,"xinnianyasuiqian");
      }
      
      override protected function createVariableReference() : void
      {
         this.txt = new TextField();
         this.txt.background = true;
         this.txt.backgroundColor = 1649703;
         this.addChild(this.txt);
         this.txt.x = 45;
         this.txt.y = 277;
         this.txt.width = 150;
         this.txt.height = 15;
         this.btn2 = getChildByName("duihuananniu") as SimpleButton;
         this.guanbi = getChildByName("guanbi") as SimpleButton;
         this.txt.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.btn2.addEventListener(MouseEvent.CLICK,this.clickHanlder2);
         this.guanbi.addEventListener(MouseEvent.CLICK,onClose);
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SHOW_XINIANYASUIQIANCHAKAN_PLANE);
      }
      
      private function clickHanlder2(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SEND_53095,[110]);
      }
   }
}

