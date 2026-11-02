package com.tgame.shell.view.components.yurenjie
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class YuRenJiePanel extends FPanel
   {
      
      public static const UI_GETXUNZHANG:String = "UI_GETXUNZHANG";
      
      public static const UI_LOOKRANK:String = "UI_LOOKRANK";
      
      public static const UI_GETZHANPAO:String = "UI_GETZHANPAO";
      
      private var zhengguzhi:FTextArea;
      
      private var lookRankBtn:SecondButton;
      
      private var xunzhangBtn:SecondButton;
      
      private var currentPage:int = 1;
      
      public function YuRenJiePanel()
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:FTextArea = null;
         super();
         this.titleText = LanResManager.getLanCommonTextWords("整蛊王");
         this.showCloseButton = true;
         this.skin = "panel_btn";
         this.dragAble = true;
         width = 334;
         height = 403;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         _loc1_ = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/zhengguwang/bg.png",314,328);
         _loc1_.x = 10;
         _loc1_.y = 2;
         addChild(_loc1_);
         this.zhengguzhi = new FTextArea();
         this.zhengguzhi.textColor = StaticValue.GREEN;
         this.zhengguzhi.filters = StaticValue.filter;
         this.zhengguzhi.text = LanResManager.getLanCommonTextWords("当前被整蛊值：");
         this.zhengguzhi.x = 15;
         this.zhengguzhi.y = 116;
         this.zhengguzhi.width = 320;
         addChild(this.zhengguzhi);
         this.lookRankBtn = new SecondButton();
         this.lookRankBtn.label = LanResManager.getLanCommonTextWords("查看排行");
         this.lookRankBtn.x = 138;
         this.lookRankBtn.y = 341;
         addChild(this.lookRankBtn);
         this.lookRankBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.xunzhangBtn = new SecondButton();
         this.xunzhangBtn.x = 75;
         this.xunzhangBtn.y = 159;
         this.xunzhangBtn.label = LanResManager.getLanCommonTextWords("领取勋章");
         addChild(this.xunzhangBtn);
         this.xunzhangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         _loc2_ = new FTextArea();
         _loc2_.text = LanResManager.getLanCommonTextWords("被整蛊值达到888，可领取2014整蛊勋章");
         _loc2_.textColor = StaticValue.GREEN;
         _loc2_.filters = StaticValue.filter;
         _loc2_.x = 15;
         _loc2_.y = 307;
         _loc2_.width = _loc2_.textWidth + 10;
         _loc2_.height = _loc2_.textHeight;
         addChild(_loc2_);
         _loc2_ = new FTextArea();
         _loc2_.text = LanResManager.getLanCommonTextWords("活动规则：");
         _loc2_.x = 15;
         _loc2_.y = 195;
         _loc2_.width = _loc2_.textWidth;
         _loc2_.height = _loc2_.textHeight;
         _loc2_.textColor = StaticValue.ORANGE;
         _loc2_.filters = StaticValue.filter;
         addChild(_loc2_);
         _loc2_ = new FTextArea();
         _loc2_.htmlText = "   " + LanResManager.getLanCommonTextWords("2014年4月1日到4月3日为整蛊日,当日可使用整蛊之") + "<br>" + LanResManager.getLanCommonTextWords("心道具整蛊其他玩家,每次被整蛊成功,可获得整蛊值1点.") + "<br>" + LanResManager.getLanCommonTextWords("当整蛊值达到888时,可领取2014年整蛊勋章.") + "<br>" + "   " + LanResManager.getLanCommonTextWords("2014年4月4日为整蛊王领奖日,在4月4日被整蛊值前十") + "<br>" + LanResManager.getLanCommonTextWords("名玩家可在排行榜界面领取整蛊王战袍.");
         _loc2_.x = 15;
         _loc2_.y = 212;
         _loc2_.textColor = StaticValue.WHITE;
         _loc2_.filters = StaticValue.filter;
         _loc2_.width = _loc2_.textWidth;
         _loc2_.height = _loc2_.textHeight + 50;
         addChild(_loc2_);
         var _loc3_:ItemFace = new ItemFace(new Goods(370030));
         _loc3_.x = 20;
         _loc3_.y = 146;
         addChild(_loc3_);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.xunzhangBtn:
               dispatchEvent(new BaseEvent(UI_GETXUNZHANG));
               break;
            case this.lookRankBtn:
               dispatchEvent(new BaseEvent(UI_LOOKRANK,"",this.currentPage));
         }
      }
      
      public function update(param1:int, param2:Boolean) : void
      {
         this.zhengguzhi.text = LanResManager.getLanCommonTextWords("当前整蛊值：") + param1;
         this.xunzhangBtn.enabled = param2;
      }
   }
}

