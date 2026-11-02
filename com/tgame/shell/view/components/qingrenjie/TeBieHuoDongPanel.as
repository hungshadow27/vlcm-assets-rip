package com.tgame.shell.view.components.qingrenjie
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.skin.TeBieHuoDongSkin;
   import game.utils.SkinTools;
   
   public class TeBieHuoDongPanel extends BasePanel
   {
      
      private var arr:Array = [711955,723896,711955,723896];
      
      private var arrNum:Array = [100,45,100,45];
      
      private var currType:int = 0;
      
      public function TeBieHuoDongPanel()
      {
         var _loc2_:Goods = null;
         var _loc3_:ItemFace = null;
         super();
         this.skin = SkinTools.getChildSkinByName(TeBieHuoDongSkin.skin,"tebiehuodong");
         $("wenben3",this,true).attr("text","2000");
         $("wenben4",this,true).attr("text","5000");
         $("wenben5",this,true).attr("text","9000");
         $("wenben6",this,true).attr("text","15000");
         $("DFZQLQAN1 DFZQLQAN2 DFZQLQAN3 DFZQLQAN4",this,true).click(this.onClickHanlder);
         $("YBZLGBAN",this,true).click(this.onClick);
         var _loc1_:int = 0;
         while(_loc1_ < this.arr.length)
         {
            _loc2_ = new Goods(this.arr[_loc1_]);
            _loc2_.count = this.arrNum[_loc1_];
            _loc3_ = new ItemFace(_loc2_,65,65);
            _loc3_.x = _loc1_ * 141 + 150;
            _loc3_.y = 341;
            addChild(_loc3_);
            _loc1_++;
         }
      }
      
      public function setDate(param1:int) : void
      {
         if(param1 == 1)
         {
            $("wenben1",this,true).attr("text","07/10 - 09/10");
            this.currType = 220;
         }
         else if(param1 == 2)
         {
            $("wenben1",this,true).attr("text","07/10 - 09/10");
            this.currType = 221;
         }
      }
      
      public function setNum(param1:int) : void
      {
         $("wenben2",this,true).attr("text",param1 + "");
      }
      
      private function onClickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("N");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[this.currType,uint(_loc2_[1])]);
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

