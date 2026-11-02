package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.couple.BuyGoodsPanel;
   import com.tgame.shell.view.components.couple.YupeiListRender;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class LaunchProposalPanel extends FPanel
   {
      
      public static const UI_LAUNCHPROPOSALPANEL_FANGRUDINGQINGPEI_CLICK:String = "UI_LAUNCHPROPOSALPANEL_FANGRUDINGQINGPEI_CLICK";
      
      public static const UI_LAUNCHPROPOSALPANEL_GOUMAIDINGQINGPEI_CLICK:String = "UI_LAUNCHPROPOSALPANEL_GOUMAIDINGQINGPEI_CLICK";
      
      public static const UI_LAUNCHPROPOSALPANEL_BUYGOODSPANEL_OK_CLICK:String = "UI_LAUNCHPROPOSALPANEL_BUYGOODSPANEL_OK_CLICK";
      
      public static const UI_LAUNCHPROPOSALPANEL_CHAKANZILIAO_CLICK:String = "UI_LAUNCHPROPOSALPANEL_CHAKANZILIAO_CLICK";
      
      public static const UI_LAUNCHPROPOSALPANEL_QIUHUN_CLICK:String = "UI_LAUNCHPROPOSALPANEL_QIUHUN_CLICK";
      
      public static const UI_LAUNCHPROPOSALPANEL_YUPEILISTRENDERI_OK_CLICK:String = "UI_LAUNCHPROPOSALPANEL_YUPEILISTRENDERI_OK_CLICK";
      
      private var ft:FTextArea;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var fangruBtn:SmallButton;
      
      private var goumaiBtn:SmallButton;
      
      private var ckzlBtn:SecondButton;
      
      private var qhBtn:SecondButton;
      
      private var myCloseBtn:SecondButton;
      
      private var touxiangImg:Bitmap;
      
      private var container:Sprite;
      
      private var yupeishopPanel:YupeiShopPanel;
      
      private var wanjiaId:int;
      
      public function LaunchProposalPanel()
      {
         var bg:Bitmap;
         var v:Vector.<Bitmap>;
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         this.dragRestrict = false;
         width = 393;
         height = 495;
         titleText = LanResManager.getLanCommonTextWords("发起求婚");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         bg = new Bitmap();
         bg.name = "ui.marriage.propose.ui";
         addChild(bg);
         bg.x = 10;
         bg.y = 2;
         v = new Vector.<Bitmap>();
         v.push(bg);
         this.DynamicManageImages = v;
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 90;
            y = 10;
            wordWrap = true;
            width = 115;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("昵称") + "：<br>" + LanResManager.getLanCommonTextWords("帮派") + "：</font></textformat>";
         }
         addChild(this.ft);
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            x = 126;
            y = 10;
            wordWrap = true;
            width = 115;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("昵称") + "1：<br>" + LanResManager.getLanCommonTextWords("帮派") + "1：</font></textformat>";
         }
         addChild(this.ft1);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 216 + 23;
            y = 10;
            wordWrap = true;
            width = 115;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("等级") + "：<br>" + LanResManager.getLanCommonTextWords("门派") + "：</font></textformat>";
         }
         addChild(this.ft);
         this.ft2 = new FTextArea();
         with(this.ft2)
         {
            x = 252 + 42;
            y = 10;
            wordWrap = true;
            width = 115;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("等级") + "1：<br>" + LanResManager.getLanCommonTextWords("门派") + "1：</font></textformat>";
         }
         addChild(this.ft2);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 90;
            y = 49;
            wordWrap = true;
            width = 315;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanCommonTextWords("请问您是希望向TA发出求婚请求吗？");
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 19;
            y = 77;
            wordWrap = true;
            width = 315;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanCommonTextWords("您需要先拥有一个定情玉佩以明心意");
         }
         addChild(this.ft);
         this.container = new Sprite();
         addChild(this.container);
         this.container.x = 33;
         this.container.y = 125;
         this.fangruBtn = new SmallButton();
         this.fangruBtn.label = LanResManager.getLanCommonTextWords("放入定情佩");
         addChild(this.fangruBtn);
         this.fangruBtn.x = 303;
         this.fangruBtn.y = 119;
         this.fangruBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.goumaiBtn = new SmallButton();
         this.goumaiBtn.label = LanResManager.getLanCommonTextWords("购买定情佩");
         addChild(this.goumaiBtn);
         this.goumaiBtn.x = 303;
         this.goumaiBtn.y = 141;
         this.goumaiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 12;
            y = 178;
            wordWrap = true;
            width = 455;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'3\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("婚后的你们可以") + "：</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,"和合双修") + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,"风雨同舟") + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,"守护") + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,"红颜") + "</font><br>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanTextWords(this,"比翼双飞") + "</font><br>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanTextWords(this,"并蒂连枝") + "</font><br>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanTextWords(this,"定情玉佩") + "</font><br>" + "</textformat>";
         }
         addChild(this.ft);
         this.ckzlBtn = new SecondButton();
         this.ckzlBtn.label = LanResManager.getLanCommonTextWords("查看资料");
         addChild(this.ckzlBtn);
         this.ckzlBtn.x = 65;
         this.ckzlBtn.y = 428;
         this.ckzlBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.qhBtn = new SecondButton();
         this.qhBtn.label = LanResManager.getLanCommonTextWords("求婚");
         addChild(this.qhBtn);
         this.qhBtn.x = 180;
         this.qhBtn.y = 428;
         this.qhBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.myCloseBtn = new SecondButton();
         this.myCloseBtn.label = LanResManager.getLanCommonTextWords("关闭");
         addChild(this.myCloseBtn);
         this.myCloseBtn.x = 280;
         this.myCloseBtn.y = 428;
         this.myCloseBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         addEventListener(UI_LAUNCHPROPOSALPANEL_YUPEILISTRENDERI_OK_CLICK,this.aa1);
      }
      
      private function aa1(param1:BaseEvent) : void
      {
         this.showBuyPanel(param1.data.id,param1.data.tubiaoMath,param1.data.name,int(param1.data.price));
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.fangruBtn:
               dispatchEvent(new BaseEvent(UI_LAUNCHPROPOSALPANEL_FANGRUDINGQINGPEI_CLICK));
               break;
            case this.goumaiBtn:
               dispatchEvent(new BaseEvent(UI_LAUNCHPROPOSALPANEL_GOUMAIDINGQINGPEI_CLICK));
               break;
            case this.ckzlBtn:
               dispatchEvent(new BaseEvent(UI_LAUNCHPROPOSALPANEL_CHAKANZILIAO_CLICK,"",this.wanjiaId));
               break;
            case this.qhBtn:
               dispatchEvent(new BaseEvent(UI_LAUNCHPROPOSALPANEL_QIUHUN_CLICK));
               break;
            case this.myCloseBtn:
               this.onClose();
         }
      }
      
      public function setInitialize(param1:String, param2:String, param3:String, param4:String, param5:String, param6:int) : void
      {
         if(this.touxiangImg != null && this.touxiangImg.parent != null)
         {
            this.touxiangImg.parent.removeChild(this.touxiangImg);
         }
         this.touxiangImg = new Bitmap(new BitmapData(35,35,true,0));
         this.touxiangImg.x = 31;
         this.touxiangImg.y = 16;
         addChild(this.touxiangImg);
         this.touxiangImg.bitmapData = StaticValue.getBitmapByClassName(param1).bitmapData;
         this.touxiangImg.width = 40;
         this.touxiangImg.height = 40;
         this.ft1.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + param2 + "<br>" + param3 + "</font></textformat>";
         this.ft2.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + param4 + "<br>" + param5 + "</font></textformat>";
         this.wanjiaId = param6;
      }
      
      public function setYupei(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:ItemFace = null;
         while(this.container.numChildren > 0)
         {
            this.container.removeChildAt(0);
         }
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = new ItemFace(param1[_loc2_]);
            this.container.addChild(_loc3_);
            if(_loc2_ == 0)
            {
               _loc3_.x = 0;
            }
            else if(_loc2_ == 1)
            {
               _loc3_.x = 75;
            }
            else if(_loc2_ == 2)
            {
               _loc3_.x = 120;
            }
            else if(_loc2_ == 3)
            {
               _loc3_.x = 178;
            }
            else if(_loc2_ == 4)
            {
               _loc3_.x = 223;
            }
            _loc2_++;
         }
      }
      
      public function showTupopingjingPanel(param1:Array) : void
      {
         if(!this.yupeishopPanel)
         {
            YupeiListRender.$parent = this;
            this.yupeishopPanel = new YupeiShopPanel();
            this.yupeishopPanel.$parent = this;
         }
         this.yupeishopPanel.visible = true;
         GameInstance.uiInstance.uiContainer.addChild(this.yupeishopPanel);
         this.yupeishopPanel.x = (GameConfig.sceneWidth - this.yupeishopPanel.width) / 2;
         this.yupeishopPanel.y = (GameConfig.sceneHeight - this.yupeishopPanel.height) / 2;
         this.yupeishopPanel.setInitialize(param1);
      }
      
      public function showBuyPanel(param1:int, param2:String, param3:String, param4:int) : void
      {
         var _loc5_:BuyGoodsPanel = new BuyGoodsPanel();
         _loc5_.$parent = this;
         _loc5_.setItem(param1,param2,param3,param4);
         POPWindowManager.showWindow(_loc5_);
      }
      
      public function closeBuyPanel() : void
      {
         POPWindowManager.closeWindow();
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         while(this.container.numChildren > 0)
         {
            this.container.removeChildAt(0);
         }
         if(this.touxiangImg != null && this.touxiangImg.parent != null)
         {
            this.touxiangImg.parent.removeChild(this.touxiangImg);
         }
         this.ft1.htmlText = "";
         this.ft2.htmlText = "";
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
   }
}

