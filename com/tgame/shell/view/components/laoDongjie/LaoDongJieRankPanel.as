package com.tgame.shell.view.components.laoDongjie
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.shell.view.components.duanwujie2015.DuanWuJie2015Panel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class LaoDongJieRankPanel extends FPanel
   {
      
      private var meirenBtn:SecondButton;
      
      private var nextpageBtn:SmallButton;
      
      private var previouspageBtn:SmallButton;
      
      private var currentPage:int = 1;
      
      private var list:FList;
      
      private var pageText:FTextArea = new FTextArea();
      
      private var totalPage:int = 0;
      
      public var $parent:DisplayObject;
      
      private var paiming:FTextArea;
      
      public function LaoDongJieRankPanel()
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:FTextArea = null;
         super();
         this.titleText = LanResManager.getLanCommonTextWords("魔气排行榜");
         this.showCloseButton = false;
         this.skin = "panel_btn";
         this.dragAble = true;
         width = 261;
         height = 403 + 51;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         _loc1_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/duanwujie/paihang.swf");
         _loc1_.x = 10;
         _loc1_.y = 2;
         addChild(_loc1_);
         _loc2_ = new FTextArea();
         _loc2_.htmlText = LanResManager.getLanCommonTextWords("领奖时间：2015年7月21日22:00:00 - 2015年") + "<br>" + "             " + LanResManager.getLanCommonTextWords("7月22日24:00:00");
         _loc2_.textColor = StaticValue.GREEN;
         _loc2_.filters = StaticValue.filter;
         _loc2_.x = 13;
         _loc2_.y = 336;
         _loc2_.width = _loc2_.textWidth + 10;
         _loc2_.height = _loc2_.textHeight + 20;
         addChild(_loc2_);
         _loc2_ = new FTextArea();
         _loc2_.text = LanResManager.getLanCommonTextWords("排名");
         _loc2_.textColor = StaticValue.BlUE20;
         _loc2_.filters = StaticValue.filter;
         _loc2_.x = 15;
         _loc2_.y = 5;
         _loc2_.width = _loc2_.textWidth + 10;
         _loc2_.height = _loc2_.textHeight;
         addChild(_loc2_);
         _loc2_ = new FTextArea();
         _loc2_.text = LanResManager.getLanCommonTextWords("玩家名称");
         _loc2_.textColor = StaticValue.BlUE20;
         _loc2_.filters = StaticValue.filter;
         _loc2_.x = 50 + 30;
         _loc2_.y = 5;
         _loc2_.width = _loc2_.textWidth + 10;
         _loc2_.height = _loc2_.textHeight;
         addChild(_loc2_);
         _loc2_ = new FTextArea();
         _loc2_.text = LanResManager.getLanCommonTextWords("魔气值");
         _loc2_.textColor = StaticValue.BlUE20;
         _loc2_.filters = StaticValue.filter;
         _loc2_.x = 177 + 18;
         _loc2_.y = 5;
         _loc2_.width = _loc2_.textWidth + 10;
         _loc2_.height = _loc2_.textHeight;
         addChild(_loc2_);
         this.pageText = new FTextArea();
         this.pageText.textColor = StaticValue.WHITE;
         this.pageText.text = "1/10";
         this.pageText.x = 108;
         this.pageText.y = 271;
         addChild(this.pageText);
         this.meirenBtn = new SecondButton();
         this.meirenBtn.label = LanResManager.getLanCommonTextWords("领取");
         this.meirenBtn.x = 88 + 10;
         this.meirenBtn.y = 341 + 51;
         addChild(this.meirenBtn);
         this.meirenBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.list = new FList();
         this.list.itemRenderer = new LaoDongJieRandListRender();
         this.list.x = 11;
         this.list.y = 28;
         this.list.listWidth = 238;
         this.list.listHeight = 250;
         this.list.skin = "list";
         addChild(this.list);
         this.list.mouseChildren = false;
         this.previouspageBtn = new SmallButton();
         this.previouspageBtn.label = LanResManager.getLanCommonTextWords("上一页");
         this.previouspageBtn.x = 62 - 20;
         this.previouspageBtn.y = 271;
         addChild(this.previouspageBtn);
         this.previouspageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextpageBtn = new SmallButton();
         this.nextpageBtn.label = LanResManager.getLanCommonTextWords("下一页");
         this.nextpageBtn.x = 138 + 20;
         this.nextpageBtn.y = 271;
         addChild(this.nextpageBtn);
         this.nextpageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.paiming = new FTextArea();
         this.paiming.filters = StaticValue.filter;
         this.paiming.x = 72;
         this.paiming.y = 295 + 5;
         this.paiming.width = 224;
         this.paiming.height = 20;
         addChild(this.paiming);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.meirenBtn:
               this.$parent.dispatchEvent(new BaseEvent(DuanWuJie2015Panel.UI_DUANWUJIE2015_GETPAIHANGJIANGLI));
               this.$parent.dispatchEvent(new BaseEvent(DuanWuJie2015Panel.UI_DUANWUJIE2015_PAIHANG,"",this.currentPage));
               break;
            case this.nextpageBtn:
               if(this.currentPage < this.totalPage)
               {
                  this.currentPage += 1;
               }
               this.$parent.dispatchEvent(new BaseEvent(DuanWuJie2015Panel.UI_DUANWUJIE2015_PAIHANG,"",this.currentPage));
               break;
            case this.previouspageBtn:
               if(this.currentPage > 1)
               {
                  --this.currentPage;
               }
               this.$parent.dispatchEvent(new BaseEvent(DuanWuJie2015Panel.UI_DUANWUJIE2015_PAIHANG,"",this.currentPage));
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
      
      public function updateRank(param1:int, param2:int, param3:Array, param4:Boolean, param5:int) : void
      {
         if(param5 > 0)
         {
            this.paiming.htmlText = "<font color = \'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("您的当前排名：") + param5 + "</font >";
         }
         else
         {
            this.paiming.htmlText = "<font color = \'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("您的当前排名：未上榜") + "</font >";
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
         this.meirenBtn.enabled = param4;
      }
   }
}

