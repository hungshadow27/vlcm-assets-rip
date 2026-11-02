package com.tgame.shell.view.components.wangzhezhibang
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.shell.view.components.WangzhezhibangPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class WangzhezhibangLijiebazhuPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var preBtn:FSimpleButton;
      
      private var nextBtn:FSimpleButton;
      
      private var homePageBtn:SmallButton;
      
      private var endPageBtn:SmallButton;
      
      private var listContainer:Sprite;
      
      private var giftList:FList;
      
      private var cengshu:FTextArea;
      
      private var ft:FTextArea;
      
      private var tf:TextFormat;
      
      private var titleFta:FTextArea;
      
      public function WangzhezhibangLijiebazhuPanel()
      {
         super();
         width = 505;
         height = 410;
         dragAble = true;
         titleText = LanResManager.getLanCommonTextWords("王帮史册");
         showCloseButton = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         var bg:DisplayObject = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/lijiebazhu_bg.png",490,370);
         bg.x = 8;
         bg.y = 0;
         addChild(bg);
         this.titleFta = new FTextArea();
         this.titleFta.filters = StaticValue.filter;
         this.titleFta.width = 550;
         this.titleFta.height = 110;
         this.titleFta.x = 15;
         this.titleFta.y = 10;
         this.titleFta.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + "  " + LanResManager.getLanCommonTextWords("届次") + "                " + LanResManager.getLanCommonTextWords("获胜时间") + "                              " + LanResManager.getLanCommonTextWords("获胜帮会") + "                                    " + LanResManager.getLanCommonTextWords("帮主") + "</font>";
         addChild(this.titleFta);
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 10;
            y = 30;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,510,290);
            graphics.endFill();
         }
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new WangzhezhibangLijiebazhuRanader();
         this.giftList.listWidth = 490;
         this.listContainer.addChild(this.giftList);
         this.giftList.x = 0;
         this.giftList.y = 0;
         this.homePageBtn = new SmallButton();
         this.homePageBtn.label = LanResManager.getLanCommonTextWords("首页");
         addChild(this.homePageBtn);
         this.homePageBtn.x = 180;
         this.homePageBtn.y = 310;
         this.homePageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.preBtn = new FSimpleButton();
         this.preBtn.skin = "previousButton";
         addChild(this.preBtn);
         this.preBtn.x = this.homePageBtn.x + this.homePageBtn.width + 5;
         this.preBtn.y = 310;
         this.preBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.cengshu = new FTextArea();
         addChild(this.cengshu);
         this.cengshu.defaultTextFormat = this.tf;
         this.cengshu.background = true;
         this.cengshu.backgroundColor = 1186072;
         this.cengshu.width = 50;
         this.cengshu.height = 17;
         this.cengshu.x = this.preBtn.x + this.preBtn.width + 5;
         this.cengshu.y = 310;
         this.nextBtn = new FSimpleButton();
         this.nextBtn.skin = "nextButton";
         addChild(this.nextBtn);
         this.nextBtn.x = this.cengshu.x + this.cengshu.width + 5;
         this.nextBtn.y = 310;
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.endPageBtn = new SmallButton();
         this.endPageBtn.label = LanResManager.getLanCommonTextWords("尾页");
         addChild(this.endPageBtn);
         this.endPageBtn.x = this.nextBtn.x + this.nextBtn.width + 5;
         this.endPageBtn.y = 310;
         this.endPageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ft = new FTextArea();
         this.ft.x = 15;
         this.ft.y = 340;
         this.ft.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("这里记载着英雄们的辉煌，为了帮会的荣誉，勇往直前！") + "</font>";
         this.ft.width = 400;
         addChild(this.ft);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.preBtn:
               this.$parent.dispatchEvent(new BaseEvent(WangzhezhibangPanel.UI_WANGBANGZHIZHAN_FANYE,"",2));
               break;
            case this.nextBtn:
               this.$parent.dispatchEvent(new BaseEvent(WangzhezhibangPanel.UI_WANGBANGZHIZHAN_FANYE,"",3));
               break;
            case this.homePageBtn:
               this.$parent.dispatchEvent(new BaseEvent(WangzhezhibangPanel.UI_WANGBANGZHIZHAN_FANYE,"",1));
               break;
            case this.endPageBtn:
               this.$parent.dispatchEvent(new BaseEvent(WangzhezhibangPanel.UI_WANGBANGZHIZHAN_FANYE,"",4));
         }
      }
      
      public function setData(param1:Array, param2:int, param3:int) : void
      {
         this.giftList.dataProvider = param1;
         this.cengshu.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param2 + "/" + param3 + "</font>";
         if(param2 == 1)
         {
            this.homePageBtn.enabled = false;
            this.preBtn.enabled = false;
         }
         else
         {
            this.homePageBtn.enabled = true;
            this.preBtn.enabled = true;
         }
         if(param3 == param2)
         {
            this.nextBtn.enabled = false;
            this.endPageBtn.enabled = false;
         }
         else
         {
            this.nextBtn.enabled = true;
            this.endPageBtn.enabled = true;
         }
      }
   }
}

