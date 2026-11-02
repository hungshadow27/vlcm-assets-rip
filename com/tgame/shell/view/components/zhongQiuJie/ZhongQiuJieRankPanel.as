package com.tgame.shell.view.components.zhongQiuJie
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.manager.PipeManager;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class ZhongQiuJieRankPanel extends FPanel
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
      
      public function ZhongQiuJieRankPanel()
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:FTextArea = null;
         super();
         this.titleText = LanResManager.getLanCommonTextWords("中秋月饼排行榜");
         this.showCloseButton = true;
         this.skin = "panel_btn";
         this.dragAble = true;
         width = 261;
         height = 403 + 51;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         _loc1_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/zhongQiuJie/rank.swf");
         _loc1_.x = 10;
         _loc1_.y = 2;
         addChild(_loc1_);
         _loc2_ = new FTextArea();
         _loc2_.htmlText = LanResManager.getLanCommonTextWords("截止9月8日22点整,排行前10名的玩家可以获") + "<br>" + LanResManager.getLanCommonTextWords("得永久全服唯一一款月兔双人坐骑换装一套。");
         _loc2_.textColor = StaticValue.GREEN;
         _loc2_.filters = StaticValue.filter;
         _loc2_.x = 10;
         _loc2_.y = 295 + 51 - 10;
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
         _loc2_.text = LanResManager.getLanCommonTextWords("月饼数量");
         _loc2_.textColor = StaticValue.BlUE20;
         _loc2_.filters = StaticValue.filter;
         _loc2_.x = 177;
         _loc2_.y = 5;
         _loc2_.width = _loc2_.textWidth + 10;
         _loc2_.height = 20;
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
         this.list.itemRenderer = new ZhongQiuJieRandListRender();
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
         this.paiming = new FTextArea();
         this.paiming.filters = StaticValue.filter;
         this.paiming.x = 10;
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
               PipeManager.sendMsg(PipeConstants.REQUEST_YN_BOOK_GETRANK_GOODS);
               break;
            case this.nextpageBtn:
               if(this.currentPage < this.totalPage)
               {
                  this.currentPage += 1;
               }
               PipeManager.sendMsg(PipeConstants.REQUEST_YN_BOOK_PAIHANG,this.currentPage);
               break;
            case this.previouspageBtn:
               if(this.currentPage > 1)
               {
                  --this.currentPage;
               }
               PipeManager.sendMsg(PipeConstants.REQUEST_YN_BOOK_PAIHANG,this.currentPage);
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
         if(param1 == 0)
         {
            param1 = 1;
         }
         if(param2 == 0)
         {
            param2 = 1;
         }
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

