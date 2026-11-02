package com.tgame.shell.view.components.fengzhengjie
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class FengZhengJieRankPanel extends FPanel
   {
      
      private var meirenBtn:SecondButton;
      
      private var nextpageBtn:SmallButton;
      
      private var previouspageBtn:SmallButton;
      
      private var currentPage:int = 1;
      
      private var list:FList;
      
      private var pageText:FTextArea = new FTextArea();
      
      private var totalPage:int = 0;
      
      public var $parent:DisplayObject;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var type:int = -1;
      
      public function FengZhengJieRankPanel()
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:FTextArea = null;
         super();
         this.titleText = LanResManager.getLanCommonTextWords("倾慕值排行榜");
         this.showCloseButton = true;
         this.skin = "panel_btn";
         this.dragAble = true;
         width = 261;
         height = 403;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         _loc1_ = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/fengzhengjie/rank.png",240,328);
         _loc1_.x = 10;
         _loc1_.y = 2;
         addChild(_loc1_);
         this.ft1 = new FTextArea();
         this.ft1.textColor = StaticValue.GREEN;
         this.ft1.filters = StaticValue.filter;
         this.ft1.x = 10;
         this.ft1.y = 295;
         this.ft1.wordWrap = true;
         this.ft1.width = 230;
         this.ft1.height = 35;
         addChild(this.ft1);
         _loc2_ = new FTextArea();
         _loc2_ = new FTextArea();
         _loc2_.text = LanResManager.getLanCommonTextWords("玩家名称");
         _loc2_.textColor = StaticValue.BlUE20;
         _loc2_.filters = StaticValue.filter;
         _loc2_.x = 50;
         _loc2_.y = 5;
         _loc2_.width = _loc2_.textWidth + 10;
         _loc2_.height = 25;
         addChild(_loc2_);
         this.ft2 = new FTextArea();
         this.ft2.text = LanResManager.getLanCommonTextWords("倾慕值");
         this.ft2.textColor = StaticValue.BlUE20;
         this.ft2.filters = StaticValue.filter;
         this.ft2.x = 177;
         this.ft2.y = 5;
         this.ft2.width = _loc2_.textWidth + 10;
         this.ft2.height = 25;
         addChild(this.ft2);
         this.pageText = new FTextArea();
         this.pageText.textColor = StaticValue.WHITE;
         this.pageText.text = "1/10";
         this.pageText.x = 108;
         this.pageText.y = 271;
         addChild(this.pageText);
         this.meirenBtn = new SecondButton();
         this.meirenBtn.label = LanResManager.getLanCommonTextWords("领取美人");
         this.meirenBtn.x = 88;
         this.meirenBtn.y = 341;
         addChild(this.meirenBtn);
         this.meirenBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.list = new FList();
         this.list.itemRenderer = new FengZhengJieRandListRender();
         this.list.x = 11;
         this.list.y = 28;
         this.list.listWidth = 238;
         this.list.listHeight = 250;
         this.list.skin = "list";
         addChild(this.list);
         this.list.mouseChildren = false;
         this.previouspageBtn = new SmallButton();
         this.previouspageBtn.label = LanResManager.getLanCommonTextWords("上一页");
         this.previouspageBtn.x = 62;
         this.previouspageBtn.y = 271;
         addChild(this.previouspageBtn);
         this.previouspageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextpageBtn = new SmallButton();
         this.nextpageBtn.label = LanResManager.getLanCommonTextWords("下一页");
         this.nextpageBtn.x = 138;
         this.nextpageBtn.y = 271;
         addChild(this.nextpageBtn);
         this.nextpageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.meirenBtn:
               this.$parent.dispatchEvent(new BaseEvent(FengZhengJiePanel.UI_GETMEIREN,"",this.type));
               break;
            case this.nextpageBtn:
               if(this.currentPage < this.totalPage)
               {
                  this.currentPage += 1;
               }
               this.$parent.dispatchEvent(new BaseEvent(FengZhengJiePanel.UI_LOOKRANK,"",[this.currentPage,this.type]));
               break;
            case this.previouspageBtn:
               if(this.currentPage > 1)
               {
                  --this.currentPage;
               }
               this.$parent.dispatchEvent(new BaseEvent(FengZhengJiePanel.UI_LOOKRANK,"",[this.currentPage,this.type]));
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function updateRank(param1:int, param2:int, param3:int, param4:Array, param5:Boolean) : void
      {
         this.currentPage = param2;
         if(param3 == 0)
         {
            param3 = 1;
         }
         this.totalPage = param3;
         if(this.currentPage <= 1)
         {
            this.previouspageBtn.enabled = false;
         }
         else
         {
            this.previouspageBtn.enabled = true;
         }
         if(this.currentPage == this.totalPage || this.totalPage == 0)
         {
            this.nextpageBtn.enabled = false;
         }
         else
         {
            this.nextpageBtn.enabled = true;
         }
         this.pageText.text = param2 + "/" + param3;
         this.list.dataProvider = param4;
         this.meirenBtn.enabled = param5;
         if(param1 == 1)
         {
            this.ft1.htmlText = LanResManager.getLanCommonTextWords("截止5月1日22点整,排行前10名的玩家可抱得美人归,领取全服限量版秋香美人.");
            this.titleText = LanResManager.getLanCommonTextWords("倾慕值排行榜");
            this.ft2.text = LanResManager.getLanCommonTextWords("倾慕值");
         }
         else
         {
            this.ft1.htmlText = LanResManager.getLanCommonTextWords("截止9月18日22点整,排行前10名的玩家可抱得美人归,领取全服限量版嫦娥美人.");
            this.titleText = LanResManager.getLanCommonTextWords("好感度排行榜");
            this.ft2.text = LanResManager.getLanCommonTextWords("好感度");
         }
         this.type = param1;
      }
   }
}

