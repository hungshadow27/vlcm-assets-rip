package com.tgame.shell.view.components
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.list.FListCellRenderer;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.attribute.EquipList;
   import com.tgame.shell.view.components.shitu.BaiShiPlayerListRender;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.RslLoaderManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   
   public class ShiTuSystemPanel extends FPanel
   {
      
      public static const UI_SHITUPANEL_LIST_GET_PAGE:String = "UI_SHITUPANEL_LIST_GET_PAGE";
      
      public static const UI_SHITUPANEL_PARTICULAR_INFO_SHOW:String = "UI_SHITUPANEL_PARTICULAR_INFO_SHOW";
      
      public static const UI_SHITUPANEL_ZIDONGTONGYIBAISHIORSHOUTU:String = "UI_SHITUPANEL_ZIDONGTONGYIBAISHIORSHOUTU";
      
      public static const UI_SHITUPANEL_GETEXP_BTN_CLICK:String = "UI_SHITUPANEL_GETEXP_BTN_CLICK";
      
      public static const UI_SHITUPANEL_GETSHENGWANG_BTN_CLICK:String = "UI_SHITUPANEL_GETSHENGWANG_BTN_CLICK";
      
      public static const UI_SHITUPANEL_SHENGWANGSHANGDIANGOUWU_BTN_CLICK:String = "UI_SHITUPANEL_SHENGWANGSHANGDIANGOUWU_BTN_CLICK";
      
      public static const UI_SHITUPANEL_BAISHIORSHOUTU_BTN_CLICK:String = "UI_SHITUPANEL_BAISHIORSHOUTU_BTN_CLICK";
      
      public static const UI_XIANGXIZILIAO_CLICK:String = "UI_XIANGXIZILIAO_CLICK";
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      public var bgImg:Bitmap;
      
      private var _avatar:Bitmap;
      
      private var chengHaoImg:Bitmap;
      
      private var equipContainer:Sprite;
      
      private var sortText:String = "";
      
      private var BaiShiPlayerList:FList;
      
      private var homePageBtn:SmallButton;
      
      private var endPageBtn:SmallButton;
      
      private var preBtn:FSimpleButton;
      
      private var nextBtn:FSimpleButton;
      
      private var pageCount:FLabel;
      
      private var tudiNum:Number = 0;
      
      private var tips:FTextArea;
      
      private var checkBox:FCheckBox;
      
      private var _sortBo:Boolean = true;
      
      private var flag:MovieClip;
      
      public var ico:CharAttributeOccultIco;
      
      private var peopleInfo:FTextArea;
      
      private var peopleInfo1:FTextArea;
      
      private var expTxt:FTextArea;
      
      private var swTxt:FTextArea;
      
      private var test_xml:XML;
      
      private var DiZiShuOrZaiXianTimeTxt:FTextArea;
      
      private var DiZiShuOrZaiXianTimeNumTxt:FTextArea;
      
      private var ZhandouliTxt:FTextArea;
      
      private var ZhandouliNumTxt:FTextArea;
      
      private var WugongJingjieTxt:FTextArea;
      
      private var WugongJingjieNumTxt:FTextArea;
      
      private var jinJieBar:ColorBar;
      
      private var shuomingTxt:FTextArea;
      
      private var PanelType:int = 0;
      
      private var ZiDongTongYiTxt:FTextArea;
      
      private var tudiShu:FLabel;
      
      private var tudushuSortBtn:FSimpleButton;
      
      private var tdzlBtn:SecondButton;
      
      private var img:Bitmap;
      
      private var getExpBtn:SmallButton;
      
      private var swShopBtn:SmallButton;
      
      private var getShengWangBtn:SmallButton;
      
      private var BaiShiORShouTuBtn:SecondButton;
      
      public var equipList:EquipList;
      
      private var yupei:ItemFace;
      
      public function ShiTuSystemPanel()
      {
         var v:Vector.<Bitmap>;
         var $mask:Sprite;
         var t1:FLabel;
         var t2:FLabel;
         var sortBtn:FSimpleButton;
         var t4:FLabel;
         var t7:FTextArea;
         this.test_xml = new XML();
         this.tudiShu = new FLabel();
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 580;
         height = 445;
         titleText = LanResManager.getLanCommonTextWords("我要拜师");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.bgImg = new Bitmap();
         this.bgImg.x = 10;
         this.bgImg.y = 2;
         addChild(this.bgImg);
         this.bgImg.name = "ui.shitu.ui";
         v = new Vector.<Bitmap>();
         v.push(this.bgImg);
         this.DynamicManageImages = v;
         this._avatar = new Bitmap();
         addChild(this._avatar);
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 0;
         $mask.y = 0;
         with($mask.graphics)
         {
            beginFill(0,0);
            drawRect(-9999,0,99999,99999);
            endFill();
         }
         this._avatar.mask = $mask;
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
         }
         this.tipCanvas.addChild(this.tip);
         this.BaiShiPlayerList = new FList();
         this.BaiShiPlayerList.skin = "list";
         this.BaiShiPlayerList.isUseCellRealHeight = true;
         this.BaiShiPlayerList.itemRenderer = new BaiShiPlayerListRender();
         this.BaiShiPlayerList.listWidth = 338;
         this.BaiShiPlayerList.x = 230;
         this.BaiShiPlayerList.y = 33;
         this.BaiShiPlayerList.addEventListener(MouseEvent.CLICK,this.onList);
         this.BaiShiPlayerList.addEventListener(MouseEvent.MOUSE_OVER,this.onListMouse);
         this.BaiShiPlayerList.addEventListener(MouseEvent.MOUSE_OUT,this.onListMouse);
         addChild(this.BaiShiPlayerList);
         this.chengHaoImg = new Bitmap(new BitmapData(120,20.8,true,0));
         this.chengHaoImg.width = 120;
         this.chengHaoImg.height = 20.8;
         this.chengHaoImg.x = 20 + 35;
         this.chengHaoImg.y = 4 + 6;
         addChild(this.chengHaoImg);
         this.equipContainer = new Sprite();
         addChild(this.equipContainer);
         this.equipContainer.x = 225 - 214 + 0.5 + 5;
         this.equipContainer.y = 6 + 8 + 0.5 - 5;
         this.tips = new FTextArea();
         with(this.tips)
         {
            x = 85;
            y = 65;
            width = 96;
            height = 40;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            visible = false;
         }
         this.tips.text = "";
         addChild(this.tips);
         t1 = new FLabel();
         with(t1)
         {
            x = 285;
            y = 10;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("姓名");
         }
         addChild(t1);
         t2 = new FLabel();
         with(t2)
         {
            x = 380;
            y = 10;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("等级");
         }
         addChild(t2);
         sortBtn = new FSimpleButton();
         sortBtn.skin = "changeButton";
         sortBtn.name = "level";
         sortBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击可排序") + "</font>";
         sortBtn.rotation = 180;
         addChild(sortBtn);
         sortBtn.x = 410 + sortBtn.width;
         sortBtn.y = 16 + sortBtn.height;
         sortBtn.addEventListener(MouseEvent.CLICK,this.onSort);
         this.tudiShu = new FLabel();
         with(this.tudiShu)
         {
            x = 430;
            y = 10;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("徒弟数");
         }
         addChild(this.tudiShu);
         this.tudushuSortBtn = new FSimpleButton();
         this.tudushuSortBtn.skin = "changeButton";
         this.tudushuSortBtn.name = "discipleTotal";
         this.tudushuSortBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击可排序") + "</font>";
         this.tudushuSortBtn.rotation = 180;
         addChild(this.tudushuSortBtn);
         this.tudushuSortBtn.x = 484 + this.tudushuSortBtn.width;
         this.tudushuSortBtn.y = 16 + this.tudushuSortBtn.height;
         this.tudushuSortBtn.addEventListener(MouseEvent.CLICK,this.onSort);
         t4 = new FLabel();
         with(t4)
         {
            x = 500;
            y = 10;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("门派");
         }
         addChild(t4);
         sortBtn = new FSimpleButton();
         sortBtn.skin = "changeButton";
         sortBtn.name = "setupID";
         sortBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击可排序") + "</font>";
         sortBtn.rotation = 180;
         addChild(sortBtn);
         sortBtn.x = 552 + sortBtn.width;
         sortBtn.y = 16 + sortBtn.height;
         sortBtn.addEventListener(MouseEvent.CLICK,this.onSort);
         this.DiZiShuOrZaiXianTimeTxt = new FTextArea();
         with(this.DiZiShuOrZaiXianTimeTxt)
         {
            x = 20;
            y = 313;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("亲传弟子数");
         }
         addChild(this.DiZiShuOrZaiXianTimeTxt);
         this.DiZiShuOrZaiXianTimeNumTxt = new FTextArea();
         with(this.DiZiShuOrZaiXianTimeNumTxt)
         {
            x = 121;
            y = 262;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "0";
         }
         addChild(this.DiZiShuOrZaiXianTimeNumTxt);
         this.ZhandouliTxt = new FTextArea();
         with(this.ZhandouliTxt)
         {
            x = 20;
            y = 330;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("战斗力");
         }
         addChild(this.ZhandouliTxt);
         this.ZhandouliNumTxt = new FTextArea();
         with(this.ZhandouliNumTxt)
         {
            x = 105;
            y = 330;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = "999";
         }
         addChild(this.ZhandouliNumTxt);
         this.WugongJingjieTxt = new FTextArea();
         with(this.WugongJingjieTxt)
         {
            x = 20;
            y = 347;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("武功境界");
         }
         addChild(this.WugongJingjieTxt);
         this.WugongJingjieNumTxt = new FTextArea();
         with(this.WugongJingjieNumTxt)
         {
            x = 105;
            y = 347;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = "000";
         }
         addChild(this.WugongJingjieNumTxt);
         this.tdzlBtn = new SecondButton();
         this.tdzlBtn.label = LanResManager.getLanCommonTextWords("TA的资料");
         addChild(this.tdzlBtn);
         this.tdzlBtn.x = 150;
         this.tdzlBtn.y = 340;
         this.tdzlBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         t7 = new FTextArea();
         with(t7)
         {
            x = 15;
            y = 285;
            width = 300;
            height = 100;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         t7.htmlText = "<textformat leading=\'5\'>" + LanResManager.getLanTextWords(this,"攻击武功防御经脉暴击肉身闪避成就",[],false) + "</textformat>";
         this.peopleInfo = new FTextArea();
         with(this.peopleInfo)
         {
            x = 67;
            y = 285;
            width = 300;
            height = 100;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.peopleInfo.htmlText = "<textformat leading=\'5\'>" + "0<br>" + "0<br>" + "0<br>" + "0<br>" + "</textformat>";
         this.peopleInfo1 = new FTextArea();
         with(this.peopleInfo1)
         {
            x = 170;
            y = 285;
            width = 300;
            height = 100;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.peopleInfo1.htmlText = "<textformat leading=\'5\'>" + "0/0<br>" + "0/0<br>" + "0/0<br>" + "0/0" + "</textformat>";
         this.checkBox = new FCheckBox();
         addChild(this.checkBox);
         this.checkBox.x = 12;
         this.checkBox.y = 379;
         this.checkBox.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ZiDongTongYiTxt = new FTextArea();
         with(this.ZiDongTongYiTxt)
         {
            x = 30;
            y = 378;
            width = 300;
            height = 100;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         this.ZiDongTongYiTxt.htmlText = LanResManager.getLanCommonTextWords("自动同意玩家的收徒请求");
         addChild(this.ZiDongTongYiTxt);
         this.homePageBtn = new SmallButton();
         this.homePageBtn.label = LanResManager.getLanCommonTextWords("首页");
         addChild(this.homePageBtn);
         this.homePageBtn.x = 318;
         this.homePageBtn.y = 257;
         this.homePageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.preBtn = new FSimpleButton();
         this.preBtn.skin = "previousButton";
         addChild(this.preBtn);
         this.preBtn.x = this.homePageBtn.x + 42;
         this.preBtn.y = this.homePageBtn.y;
         this.preBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.pageCount = new FLabel();
         with(this.pageCount)
         {
            x = preBtn.x + 22;
            y = homePageBtn.y;
            textColor = StaticValue.WHITE;
            background = true;
            backgroundColor = 1186072;
            text = "100/100";
         }
         addChild(this.pageCount);
         this.nextBtn = new FSimpleButton();
         this.nextBtn.skin = "nextButton";
         addChild(this.nextBtn);
         this.nextBtn.x = this.pageCount.x + 48;
         this.nextBtn.y = this.homePageBtn.y;
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.endPageBtn = new SmallButton();
         this.endPageBtn.label = LanResManager.getLanCommonTextWords("尾页");
         addChild(this.endPageBtn);
         this.endPageBtn.x = this.nextBtn.x + 29;
         this.endPageBtn.y = this.homePageBtn.y;
         this.endPageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.shuomingTxt = new FTextArea();
         with(this.shuomingTxt)
         {
            x = 230;
            y = 280;
            width = 320;
            height = 100;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanTextWords(this,"拜师后，徒弟等级每提升级，都可获得经验和声望奖励。徒弟每天可向师父领取强身药剂，临时提升各项属性。您目前可领取的经验值奖励为您目前获得的师徒声望为");
         }
         addChild(this.shuomingTxt);
         this.expTxt = new FTextArea();
         with(this.expTxt)
         {
            x = 375;
            y = 313;
            width = 300;
            height = 20;
            textColor = StaticValue.GREEN;
            htmlText = "【" + 0 + "】";
         }
         addChild(this.expTxt);
         this.swTxt = new FTextArea();
         with(this.swTxt)
         {
            x = 391;
            y = 330;
            width = 300;
            height = 20;
            textColor = StaticValue.GREEN;
            htmlText = "【" + 0 + "】";
         }
         addChild(this.swTxt);
         this.getExpBtn = new SmallButton();
         this.getExpBtn.label = LanResManager.getLanCommonTextWords("领取经验奖励");
         addChild(this.getExpBtn);
         this.getExpBtn.x = 470;
         this.getExpBtn.y = 325;
         this.getExpBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.getShengWangBtn = new SmallButton();
         this.getShengWangBtn.label = LanResManager.getLanCommonTextWords("领取");
         addChild(this.getShengWangBtn);
         this.getShengWangBtn.x = 470;
         this.getShengWangBtn.y = 345;
         this.getShengWangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.swShopBtn = new SmallButton();
         this.swShopBtn.label = LanResManager.getLanCommonTextWords("声望商店");
         addChild(this.swShopBtn);
         this.swShopBtn.x = 505;
         this.swShopBtn.y = 345;
         this.swShopBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ico = new CharAttributeOccultIco();
         addChild(this.ico);
         this.ico.x = 104 + 41;
         this.ico.y = 15 + 7;
         this.BaiShiORShouTuBtn = new SecondButton();
         this.BaiShiORShouTuBtn.label = LanResManager.getLanCommonTextWords("拜师");
         this.BaiShiORShouTuBtn.x = 260;
         this.BaiShiORShouTuBtn.y = 380;
         this.addChild(this.BaiShiORShouTuBtn);
         this.BaiShiORShouTuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.equipList = new EquipList();
         this.equipList.x = 25;
         this.equipList.y = 265;
         this.equipList.setClickSta(false,true);
         addChild(this.equipList);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onSort(param1:MouseEvent = null) : void
      {
         if(param1)
         {
            this.sortText = param1.target.name;
         }
         var _loc2_:Array = this.BaiShiPlayerList.getDataProvider();
         if(this._sortBo)
         {
            _loc2_.sort(this.sortFun1,Array.DESCENDING);
         }
         else if(!this._sortBo)
         {
            _loc2_.sort(this.sortFun2,Array.DESCENDING);
         }
         this.BaiShiPlayerList.dataProvider = _loc2_;
         if(_loc2_.length > 0)
         {
            this.BaiShiPlayerList.setSelectItemByIndex(0);
         }
      }
      
      private function sortFun1(param1:Object, param2:Object) : Number
      {
         if(this.sortText == "")
         {
            return 0;
         }
         this._sortBo = false;
         var _loc3_:Number = Number(param1[this.sortText]);
         var _loc4_:Number = Number(param2[this.sortText]);
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         return 0;
      }
      
      private function sortFun2(param1:Object, param2:Object) : Number
      {
         if(this.sortText == "")
         {
            return 0;
         }
         this._sortBo = true;
         var _loc3_:Number = Number(param1[this.sortText]);
         var _loc4_:Number = Number(param2[this.sortText]);
         if(_loc3_ > _loc4_)
         {
            return -1;
         }
         if(_loc3_ < _loc4_)
         {
            return 1;
         }
         return 0;
      }
      
      private function onList(param1:MouseEvent) : void
      {
         if(!this.BaiShiPlayerList.selectItem)
         {
            return;
         }
         this.clear();
         this.dispatchEvent(new BaseEvent(UI_SHITUPANEL_PARTICULAR_INFO_SHOW,"",{"playerID":int(this.BaiShiPlayerList.selectItem.id)}));
      }
      
      private function onListMouse(param1:MouseEvent) : void
      {
         var _loc2_:FListCellRenderer = null;
         var _loc3_:Object = null;
         var _loc4_:Point = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               Tools.currentStage.addChild(this.tipCanvas);
               this.tipCanvas.visible = false;
               this.BaiShiPlayerList.addEventListener(MouseEvent.MOUSE_MOVE,this.onListMouse);
               break;
            case MouseEvent.MOUSE_MOVE:
               if(param1.target as TextField)
               {
                  _loc2_ = (param1.target as TextField).parent as FListCellRenderer;
                  _loc3_ = _loc2_.data;
                  this.tip.text = _loc3_.name;
                  this.tipCanvas.width = this.tip.width + 4;
                  this.tipCanvas.height = this.tip.height + 4;
                  this.tipCanvas.visible = true;
                  _loc4_ = _loc2_.parent.localToGlobal(new Point(_loc2_.x,_loc2_.y));
                  this.tipCanvas.x = _loc4_.x - this.tipCanvas.width;
                  this.tipCanvas.y = _loc4_.y;
               }
               else
               {
                  this.tipCanvas.visible = false;
               }
               break;
            case MouseEvent.MOUSE_OUT:
               this.BaiShiPlayerList.removeEventListener(MouseEvent.MOUSE_MOVE,this.onListMouse);
               Tools.currentStage.removeChild(this.tipCanvas);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.homePageBtn:
               dispatchEvent(new BaseEvent(UI_SHITUPANEL_LIST_GET_PAGE,"",{
                  "panelType":this.PanelType,
                  "type":1
               }));
               break;
            case this.preBtn:
               dispatchEvent(new BaseEvent(UI_SHITUPANEL_LIST_GET_PAGE,"",{
                  "panelType":this.PanelType,
                  "type":2
               }));
               break;
            case this.nextBtn:
               dispatchEvent(new BaseEvent(UI_SHITUPANEL_LIST_GET_PAGE,"",{
                  "panelType":this.PanelType,
                  "type":3
               }));
               break;
            case this.endPageBtn:
               dispatchEvent(new BaseEvent(UI_SHITUPANEL_LIST_GET_PAGE,"",{
                  "panelType":this.PanelType,
                  "type":4
               }));
               break;
            case this.checkBox:
               dispatchEvent(new BaseEvent(UI_SHITUPANEL_ZIDONGTONGYIBAISHIORSHOUTU,"",{
                  "panelType":this.PanelType,
                  "b":this.checkBox.selectState
               }));
               break;
            case this.getExpBtn:
               dispatchEvent(new BaseEvent(UI_SHITUPANEL_GETEXP_BTN_CLICK,"",{"panelType":this.PanelType}));
               break;
            case this.getShengWangBtn:
               dispatchEvent(new BaseEvent(UI_SHITUPANEL_GETSHENGWANG_BTN_CLICK,"",{"panelType":this.PanelType}));
               break;
            case this.swShopBtn:
               dispatchEvent(new BaseEvent(UI_SHITUPANEL_SHENGWANGSHANGDIANGOUWU_BTN_CLICK,"",null));
               break;
            case this.BaiShiORShouTuBtn:
               if(this.BaiShiPlayerList.selectItem == null)
               {
                  return;
               }
               dispatchEvent(new BaseEvent(UI_SHITUPANEL_BAISHIORSHOUTU_BTN_CLICK,"",{
                  "panelType":this.PanelType,
                  "playerID":int(this.BaiShiPlayerList.selectItem.id)
               }));
               break;
            case this.tdzlBtn:
               dispatchEvent(new BaseEvent(UI_XIANGXIZILIAO_CLICK,"",{"playerID":int(this.BaiShiPlayerList.selectItem.id)}));
         }
      }
      
      public function setTitle(param1:int) : void
      {
         this.PanelType = param1;
         if(param1 == 1)
         {
            this.DiZiShuOrZaiXianTimeTxt.text = LanResManager.getLanCommonTextWords("亲传弟子数");
            this.shuomingTxt.htmlText = "<textformat leading=\'2\'>" + LanResManager.getLanTextWords(this,"拜师后，徒弟等级每提升级，都可获得经验和声望奖励。徒弟每天可向师父领取强身药剂，临时提升各项属性。您目前可领取的经验值奖励为您目前获得的师徒声望为",[],false) + "</textformat>";
            this.ZiDongTongYiTxt.htmlText = LanResManager.getLanCommonTextWords("自动同意玩家的收徒请求");
            this.BaiShiORShouTuBtn.label = LanResManager.getLanCommonTextWords("拜师");
            this.tudiShu.text = LanResManager.getLanCommonTextWords("徒弟数");
            titleText = LanResManager.getLanCommonTextWords("我要拜师");
            BaiShiPlayerListRender._panelType = 1;
            this.tudushuSortBtn.name = "discipleTotal";
         }
         else if(param1 == 2)
         {
            this.DiZiShuOrZaiXianTimeTxt.text = LanResManager.getLanCommonTextWords("上周在线时间");
            this.shuomingTxt.htmlText = "<textformat leading=\'2\'>" + LanResManager.getLanTextWords(this,"徒弟升级、出师、出师后每升级，师父都可获经验和声望奖励。师父每天可向徒弟发放强身药剂，增加自己声望。您目前可领取的经验值奖励为您目前获得的师徒声望为",[],false) + "</textformat>";
            this.ZiDongTongYiTxt.htmlText = LanResManager.getLanCommonTextWords("自动同意玩家的拜师请求");
            this.BaiShiORShouTuBtn.label = LanResManager.getLanCommonTextWords("收徒");
            this.tudiShu.text = LanResManager.getLanCommonTextWords("活跃度");
            titleText = LanResManager.getLanCommonTextWords("我要收徒");
            BaiShiPlayerListRender._panelType = 2;
            this.tudushuSortBtn.name = "huoyue";
         }
      }
      
      public function setShowItem(param1:Array, param2:int = 0) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Goods = null;
         var _loc6_:ItemFace = null;
         var _loc7_:Boolean = false;
         while(this.equipContainer.numChildren > 0)
         {
            this.equipContainer.removeChildAt(0);
         }
         this.equipList.initEquipList();
         if(param1)
         {
            _loc4_ = int(param1.length);
            _loc3_ = 0;
            while(_loc3_ < _loc4_)
            {
               _loc5_ = param1[_loc3_] as Goods;
               if(!(_loc5_.res.position == ItemPositionRange.POSTION_BOW || _loc5_.res.position == ItemPositionRange.POSTION_ZHENHUN))
               {
                  _loc6_ = new ItemFace(_loc5_);
                  _loc7_ = true;
                  switch(_loc5_.res.position)
                  {
                     case ItemPositionRange.POSTION_WUQI:
                        _loc6_.x = 0;
                        _loc6_.y = 0;
                        break;
                     case ItemPositionRange.POSTION_QIBING:
                        _loc6_.x = 0;
                        _loc6_.y = 41;
                        break;
                     case ItemPositionRange.POSTION_YIFU:
                        _loc6_.x = 0;
                        _loc6_.y = 82;
                        break;
                     case ItemPositionRange.POSTION_HUSHOU:
                        _loc6_.x = 0;
                        _loc6_.y = 123;
                        break;
                     case ItemPositionRange.POSTION_HUYAO:
                        _loc6_.x = 0;
                        _loc6_.y = 164;
                        break;
                     case ItemPositionRange.POSTION_HUXUE:
                        _loc6_.x = 0;
                        _loc6_.y = 205;
                        break;
                     case ItemPositionRange.POSTION_TOUSHI:
                        _loc6_.x = 168;
                        _loc6_.y = 0;
                        break;
                     case ItemPositionRange.POSTION_XIANGLIAN:
                        _loc6_.x = 168;
                        _loc6_.y = 41;
                        break;
                     case ItemPositionRange.POSTION_JIEZHI:
                        _loc6_.x = 168;
                        _loc6_.y = 82;
                        break;
                     case ItemPositionRange.POSTION_SHOUZHUO:
                        _loc6_.x = 168;
                        _loc6_.y = 123;
                        break;
                     case ItemPositionRange.POSTION_YAOZHUI:
                        _loc6_.x = 168;
                        _loc6_.y = 164;
                        break;
                     case ItemPositionRange.POSTION_PIFENG:
                        _loc6_.x = 168;
                        _loc6_.y = 205;
                        break;
                     case ItemPositionRange.POSTION_WULINGONGDIXUNZHANG:
                        _loc6_.x = 121;
                        _loc6_.y = 168;
                        break;
                     case ItemPositionRange.POSTION_TESHU:
                        _loc6_.x = 84;
                        _loc6_.y = 205;
                        break;
                     case ItemPositionRange.POSTION_HUIZHANG:
                     case ItemPositionRange.POSTION_JINIANXUNZHANG:
                     case ItemPositionRange.POSTION_KUAPINGTAI_BIWU_XUNZHANG:
                     case ItemPositionRange.POSTION_ZHUANGBEIWEIZHI1:
                     case ItemPositionRange.POSTION_ZHUANGBEIWEIZHI2:
                     case ItemPositionRange.POSTION_FUZHIPIN:
                     case ItemPositionRange.POSTION_ZHANJIA:
                     case ItemPositionRange.POSTION_CIQING:
                     case ItemPositionRange.POSTION_DWJSHUIZHANG:
                     case ItemPositionRange.POSTION_PEIJIAN:
                     case ItemPositionRange.POSTION_BOSS_HUIZHANG:
                     case ItemPositionRange.POSTION_HUIZHANG2:
                     case ItemPositionRange.POSTION_HUIZHANG3:
                     case ItemPositionRange.POSTION_HUIZHANG4:
                     case ItemPositionRange.POSTION_HUIZHANG5:
                     case ItemPositionRange.POSTION_HUIZHANG6:
                     case ItemPositionRange.POSTION_HUIZHANG7:
                     case ItemPositionRange.POSTION_HUIZHANG8:
                     case ItemPositionRange.POSTION_HUIZHANG9:
                     case ItemPositionRange.POSTION_HUIZHANG10:
                     case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI1:
                     case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI2:
                     case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI3:
                     case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI4:
                     case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI5:
                     case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI6:
                     case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI7:
                     case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI8:
                     case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI9:
                     case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI10:
                     case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI11:
                     case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI12:
                     case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI13:
                     case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI14:
                     case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI15:
                     case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI16:
                     case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI17:
                     case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI18:
                     case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI19:
                     case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI20:
                        this.equipList.addEuqip(_loc5_);
                        _loc7_ = false;
                        break;
                     default:
                        _loc7_ = false;
                  }
                  if(_loc5_.res.position >= ItemPositionRange.POSTION_XUNZHANG_2018_ARR.x && _loc5_.res.position <= ItemPositionRange.POSTION_XUNZHANG_2018_ARR.y || _loc5_.res.position >= ItemPositionRange.POSTION_HUODONG_ARR.x && _loc5_.res.position <= ItemPositionRange.POSTION_HUODONG_ARR.y || _loc5_.res.position >= ItemPositionRange.POSTION_HUODONG_ARR1.x && _loc5_.res.position <= ItemPositionRange.POSTION_HUODONG_ARR1.y)
                  {
                     this.equipList.addEuqip(_loc5_);
                     _loc7_ = false;
                  }
                  if(_loc5_.id == param2)
                  {
                     _loc6_.x = 84 - 37;
                     _loc6_.y = 205;
                     _loc7_ = true;
                  }
                  if(_loc7_)
                  {
                     _loc6_.showRedMask();
                     _loc6_.showStrengthenLv = true;
                     _loc6_.name = String(_loc5_.res.position);
                     this.equipContainer.addChild(_loc6_);
                  }
               }
               _loc3_++;
            }
            this.equipList.setEquipItem();
         }
      }
      
      public function setYupei(param1:Goods) : void
      {
         if(Boolean(this.yupei) && Boolean(this.yupei.parent))
         {
            this.yupei.parent.removeChild(this.yupei);
         }
         if(!param1)
         {
            return;
         }
         this.yupei = new ItemFace(param1);
         addChildAt(this.yupei,getChildIndex(this.equipContainer) + 1);
         this.yupei.x = 138;
         this.yupei.y = 214;
      }
      
      public function setFlag(param1:int) : void
      {
         var onCom:Function = null;
         var value:int = param1;
         onCom = function():void
         {
            if(Boolean(flag) && Boolean(flag.parent))
            {
               flag.parent.removeChild(flag);
               flag.stop();
            }
            if(value != 0)
            {
               flag = StaticValue.getMCByClassName(StaticValue.conversionFlagID(value)) as MovieClip;
               this.equipContainer.addChildAt(flag,1);
               flag.x = 295 - flag.width / 2;
               flag.y = 10;
            }
         };
         RslLoaderManager.lazyLoad(onCom,null,GameConfig.fileBaseFolder + "res/data/mc/flag/lv1flag.swf",GameConfig.fileBaseFolder + "res/data/mc/flag/lv2flag.swf",GameConfig.fileBaseFolder + "res/data/mc/flag/lv3flag.swf");
      }
      
      public function setAavatar(param1:BitmapData) : void
      {
         this._avatar.bitmapData = param1;
         if(!param1)
         {
            this.tips.visible = true;
            if(this.chengHaoImg)
            {
               this.chengHaoImg.visible = false;
            }
            return;
         }
         this.tips.visible = false;
         if(this.chengHaoImg)
         {
            this.chengHaoImg.visible = true;
         }
         this._avatar.x = 326 - this._avatar.width / 2 - 210;
         this._avatar.y = 190 - this._avatar.height + 20;
      }
      
      public function setItem(param1:Array, param2:int, param3:int, param4:int, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number, param11:Number, param12:int, param13:int, param14:int, param15:int, param16:int, param17:int, param18:int = 0) : void
      {
         this.setShowItem(param1,param18);
         if(param3 == 1)
         {
            this.DiZiShuOrZaiXianTimeNumTxt.text = String(param4);
         }
         else
         {
            this.DiZiShuOrZaiXianTimeNumTxt.htmlText = int(param5 / 60 / 60) + LanResManager.getLanCommonTextWords("小时") + int(param5 / 60 % 60) + LanResManager.getLanCommonTextWords("分");
         }
         this.peopleInfo.htmlText = "<textformat leading=\'5\'>" + param6 + "<br>" + param7 + "<br>" + param8 + "<br>" + param9 + "</textformat>";
         this.peopleInfo1.htmlText = "<textformat leading=\'5\'>" + param10 + "/" + param11 + "<br>" + param12 + "/" + param13 + "<br>" + "(" + param14 + "J)" + param15 + "/100" + "<br>" + param16 + "/" + param17 + "</textformat>";
      }
      
      public function setList(param1:XML, param2:int, param3:int, param4:Boolean = false, param5:Boolean = false) : void
      {
         this.clear();
         this.BaiShiPlayerList.dataProvider = param1;
         if(param1.children().length() > 0)
         {
            this.BaiShiPlayerList.setSelectItemByIndex(0);
            this.dispatchEvent(new BaseEvent(UI_SHITUPANEL_PARTICULAR_INFO_SHOW,"",{"playerID":int(this.BaiShiPlayerList.selectItem.id)}));
         }
         this.pageCount.text = param2 + "/" + param3;
         this.homePageBtn.enabled = this.preBtn.enabled = !param4;
         this.endPageBtn.enabled = this.nextBtn.enabled = !param5;
         if(this.BaiShiPlayerList.selectItem == null)
         {
            this.tdzlBtn.enabled = false;
         }
         else
         {
            this.tdzlBtn.enabled = true;
         }
      }
      
      public function setICOState(param1:Boolean, param2:int, param3:Boolean, param4:int, param5:Boolean, param6:int, param7:Boolean, param8:int, param9:Boolean, param10:int, param11:Boolean, param12:int, param13:Boolean, param14:int, param15:Boolean, param16:int) : void
      {
         this.ico.setState(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14,param15,param16);
      }
      
      public function setSiShengShouState(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.ico.setSiShengShouState(param1,param2,param3,param4);
      }
      
      public function setICOXiantian(param1:Boolean, param2:int, param3:int, param4:int) : void
      {
         this.ico.setXiantian(param1,param2,param3,param4);
      }
      
      public function setICOHuXinYao(param1:Boolean) : void
      {
         this.ico.setHuXinYao(param1);
      }
      
      public function setICONiXi(param1:Boolean) : void
      {
         this.ico.setNiXi(param1);
      }
      
      public function setICOFengHuang(param1:Boolean) : void
      {
         this.ico.setFengHuang(param1);
      }
      
      public function setICORouti(param1:Boolean) : void
      {
         this.ico.setRouti(param1);
      }
      
      public function setICOWuhun(param1:int, param2:Boolean, param3:Boolean, param4:int, param5:Boolean, param6:int, param7:Boolean, param8:Boolean, param9:int) : void
      {
         this.ico.setWuhun(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function setGetExp(param1:Number) : void
      {
         this.expTxt.htmlText = "【" + param1 + "】";
      }
      
      public function setGetShengWang(param1:int) : void
      {
         this.swTxt.htmlText = "【" + param1 + "】";
      }
      
      public function clear() : void
      {
         this.setAavatar(null);
         this.setYupei(null);
         this.ico.setState(false,0,false,0,false,0,false,0,false,0,false,0,false,0,false,0);
         this.ico.setSiShengShouState(0,0,0,0);
         this.ico.setXiantian(false,0,0,-1);
         this.ico.setRouti(false);
         this.ico.setWuhun(0,false,false,0,false,0,false,false,0);
         this.setFlag(0);
         this.setShowItem(null);
         this.peopleInfo.htmlText = "<textformat leading=\'5\'>" + "0<br>" + "0<br>" + "0<br>" + "0<br>";
         this.peopleInfo1.htmlText = "<textformat leading=\'5\'>" + "0/0<br>" + "0/0<br>" + "0/0<br>" + "0/0";
      }
      
      public function setAvaterXY(param1:Boolean, param2:int = 0, param3:int = 0) : void
      {
         if(param1)
         {
            this._avatar.x = 326 - this._avatar.width / 2 - 210;
            this._avatar.y = 190 - this._avatar.height - 15;
         }
         else
         {
            this._avatar.x = param2;
            this._avatar.y = param3;
         }
      }
      
      public function setZhandouliNum(param1:Number) : void
      {
         this.ZhandouliNumTxt.text = String(param1);
      }
      
      public function setWugongJinjie(param1:Number) : void
      {
         this.WugongJingjieNumTxt.text = String(param1);
      }
      
      public function setZhuangbeiKaiqi() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < OtherConst.zhuangbei_dakong)
         {
            this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
            this.equipContainer.addChildAt(this.img,0);
            if(OtherConst.zhuangbei_dakong == 3)
            {
               this.img.x = 42 + 42 * _loc1_;
            }
            else
            {
               this.img.x = 42 * _loc1_;
            }
            this.img.y = 254;
            _loc1_++;
         }
      }
   }
}

