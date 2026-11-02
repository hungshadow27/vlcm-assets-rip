package com.tgame.shell.view.components.yurenjie
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
   
   public class YuRenJieRankPanel extends FPanel
   {
      
      private var zhanpaoBtn:SecondButton;
      
      private var nextpageBtn:SmallButton;
      
      private var previouspageBtn:SmallButton;
      
      private var currentPage:int = 1;
      
      private var list:FList;
      
      private var pageText:FTextArea = new FTextArea();
      
      private var totalPage:int = 0;
      
      public var $parent:DisplayObject;
      
      public function YuRenJieRankPanel()
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:FTextArea = null;
         super();
         this.titleText = LanResManager.getLanCommonTextWords("整蛊王排行榜");
         this.showCloseButton = true;
         this.skin = "panel_btn";
         this.dragAble = true;
         width = 261;
         height = 403;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         _loc1_ = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/zhengguwang/rank.png",240,328);
         _loc1_.x = 10;
         _loc1_.y = 2;
         addChild(_loc1_);
         _loc2_ = new FTextArea();
         _loc2_.text = LanResManager.getLanCommonTextWords("截至4月4日，被整蛊值前10名玩家可领取战袍");
         _loc2_.textColor = StaticValue.GREEN;
         _loc2_.filters = StaticValue.filter;
         _loc2_.x = 10;
         _loc2_.y = 307;
         _loc2_.width = _loc2_.textWidth + 10;
         _loc2_.height = _loc2_.textHeight;
         addChild(_loc2_);
         _loc2_ = new FTextArea();
         _loc2_.text = LanResManager.getLanCommonTextWords("玩家名称");
         _loc2_.textColor = StaticValue.BlUE20;
         _loc2_.filters = StaticValue.filter;
         _loc2_.x = 50;
         _loc2_.y = 5;
         _loc2_.width = _loc2_.textWidth + 10;
         _loc2_.height = _loc2_.textHeight;
         addChild(_loc2_);
         _loc2_ = new FTextArea();
         _loc2_.text = LanResManager.getLanCommonTextWords("被整蛊成功次数");
         _loc2_.textColor = StaticValue.BlUE20;
         _loc2_.filters = StaticValue.filter;
         _loc2_.x = 150;
         _loc2_.y = 5;
         _loc2_.width = _loc2_.textWidth + 10;
         _loc2_.height = _loc2_.textHeight;
         addChild(_loc2_);
         this.pageText = new FTextArea();
         this.pageText.textColor = StaticValue.WHITE;
         this.pageText.text = "1/10";
         this.pageText.x = 108;
         this.pageText.y = 282;
         addChild(this.pageText);
         this.zhanpaoBtn = new SecondButton();
         this.zhanpaoBtn.label = LanResManager.getLanCommonTextWords("领取战袍");
         this.zhanpaoBtn.x = 88;
         this.zhanpaoBtn.y = 341;
         addChild(this.zhanpaoBtn);
         this.zhanpaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.list = new FList();
         this.list.itemRenderer = new YuRenJieRandListRender();
         this.list.x = 11;
         this.list.y = 28;
         this.list.listWidth = 238;
         this.list.listHeight = 250;
         this.list.skin = "list";
         addChild(this.list);
         this.previouspageBtn = new SmallButton();
         this.previouspageBtn.label = LanResManager.getLanCommonTextWords("上一页");
         this.previouspageBtn.x = 62;
         this.previouspageBtn.y = 282;
         addChild(this.previouspageBtn);
         this.previouspageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextpageBtn = new SmallButton();
         this.nextpageBtn.label = LanResManager.getLanCommonTextWords("下一页");
         this.nextpageBtn.x = 138;
         this.nextpageBtn.y = 282;
         addChild(this.nextpageBtn);
         this.nextpageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.zhanpaoBtn:
               this.$parent.dispatchEvent(new BaseEvent(YuRenJiePanel.UI_GETZHANPAO));
               break;
            case this.nextpageBtn:
               if(this.currentPage < this.totalPage)
               {
                  this.currentPage += 1;
               }
               this.$parent.dispatchEvent(new BaseEvent(YuRenJiePanel.UI_LOOKRANK,"",this.currentPage));
               break;
            case this.previouspageBtn:
               if(this.currentPage > 1)
               {
                  --this.currentPage;
               }
               this.$parent.dispatchEvent(new BaseEvent(YuRenJiePanel.UI_LOOKRANK,"",this.currentPage));
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function updateRank(param1:int, param2:int, param3:Array, param4:Boolean) : void
      {
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
         this.zhanpaoBtn.enabled = param4;
      }
   }
}

