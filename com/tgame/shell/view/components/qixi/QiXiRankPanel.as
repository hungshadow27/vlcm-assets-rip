package com.tgame.shell.view.components.qixi
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class QiXiRankPanel extends FPanel
   {
      
      private var nextpageBtn:SmallButton;
      
      private var previouspageBtn:SmallButton;
      
      private var tijiaoBtn:SmallButton;
      
      private var currentPage:int = 1;
      
      private var list:FList;
      
      private var pageText:FTextArea = new FTextArea();
      
      private var totalPage:int = 0;
      
      public var $parent:DisplayObject;
      
      private var paiming:FTextArea;
      
      private var tijiaoxique:TiJiaoXiQuePanel;
      
      public function QiXiRankPanel()
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:FTextArea = null;
         super();
         this.titleText = LanResManager.getLanCommonTextWords("七夕活跃度排行榜");
         this.showCloseButton = false;
         this.skin = "panel";
         this.dragAble = true;
         width = 261 + 4;
         height = 403 + 51 + 143 - 31;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         _loc1_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/qixi/paihangBg.swf");
         _loc1_.x = 8;
         _loc1_.y = 0;
         addChild(_loc1_);
         _loc2_ = new FTextArea();
         _loc2_.htmlText = LanResManager.getLanCommonTextWords("提交牵牛织女碎片为牛郎织女送去祝福，每个碎片将为您增加1点活跃度，提交截止日期2014年8月2日24点。提交截止后，排行榜前10的玩家可以领取七夕情缘套装大奖。");
         _loc2_.textColor = StaticValue.YELLOW;
         _loc2_.filters = StaticValue.filter;
         _loc2_.wordWrap = true;
         _loc2_.x = 10 + 14;
         _loc2_.y = 428 - 33;
         _loc2_.width = 230;
         _loc2_.height = _loc2_.textHeight + 20;
         addChild(_loc2_);
         _loc2_ = new FTextArea();
         _loc2_.text = LanResManager.getLanCommonTextWords("排名");
         _loc2_.textColor = StaticValue.BlUE20;
         _loc2_.filters = StaticValue.filter;
         _loc2_.x = 15 + 7;
         _loc2_.y = 22;
         _loc2_.width = _loc2_.textWidth + 10;
         _loc2_.height = _loc2_.textHeight;
         addChild(_loc2_);
         _loc2_ = new FTextArea();
         _loc2_.text = LanResManager.getLanCommonTextWords("玩家名称");
         _loc2_.textColor = StaticValue.BlUE20;
         _loc2_.filters = StaticValue.filter;
         _loc2_.x = 91 - 15;
         _loc2_.y = 22;
         _loc2_.width = _loc2_.textWidth + 10;
         _loc2_.height = _loc2_.textHeight;
         addChild(_loc2_);
         _loc2_ = new FTextArea();
         _loc2_.text = LanResManager.getLanCommonTextWords("活跃度");
         _loc2_.textColor = StaticValue.BlUE20;
         _loc2_.filters = StaticValue.filter;
         _loc2_.x = 183 + 22;
         _loc2_.y = 22;
         _loc2_.width = _loc2_.textWidth + 10;
         _loc2_.height = _loc2_.textHeight;
         addChild(_loc2_);
         _loc2_ = new FTextArea();
         _loc2_.textColor = StaticValue.YELLOW;
         _loc2_.filters = StaticValue.filter;
         _loc2_.x = 64;
         _loc2_.y = 19;
         _loc2_.htmlText = "<font size = \'15\'>" + LanResManager.getLanCommonTextWords("七夕节") + "</font>";
         this.pageText = new FTextArea();
         this.pageText.textColor = StaticValue.WHITE;
         this.pageText.text = "1/10";
         this.pageText.x = 108;
         this.pageText.y = 271 + 123 - 30;
         addChild(this.pageText);
         this.list = new FList();
         this.list.itemRenderer = new QiXiJieRandListRender();
         this.list.x = 11 + 15;
         this.list.y = 76 + 6 - 24;
         this.list.listWidth = 238;
         this.list.listHeight = 250;
         this.list.skin = "list";
         addChild(this.list);
         this.list.mouseChildren = false;
         this.previouspageBtn = new SmallButton();
         this.previouspageBtn.label = LanResManager.getLanCommonTextWords("上一页");
         this.previouspageBtn.x = 62;
         this.previouspageBtn.y = 271 + 123 - 30;
         addChild(this.previouspageBtn);
         this.previouspageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextpageBtn = new SmallButton();
         this.nextpageBtn.label = LanResManager.getLanCommonTextWords("下一页");
         this.nextpageBtn.x = 138;
         this.nextpageBtn.y = 271 + 123 - 30;
         addChild(this.nextpageBtn);
         this.nextpageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tijiaoBtn = new SmallButton();
         this.tijiaoBtn.label = LanResManager.getLanCommonTextWords("提交物品");
         this.tijiaoBtn.x = 105;
         this.tijiaoBtn.y = 485;
         addChild(this.tijiaoBtn);
         this.tijiaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.paiming = new FTextArea();
         this.paiming.filters = StaticValue.filter;
         this.paiming.x = 56;
         this.paiming.y = 355 - 30;
         this.paiming.width = 224;
         this.paiming.height = 20 + 20;
         addChild(this.paiming);
         if(!this.tijiaoxique)
         {
            this.tijiaoxique = new TiJiaoXiQuePanel();
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:Goods = null;
         switch(param1.currentTarget)
         {
            case this.nextpageBtn:
               if(this.currentPage < this.totalPage)
               {
                  this.currentPage += 1;
               }
               this.$parent.dispatchEvent(new BaseEvent(QiXiPanel.UI_QIXI_PAIHANG,"",this.currentPage));
               break;
            case this.previouspageBtn:
               if(this.currentPage > 1)
               {
                  --this.currentPage;
               }
               this.$parent.dispatchEvent(new BaseEvent(QiXiPanel.UI_QIXI_PAIHANG,"",this.currentPage));
               break;
            case this.tijiaoBtn:
               if(!this.tijiaoxique)
               {
                  this.tijiaoxique = new TiJiaoXiQuePanel();
               }
               this.tijiaoxique.x = 44;
               this.tijiaoxique.y = 262;
               this.tijiaoxique.dragAble = false;
               addChild(this.tijiaoxique);
               _loc2_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(42611,true);
               this.tijiaoxique.update(_loc2_.count);
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function guanbi() : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this.$parent = param1;
         this.tijiaoxique.$parent = param1;
      }
      
      public function updateRank(param1:int, param2:int, param3:Array, param4:int, param5:int) : void
      {
         if(param4 > 0)
         {
            this.paiming.htmlText = "<font color = \'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("您的当前排名：") + param4 + "<br>" + LanResManager.getLanCommonTextWords("您当前的活跃度：") + param5 + "</font >";
         }
         else
         {
            this.paiming.htmlText = "<font color = \'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("您的当前排名：未上榜") + "<br>" + LanResManager.getLanCommonTextWords("您当前的活跃度：") + param5 + "</font >";
         }
         this.currentPage = param1;
         this.totalPage = param2;
         if(this.currentPage <= 1)
         {
            this.previouspageBtn.enabled = false;
         }
         else
         {
            this.previouspageBtn.enabled = true;
         }
         if(this.currentPage == this.totalPage)
         {
            this.nextpageBtn.enabled = false;
         }
         else
         {
            this.nextpageBtn.enabled = true;
         }
         this.pageText.text = param1 + "/" + param2;
         this.list.dataProvider = param3;
      }
   }
}

