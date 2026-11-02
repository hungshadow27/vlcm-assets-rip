package com.tgame.shell.view.components.duixueren
{
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class DuiXueRenRankPanel extends FPanel
   {
      
      private var rankList:FList;
      
      private var pageText:FTextArea;
      
      private var nextpageBtn:SmallButton;
      
      private var previouspageBtn:SmallButton;
      
      private var meirenBtn:SecondButton;
      
      private var paiming:FTextArea;
      
      public var $parent:DisplayObject;
      
      private var yishiyong:FTextArea;
      
      private var currentPage:int;
      
      private var totalPage:int;
      
      public function DuiXueRenRankPanel()
      {
         var _loc2_:FTextArea = null;
         super();
         this.titleText = LanResManager.getLanCommonTextWords("堆雪人积分排行榜");
         this.showCloseButton = false;
         this.skin = "panel_btn";
         this.dragAble = false;
         width = 260;
         height = 500;
         var _loc1_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/duanwujie/rankBg.swf");
         _loc1_.x = 8;
         _loc1_.y = 0;
         addChild(_loc1_);
         this.rankList = new FList();
         this.rankList.skin = "list";
         this.rankList.itemRenderer = new DuiXueRenRankRender();
         this.rankList.listWidth = 240;
         this.rankList.x = 10;
         this.rankList.y = 22;
         addChild(this.rankList);
         this.pageText = new FTextArea();
         this.pageText.textColor = StaticValue.WHITE;
         this.pageText.x = 108;
         this.pageText.y = 271;
         addChild(this.pageText);
         this.previouspageBtn = new SmallButton();
         this.previouspageBtn.label = LanResManager.getLanCommonTextWords("上一页");
         this.previouspageBtn.x = 62;
         this.previouspageBtn.y = 271;
         addChild(this.previouspageBtn);
         this.previouspageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextpageBtn = new SmallButton();
         this.nextpageBtn.label = LanResManager.getLanCommonTextWords("下一页");
         this.nextpageBtn.x = 143;
         this.nextpageBtn.y = 271;
         addChild(this.nextpageBtn);
         this.nextpageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.meirenBtn = new SecondButton();
         this.meirenBtn.label = LanResManager.getLanCommonTextWords("领取");
         this.meirenBtn.x = 88 + 10;
         this.meirenBtn.y = 341 + 51 + 44;
         addChild(this.meirenBtn);
         this.meirenBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.paiming = new FTextArea();
         this.paiming.filters = StaticValue.filter;
         this.paiming.x = 10;
         this.paiming.y = 295 + 5;
         this.paiming.width = 224;
         this.paiming.height = 40;
         addChild(this.paiming);
         this.yishiyong = new FTextArea();
         this.yishiyong.textColor = StaticValue.BlUE20;
         this.yishiyong.filters = StaticValue.filter;
         this.yishiyong.x = 10;
         this.yishiyong.y = 295 + 5 + 20;
         this.yishiyong.width = 224;
         this.yishiyong.height = 20;
         addChild(this.yishiyong);
         _loc2_ = new FTextArea();
         _loc2_.htmlText = LanResManager.getLanCommonTextWords("领奖日期：12月30日22:00-12月31日24:00 排行榜不同名次的玩家可获得对应的奖励");
         _loc2_.textColor = StaticValue.GREEN;
         _loc2_.filters = StaticValue.filter;
         _loc2_.wordWrap = true;
         _loc2_.x = 10;
         _loc2_.y = 295 + 51 + 5;
         _loc2_.width = 236;
         _loc2_.height = 80;
         addChild(_loc2_);
         _loc2_ = new FTextArea();
         _loc2_.text = LanResManager.getLanCommonTextWords("排名");
         _loc2_.textColor = StaticValue.BlUE20;
         _loc2_.filters = StaticValue.filter;
         _loc2_.x = 15;
         _loc2_.y = 5;
         _loc2_.width = _loc2_.textWidth + 10;
         _loc2_.height = 20;
         addChild(_loc2_);
         _loc2_ = new FTextArea();
         _loc2_.text = LanResManager.getLanCommonTextWords("玩家名称");
         _loc2_.textColor = StaticValue.BlUE20;
         _loc2_.filters = StaticValue.filter;
         _loc2_.x = 50 + 30;
         _loc2_.y = 5;
         _loc2_.width = _loc2_.textWidth + 10;
         _loc2_.height = 20;
         addChild(_loc2_);
         _loc2_ = new FTextArea();
         _loc2_.text = LanResManager.getLanCommonTextWords("雪人积分");
         _loc2_.textColor = StaticValue.BlUE20;
         _loc2_.filters = StaticValue.filter;
         _loc2_.x = 177;
         _loc2_.y = 5;
         _loc2_.width = _loc2_.textWidth + 10;
         _loc2_.height = 20;
         addChild(_loc2_);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.meirenBtn:
               this.$parent.dispatchEvent(new BaseEvent(DuiXueRenPanel.JIAONANGRANK_LINGQU_CLICK));
               break;
            case this.nextpageBtn:
               if(this.currentPage < this.totalPage)
               {
                  this.currentPage += 1;
               }
               this.$parent.dispatchEvent(new BaseEvent(DuiXueRenPanel.JIAONANGRANK_FANYE_CLICK,"",this.currentPage));
               break;
            case this.previouspageBtn:
               if(this.currentPage > 1)
               {
                  --this.currentPage;
               }
               this.$parent.dispatchEvent(new BaseEvent(DuiXueRenPanel.JIAONANGRANK_FANYE_CLICK,"",this.currentPage));
         }
      }
      
      public function setJiaoNangDaLuanDouRankData(param1:Array, param2:Object) : void
      {
         this.meirenBtn.enabled = param2.type;
         this.rankList.dataProvider = param1;
         this.currentPage = param2.currPage;
         this.totalPage = param2.maxPage;
         if(this.totalPage == 0)
         {
            this.totalPage = 1;
         }
         this.pageText.text = this.currentPage + "/" + this.totalPage;
         var _loc3_:int = int(param2.rank);
         if(_loc3_ > 0)
         {
            this.paiming.htmlText = "<font color = \'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("您的当前排名：") + _loc3_ + "<br>" + LanResManager.getLanCommonTextWords("您的当前积分：") + param2.score + "<br>";
         }
         else
         {
            this.paiming.htmlText = "<font color = \'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("您的当前排名：未上榜") + "<br>" + LanResManager.getLanCommonTextWords("您的当前积分：") + param2.score + "<br>";
         }
         if(this.currentPage <= 1)
         {
            this.previouspageBtn.enabled = false;
         }
         else
         {
            this.previouspageBtn.enabled = true;
         }
         if(this.totalPage == this.currentPage)
         {
            this.nextpageBtn.enabled = false;
         }
         else
         {
            this.nextpageBtn.enabled = true;
         }
      }
   }
}

