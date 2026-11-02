package com.tgame.shell.view.components.tunshitiandi
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class TunShiTianDi_PaiHangBang extends FPanel
   {
      
      public var _$parent:DisplayObject;
      
      private var bg:DisplayObject;
      
      private var homePageBtn:SmallButton;
      
      private var endPageBtn:SmallButton;
      
      private var shangyiyeButton:SmallButton;
      
      private var xiayiyeButton:SmallButton;
      
      private var cengshu:FTextArea;
      
      private var nowlook:int = 0;
      
      private var maxPage:int = 0;
      
      private var wodepaiming:FTextArea;
      
      private var listContainer:Sprite;
      
      private var giftList:FList;
      
      private var tf:TextFormat;
      
      private var titleFta:FTextArea;
      
      public function TunShiTianDi_PaiHangBang()
      {
         super();
         titleText = LanResManager.getLanCommonTextWords("排行榜");
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 545 + 3;
         height = 320 + 45 + 16;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/woHuCangLong/paiHangBg.swf");
         this.bg.x = 10;
         this.bg.y = 2;
         addChild(this.bg);
         this.titleFta = new FTextArea();
         this.titleFta.filters = StaticValue.filter;
         this.titleFta.width = 550;
         this.titleFta.height = 110;
         this.titleFta.x = 25;
         this.titleFta.y = 10;
         this.titleFta.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("排名") + "         " + LanResManager.getLanCommonTextWords("玩家名称") + "           " + LanResManager.getLanCommonTextWords("弟子名称") + "         " + LanResManager.getLanCommonTextWords("平台") + "          " + LanResManager.getLanCommonTextWords("积分") + "          " + LanResManager.getLanCommonTextWords("胜率") + "</font>";
         addChild(this.titleFta);
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 5;
            y = 30;
         }
         this.listContainer.mouseChildren = false;
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new TunShiTianDi_PaiHangBangList();
         this.giftList.listWidth = 345 + 20 + 15 + 60 + 10 + 19;
         this.listContainer.addChild(this.giftList);
         this.giftList.x = 0;
         this.giftList.y = 0;
         this.homePageBtn = new SmallButton();
         this.homePageBtn.label = LanResManager.getLanCommonTextWords("首页");
         addChild(this.homePageBtn);
         this.homePageBtn.x = 120;
         this.homePageBtn.y = 283;
         this.homePageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.shangyiyeButton = new SmallButton();
         this.shangyiyeButton.label = LanResManager.getLanCommonTextWords("上一页");
         addChild(this.shangyiyeButton);
         this.shangyiyeButton.x = 120 + 50;
         this.shangyiyeButton.y = 283;
         this.shangyiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cengshu = new FTextArea();
         addChild(this.cengshu);
         this.cengshu.defaultTextFormat = this.tf;
         this.cengshu.background = true;
         this.cengshu.backgroundColor = 1186072;
         this.cengshu.width = 59;
         this.cengshu.height = 17;
         this.cengshu.x = 245;
         this.cengshu.y = 283;
         this.xiayiyeButton = new SmallButton();
         this.xiayiyeButton.label = LanResManager.getLanCommonTextWords("下一页");
         addChild(this.xiayiyeButton);
         this.xiayiyeButton.x = 335;
         this.xiayiyeButton.y = 283;
         this.xiayiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.endPageBtn = new SmallButton();
         this.endPageBtn.label = LanResManager.getLanCommonTextWords("尾页");
         addChild(this.endPageBtn);
         this.endPageBtn.x = 395;
         this.endPageBtn.y = 283;
         this.endPageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.wodepaiming = new FTextArea();
         this.wodepaiming.multiline = true;
         this.wodepaiming.filters = StaticValue.filter;
         this.wodepaiming.width = 200;
         this.wodepaiming.height = 110;
         this.wodepaiming.x = 20;
         this.wodepaiming.y = 317;
         addChild(this.wodepaiming);
         this.wodepaiming.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("我的排名：") + "789541</font>";
      }
      
      public function onClose(param1:* = null) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.shangyiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(TunShiTianDi.TUNSHITIANDI_PAIHANGBANG_FANYE_CLICK,"",this.nowlook - 1));
               break;
            case this.xiayiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(TunShiTianDi.TUNSHITIANDI_PAIHANGBANG_FANYE_CLICK,"",this.nowlook + 1));
               break;
            case this.homePageBtn:
               this._$parent.dispatchEvent(new BaseEvent(TunShiTianDi.TUNSHITIANDI_PAIHANGBANG_FANYE_CLICK,"",1));
               break;
            case this.endPageBtn:
               this._$parent.dispatchEvent(new BaseEvent(TunShiTianDi.TUNSHITIANDI_PAIHANGBANG_FANYE_CLICK,"",this.maxPage));
         }
      }
      
      public function setInitialize(param1:int, param2:int, param3:Array, param4:int) : void
      {
         this.homePageBtn.enabled = this.shangyiyeButton.enabled = param1 != 1;
         this.endPageBtn.enabled = this.xiayiyeButton.enabled = param1 != param2;
         this.giftList.dataProvider = param3;
         this.nowlook = param1;
         this.maxPage = param2;
         if(param4 == 0)
         {
            this.wodepaiming.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("您的当前排名：未上榜") + "</font>";
         }
         else
         {
            this.wodepaiming.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("您的当前排名：") + param4 + "</font>";
         }
         this.cengshu.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + param1 + "/" + param2 + "</font>";
         if(param1 <= 1)
         {
            this.shangyiyeButton.enabled = false;
         }
         else if(param1 >= param2)
         {
            this.xiayiyeButton.enabled = false;
         }
      }
   }
}

