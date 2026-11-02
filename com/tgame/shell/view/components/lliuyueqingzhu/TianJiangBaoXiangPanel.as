package com.tgame.shell.view.components.lliuyueqingzhu
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.skin.tianjiangbaoxiangSkin;
   import game.utils.SkinTools;
   
   public class TianJiangBaoXiangPanel extends BasePanel
   {
      
      private var curT:int;
      
      public function TianJiangBaoXiangPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(tianjiangbaoxiangSkin.skin,"zhoumorenaohuodong");
         this.init();
      }
      
      private function init() : void
      {
         $("lingqu1",this,true).click(this.clickHanlder);
         $("guanbi",this,true).click(this.onClick);
         var _loc1_:Goods = new Goods(714480);
         _loc1_.count = 1;
         var _loc2_:ItemFace = new ItemFace(_loc1_);
         _loc2_.x = 39;
         _loc2_.y = 229;
         addChild(_loc2_);
      }
      
      public function setNum(param1:int) : void
      {
         $("wenben2",this,true).attr("text",param1 + "");
         $("wenben1",this,true).attr("text","Hoạt động tích lũy từ 00:01 ngày thứ 1 đến 23:59 ngày kết thúc của phiên bản.");
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SEND_53099,[this.curT,1]);
      }
      
      public function setType(param1:int) : void
      {
         this.curT = param1;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
   }
}

