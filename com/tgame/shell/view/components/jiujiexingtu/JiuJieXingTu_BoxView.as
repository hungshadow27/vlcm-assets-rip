package com.tgame.shell.view.components.jiujiexingtu
{
   import com.asQuery.$;
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   import game.skin.JiuJieXingTuSkin;
   import game.utils.SkinTools;
   
   public class JiuJieXingTu_BoxView extends BasePanel
   {
      
      private var goodsIDArrLeft:Array = [398476];
      
      private var goodsNumArrLeft:Array = [100];
      
      private var goodsIDArrRight:Array = [398476,398474,398473,502713];
      
      private var goodsNumArrRight:Array = [1000,1,1,1];
      
      public function JiuJieXingTu_BoxView()
      {
         var _loc2_:Goods = null;
         var _loc3_:ItemFace = null;
         super();
         this.skin = SkinTools.getChildSkinByName(JiuJieXingTuSkin.skin,"shenyuanbaoxiang");
         $("duigou",this,true).attr("selectIndex",1);
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < this.goodsIDArrLeft.length)
         {
            _loc2_ = new Goods(this.goodsIDArrLeft[_loc1_]);
            _loc2_.count = this.goodsNumArrLeft[_loc1_];
            _loc3_ = new ItemFace(_loc2_);
            _loc3_.x = 45 + _loc1_ % 3 * 55;
            _loc3_.y = 100 + int(_loc1_ / 3) * 50;
            addChild(_loc3_);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.goodsIDArrRight.length)
         {
            _loc2_ = new Goods(this.goodsIDArrRight[_loc1_]);
            _loc2_.count = this.goodsNumArrRight[_loc1_];
            _loc3_ = new ItemFace(_loc2_);
            _loc3_.x = 245 + _loc1_ % 3 * 55;
            _loc3_.y = 100 + int(_loc1_ / 3) * 50;
            addChild(_loc3_);
            _loc1_++;
         }
         $("guanbi1",this,true).click(this.onCloseHandler);
         $("kaiqi",this,true).click(this.onClickHandler);
      }
      
      private function onClickHandler(param1:MouseEvent) : void
      {
         var index:int = 0;
         var e:MouseEvent = param1;
         index = int($("duigou",this,true).getAttr("selectIndex"));
         FAlert.okLabel = LanResManager.getLanCommonTextWords("确定");
         FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
         FAlert.show("您正在使用当前方式开启神元宝箱","",2,function(param1:FAlertEvent):void
         {
            if(param1.eventData == FAlert.OK)
            {
               dispatchEvent(new BaseEvent(JiuJieXingTuPanel.JIUJIEXINGTUPANEL_BOX_CLICK,"",index + 1));
            }
         });
      }
      
      private function onCloseHandler(param1:MouseEvent) : void
      {
         if(Boolean(this.parent) && parent != null)
         {
            parent.removeChild(this);
         }
      }
   }
}

