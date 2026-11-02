package com.tgame.shell.view.components.chongjiuzhiyang
{
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.SimpleButton;
   import game.skin.chongjiuzhiyangSkin;
   import game.utils.SkinTools;
   
   public class YnChongjiezhiyangPanel extends BasePanel
   {
      
      private var guanbi:SimpleButton;
      
      private var lingqu1:SimpleButton;
      
      private var lingqu2:SimpleButton;
      
      private var lingqu3:SimpleButton;
      
      private var lingqu4:SimpleButton;
      
      private var lingqu5:SimpleButton;
      
      private var lingqu6:SimpleButton;
      
      public function YnChongjiezhiyangPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(chongjiuzhiyangSkin.skin,"chongjiuzhiyang");
      }
      
      override protected function createVariableReference() : void
      {
         var _loc3_:ItemFace = null;
         this.guanbi = getChildByName("guanbi") as SimpleButton;
         this.guanbi.addEventListener(MouseEvent.CLICK,this.gotoClose);
         this.lingqu1 = getChildByName("lingquanniu1") as SimpleButton;
         this.lingqu1.addEventListener(MouseEvent.CLICK,this.onclick);
         this.lingqu1.name = "1";
         this.lingqu2 = getChildByName("lingquanniu2") as SimpleButton;
         this.lingqu2.addEventListener(MouseEvent.CLICK,this.onclick);
         this.lingqu2.name = "2";
         this.lingqu3 = getChildByName("lingquanniu3") as SimpleButton;
         this.lingqu3.addEventListener(MouseEvent.CLICK,this.onclick);
         this.lingqu3.name = "3";
         this.lingqu4 = getChildByName("lingquanniu4") as SimpleButton;
         this.lingqu4.addEventListener(MouseEvent.CLICK,this.onclick);
         this.lingqu4.name = "4";
         this.lingqu5 = getChildByName("lingquanniu5") as SimpleButton;
         this.lingqu5.addEventListener(MouseEvent.CLICK,this.onclick);
         this.lingqu5.name = "5";
         this.lingqu6 = getChildByName("lingquanniu6") as SimpleButton;
         this.lingqu6.addEventListener(MouseEvent.CLICK,this.onclick);
         this.lingqu6.name = "6";
         var _loc1_:Array = [712684,712685,712686,712687,712689,712688];
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc3_ = new ItemFace(new Goods(_loc1_[_loc2_]));
            addChild(_loc3_);
            _loc3_.x = 243;
            _loc3_.y = 187 + _loc2_ * 53;
            _loc2_++;
         }
      }
      
      protected function onclick(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SEND_53095,[86,int(param1.target.name)]);
      }
      
      private function gotoClose(param1:MouseEvent) : void
      {
         this.onClose();
      }
      
      override public function onClose(param1:* = null) : void
      {
         super.onClose();
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
   }
}

