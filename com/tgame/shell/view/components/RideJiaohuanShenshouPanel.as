package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.ridejiaohuanshengshou.jiaoHuanShengShouRideListRender;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class RideJiaohuanShenshouPanel extends FPanel
   {
      
      public static const RIDE_JIAOHUANSHENGSHOU_PANEL_JIAOHUANBTN:String = "RIDE_JIAOHUANSHENGSHOU_PANEL_JIAOHUANBTN";
      
      public static const RIDE_JIAOHUANSHENGSHOU_PANEL_JIAOHUANBTN_1:String = "RIDE_JIAOHUANSHENGSHOU_PANEL_JIAOHUANBTN_1";
      
      public static const RIDE_JIAOHUANSHENGSHOU_PANEL_JIAOHUANBTN_2:String = "RIDE_JIAOHUANSHENGSHOU_PANEL_JIAOHUANBTN_2";
      
      public static var SEND_RIDE_ID:String = "SEND_RIDE_ID";
      
      public static var RIDE_JIAOHUANSHENGSHOU_PANEL_UPLEVELBTN:String = "RIDE_JIAOHUANSHENGSHOU_PANEL_UPLEVELBTN";
      
      public static const PANEL_TYPE_ID_DICT:Object = {
         "shengshouJiaohuan":1,
         "moshouJiaohuan":2
      };
      
      public var panelID:int = 0;
      
      private var text1:FTextArea;
      
      private var NameBtn1:SecondButton;
      
      private var NameBtn2:SecondButton;
      
      private var NameBtn3:SecondButton;
      
      private var NameBtn4:SecondButton;
      
      private var DuiHuanBtn1:SmallButton;
      
      private var DuiHuanBtn2:SmallButton;
      
      private var DuiHuanBtn3:SmallButton;
      
      private var DuiHuanBtn4:SmallButton;
      
      private var upLevelBtn:SecondButton;
      
      private var _container1:Sprite;
      
      private var _container2:Sprite;
      
      public var rideList:FList;
      
      private var imgIco1:DisplayObject;
      
      private var skillContainer1:Sprite;
      
      private var strIcoMath:String;
      
      private var nameTxt:FTextArea;
      
      private var scroll:FVScorllBar;
      
      private var rideListSelectLabel:String = "-1";
      
      private var GoodsCount:int = 0;
      
      private var tempItem:ItemFace;
      
      private var lastName:String = "";
      
      public function RideJiaohuanShenshouPanel()
      {
         var img:Bitmap;
         var v:Vector.<Bitmap>;
         var tf:TextFormat;
         var line:Bitmap;
         this._container1 = new Sprite();
         this._container2 = new Sprite();
         super();
         this.width = 397;
         this.height = 277;
         this.dragAble = true;
         this.showCloseButton = true;
         this.titleText = LanResManager.getLanCommonTextWords("坐骑驯养");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = new Bitmap();
         img.name = "ui.ride.zuoqiDuihuan.ui";
         addChild(img);
         img.x = 10;
         img.y = 2;
         v = new Vector.<Bitmap>();
         v.push(img);
         this.DynamicManageImages = v;
         this.text1 = new FTextArea();
         with(this.text1)
         {
            width = 120;
            height = 150;
            x = 13;
            y = 120;
            filters = StaticValue.filter;
            textColor = StaticValue.ORANGE;
            wordWrap = true;
            htmlText = "";
         }
         addChild(this.text1);
         tf = new TextFormat();
         tf.bold = true;
         tf.size = 13;
         this.nameTxt = new FTextArea();
         with(this.nameTxt)
         {
            autoSize = TextFieldAutoSize.LEFT;
            x = 148;
            y = 5;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            textColor = StaticValue.ORANGE;
            htmlText = "<textformat leading=\'0.1\'>" + LanResManager.getLanCommonTextWords("青龙(圣兽)") + "</textformat>";
         }
         this.addChild(this.nameTxt);
         this.NameBtn1 = new SecondButton();
         this.NameBtn1.label = LanResManager.getLanCommonTextWords("青龙");
         this.NameBtn1.x = 10;
         this.NameBtn1.y = 6;
         this._container1.addChild(this.NameBtn1);
         this.NameBtn1.addEventListener(MouseEvent.CLICK,this.onChick);
         this.NameBtn2 = new SecondButton();
         this.NameBtn2.label = LanResManager.getLanCommonTextWords("白虎");
         this.NameBtn2.x = 72;
         this.NameBtn2.y = 6;
         this._container1.addChild(this.NameBtn2);
         this.NameBtn2.addEventListener(MouseEvent.CLICK,this.onChick);
         this.NameBtn3 = new SecondButton();
         this.NameBtn3.label = LanResManager.getLanCommonTextWords("朱雀");
         this.NameBtn3.x = 130;
         this.NameBtn3.y = 6;
         this._container1.addChild(this.NameBtn3);
         this.NameBtn3.addEventListener(MouseEvent.CLICK,this.onChick);
         this.NameBtn4 = new SecondButton();
         this.NameBtn4.label = LanResManager.getLanCommonTextWords("玄武");
         this.NameBtn4.x = 193;
         this.NameBtn4.y = 6;
         this._container1.addChild(this.NameBtn4);
         this.NameBtn4.addEventListener(MouseEvent.CLICK,this.onChick);
         this.DuiHuanBtn1 = new SmallButton();
         this.DuiHuanBtn1.label = LanResManager.getLanCommonTextWords("兑换青龙");
         this.DuiHuanBtn1.x = 12;
         this.DuiHuanBtn1.y = 75;
         this._container1.addChild(this.DuiHuanBtn1);
         this.DuiHuanBtn1.addEventListener(MouseEvent.CLICK,this.onChick);
         this.DuiHuanBtn2 = new SmallButton();
         this.DuiHuanBtn2.label = LanResManager.getLanCommonTextWords("兑换白虎");
         this.DuiHuanBtn2.x = 74;
         this.DuiHuanBtn2.y = 75;
         this._container1.addChild(this.DuiHuanBtn2);
         this.DuiHuanBtn2.addEventListener(MouseEvent.CLICK,this.onChick);
         this.DuiHuanBtn3 = new SmallButton();
         this.DuiHuanBtn3.label = LanResManager.getLanCommonTextWords("兑换朱雀");
         this.DuiHuanBtn3.x = 135;
         this.DuiHuanBtn3.y = 75;
         this._container1.addChild(this.DuiHuanBtn3);
         this.DuiHuanBtn3.addEventListener(MouseEvent.CLICK,this.onChick);
         this.DuiHuanBtn4 = new SmallButton();
         this.DuiHuanBtn4.label = LanResManager.getLanCommonTextWords("兑换玄武");
         this.DuiHuanBtn4.x = 196;
         this.DuiHuanBtn4.y = 75;
         this._container1.addChild(this.DuiHuanBtn4);
         this.DuiHuanBtn4.addEventListener(MouseEvent.CLICK,this.onChick);
         this.rideList = new FList();
         this.rideList.skin = "list";
         this.rideList.itemRenderer = new jiaoHuanShengShouRideListRender();
         this.rideList.listWidth = 105;
         this.rideList.listHeight = 127;
         addChild(this.rideList);
         this.rideList.x = 11;
         this.rideList.y = 4;
         this.rideList.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.scroll = new FVScorllBar(this.rideList,110);
         addChild(this.scroll);
         this.scroll.x = 117;
         this.scroll.y = 3;
         this.skillContainer1 = new Sprite();
         this.skillContainer1.x = 15;
         this.skillContainer1.y = 33;
         this._container1.addChild(this.skillContainer1);
         this._container1.x = 142;
         this._container1.y = 129;
         this.addChild(this._container1);
         line = StaticValue.getBitmapByClassName("ui.tiem.slot");
         line.x = 45;
         line.y = 33;
         this._container2.addChild(line);
         this.upLevelBtn = new SecondButton();
         this.upLevelBtn.x = 110;
         this.upLevelBtn.y = 41;
         this.upLevelBtn.label = LanResManager.getLanCommonTextWords("升级");
         this.upLevelBtn.addEventListener(MouseEvent.CLICK,this.onChick);
         this._container2.addChild(this.upLevelBtn);
         this._container2.x = 142;
         this._container2.y = 129;
         this.addChild(this._container2);
         this._container2.visible = false;
         this.setAvater(1,LanResManager.getLanCommonTextWords("青龙(圣兽)"));
      }
      
      private function onChick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.NameBtn1:
               if(this.panelID == PANEL_TYPE_ID_DICT.shengshouJiaohuan)
               {
                  this.setAvater(1,LanResManager.getLanCommonTextWords("青龙(圣兽)"));
               }
               else if(this.panelID == PANEL_TYPE_ID_DICT.moshouJiaohuan)
               {
                  this.setAvater(1,LanResManager.getLanCommonTextWords("青龙(魔兽)"));
               }
               else
               {
                  this.setAvater(1,LanResManager.getLanCommonTextWords("青龙(圣兽)"));
               }
               break;
            case this.NameBtn2:
               if(this.panelID == PANEL_TYPE_ID_DICT.shengshouJiaohuan)
               {
                  this.setAvater(2,LanResManager.getLanCommonTextWords("白虎(圣兽)"));
               }
               else if(this.panelID == PANEL_TYPE_ID_DICT.moshouJiaohuan)
               {
                  this.setAvater(2,LanResManager.getLanCommonTextWords("白虎(魔兽)"));
               }
               else
               {
                  this.setAvater(2,LanResManager.getLanCommonTextWords("白虎(圣兽)"));
               }
               break;
            case this.NameBtn3:
               if(this.panelID == PANEL_TYPE_ID_DICT.shengshouJiaohuan)
               {
                  this.setAvater(3,LanResManager.getLanCommonTextWords("朱雀(圣兽)"));
               }
               else if(this.panelID == PANEL_TYPE_ID_DICT.moshouJiaohuan)
               {
                  this.setAvater(3,LanResManager.getLanCommonTextWords("朱雀(魔兽)"));
               }
               else
               {
                  this.setAvater(3,LanResManager.getLanCommonTextWords("朱雀(圣兽)"));
               }
               break;
            case this.NameBtn4:
               if(this.panelID == PANEL_TYPE_ID_DICT.shengshouJiaohuan)
               {
                  this.setAvater(4,LanResManager.getLanCommonTextWords("玄武(圣兽)"));
               }
               else if(this.panelID == PANEL_TYPE_ID_DICT.moshouJiaohuan)
               {
                  this.setAvater(4,LanResManager.getLanCommonTextWords("玄武(魔兽)"));
               }
               else
               {
                  this.setAvater(4,LanResManager.getLanCommonTextWords("玄武(圣兽)"));
               }
               break;
            case this.DuiHuanBtn1:
               if(this.panelID == PANEL_TYPE_ID_DICT.shengshouJiaohuan)
               {
                  this.dispatchEvent(new BaseEvent(RIDE_JIAOHUANSHENGSHOU_PANEL_JIAOHUANBTN_1,"",[this.rideListSelectLabel,1]));
               }
               else if(this.panelID == PANEL_TYPE_ID_DICT.moshouJiaohuan)
               {
                  this.dispatchEvent(new BaseEvent(RIDE_JIAOHUANSHENGSHOU_PANEL_JIAOHUANBTN_2,"",[this.rideListSelectLabel,1]));
               }
               else
               {
                  this.dispatchEvent(new BaseEvent(RIDE_JIAOHUANSHENGSHOU_PANEL_JIAOHUANBTN,"",[this.rideListSelectLabel,1]));
               }
               break;
            case this.DuiHuanBtn2:
               if(this.panelID == PANEL_TYPE_ID_DICT.shengshouJiaohuan)
               {
                  this.dispatchEvent(new BaseEvent(RIDE_JIAOHUANSHENGSHOU_PANEL_JIAOHUANBTN_1,"",[this.rideListSelectLabel,2]));
               }
               else if(this.panelID == PANEL_TYPE_ID_DICT.moshouJiaohuan)
               {
                  this.dispatchEvent(new BaseEvent(RIDE_JIAOHUANSHENGSHOU_PANEL_JIAOHUANBTN_2,"",[this.rideListSelectLabel,2]));
               }
               else
               {
                  this.dispatchEvent(new BaseEvent(RIDE_JIAOHUANSHENGSHOU_PANEL_JIAOHUANBTN,"",[this.rideListSelectLabel,2]));
               }
               break;
            case this.DuiHuanBtn3:
               if(this.panelID == PANEL_TYPE_ID_DICT.shengshouJiaohuan)
               {
                  this.dispatchEvent(new BaseEvent(RIDE_JIAOHUANSHENGSHOU_PANEL_JIAOHUANBTN_1,"",[this.rideListSelectLabel,3]));
               }
               else if(this.panelID == PANEL_TYPE_ID_DICT.moshouJiaohuan)
               {
                  this.dispatchEvent(new BaseEvent(RIDE_JIAOHUANSHENGSHOU_PANEL_JIAOHUANBTN_2,"",[this.rideListSelectLabel,3]));
               }
               else
               {
                  this.dispatchEvent(new BaseEvent(RIDE_JIAOHUANSHENGSHOU_PANEL_JIAOHUANBTN,"",[this.rideListSelectLabel,3]));
               }
               break;
            case this.DuiHuanBtn4:
               if(this.panelID == PANEL_TYPE_ID_DICT.shengshouJiaohuan)
               {
                  this.dispatchEvent(new BaseEvent(RIDE_JIAOHUANSHENGSHOU_PANEL_JIAOHUANBTN_1,"",[this.rideListSelectLabel,4]));
               }
               else if(this.panelID == PANEL_TYPE_ID_DICT.moshouJiaohuan)
               {
                  this.dispatchEvent(new BaseEvent(RIDE_JIAOHUANSHENGSHOU_PANEL_JIAOHUANBTN_2,"",[this.rideListSelectLabel,4]));
               }
               else
               {
                  this.dispatchEvent(new BaseEvent(RIDE_JIAOHUANSHENGSHOU_PANEL_JIAOHUANBTN,"",[this.rideListSelectLabel,4]));
               }
               break;
            case this.upLevelBtn:
               this.dispatchEvent(new BaseEvent(RIDE_JIAOHUANSHENGSHOU_PANEL_UPLEVELBTN,"",this.rideListSelectLabel));
         }
      }
      
      private function onListClick(param1:MouseEvent = null) : void
      {
         if(this.rideList.selectItem == null)
         {
            return;
         }
         if(this.rideList.selectItem.label != "" && this.rideList.selectItem.label != null)
         {
            this.rideListSelectLabel = this.rideList.selectItem.label;
            this.dispatchEvent(new BaseEvent(SEND_RIDE_ID,"",this.rideListSelectLabel));
         }
      }
      
      public function onClose(param1:Event) : void
      {
         this.parent.removeChild(this);
      }
      
      public function setAvater(param1:int, param2:String) : void
      {
         if(param1 == 0 || this.lastName == param2)
         {
            return;
         }
         var _loc3_:String = this.lastName = param2;
         switch(param1)
         {
            case 1:
               this.nameTxt.htmlText = "<textformat leading=\'0.1\'>" + _loc3_ + "</textformat>";
               break;
            case 2:
               this.nameTxt.htmlText = "<textformat leading=\'0.1\'>" + _loc3_ + "</textformat>";
               break;
            case 3:
               this.nameTxt.htmlText = "<textformat leading=\'0.1\'>" + _loc3_ + "</textformat>";
               break;
            case 4:
               this.nameTxt.htmlText = "<textformat leading=\'0.1\'>" + _loc3_ + "</textformat>";
         }
         if(this.imgIco1 != null && this.imgIco1.parent != null)
         {
            this.imgIco1.parent.removeChild(this.imgIco1);
         }
         this.strIcoMath = GameConfig.fileBaseFolder + "res/ui/sishenshou/" + param1.toString() + ".png";
         this.imgIco1 = FLoader.startLoad(this.strIcoMath,206,130);
         this.imgIco1.x = 160;
         this.imgIco1.y = 0;
         addChildAt(this.imgIco1,1);
      }
      
      public function setShowPanel(param1:int, param2:int, param3:int, param4:String = "1", param5:String = "2") : void
      {
         var _loc6_:String = null;
         if(param1 == 1)
         {
            _loc6_ = LanResManager.getLanCommonTextWords("青龙(圣兽)");
            this.nameTxt.htmlText = "<textformat leading=\'0.1\'>" + _loc6_ + "</textformat>";
            this.strIcoMath = "";
            this._container1.visible = true;
            this._container2.visible = false;
         }
         else
         {
            this._container1.visible = false;
            this._container2.visible = true;
         }
         if(param5 == "")
         {
            this.text1.htmlText = "<textformat leading=\'0.1\'>" + LanResManager.getLanCommonTextWords("该坐骑已经满级，不能再升级！") + "</textformat>";
            this.upLevelBtn.enabled = false;
         }
         else
         {
            if(param1 == 1)
            {
               this.text1.htmlText = "<textformat leading=\'0.1\'>" + LanResManager.getLanTextWords(this,"选择坐骑框内的，该坐骑的总梦幻度达到%，",[param4,param2,param3,param5]) + "</textformat>";
            }
            else
            {
               this.text1.htmlText = "<textformat leading=\'0.1\'>" + LanResManager.getLanTextWords(this,"选择坐骑框内的，该坐骑的等级达到120级，并且总梦幻度达到%，",[param4,param2,param3,param5]) + "</textformat>";
            }
            this.upLevelBtn.enabled = true;
         }
         if(this.tempItem != null && this.tempItem.parent != null)
         {
            if(this.GoodsCount < param3)
            {
               this.tempItem.filters = Tools.blackWhiteFilter;
               this.upLevelBtn.enabled = false;
            }
            else
            {
               this.tempItem.filters = [];
               this.upLevelBtn.enabled = true;
            }
         }
      }
      
      public function setMoshouHuhuan() : void
      {
         this.text1.htmlText = LanResManager.getLanCommonTextWords("选择上方坐骑框内的魔兽, 通过丹药,可以变形为新的魔兽");
         this.titleText = LanResManager.getLanCommonTextWords("魔兽互换");
         this._container1.visible = true;
         this._container2.visible = false;
         this.setAvater(1,LanResManager.getLanCommonTextWords("青龙(魔兽)"));
      }
      
      public function setInit(param1:Array, param2:Array) : void
      {
         var _loc4_:int = 0;
         var _loc5_:ItemFace = null;
         var _loc6_:Bitmap = null;
         var _loc3_:Array = new Array(0,61,121,182);
         _loc4_ = 0;
         while(_loc4_ < 4)
         {
            if(param1[_loc4_] != null)
            {
               _loc5_ = new ItemFace(param1[_loc4_]);
               _loc6_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.skillContainer1.addChild(_loc6_);
               _loc6_.x = _loc3_[_loc4_];
               this.skillContainer1.addChild(_loc5_);
               _loc5_.x = _loc3_[_loc4_] + 2;
               _loc5_.y = 2;
            }
            this["DuiHuanBtn" + (_loc4_ + 1)].enabled = param2[_loc4_];
            _loc4_++;
         }
      }
      
      public function setUpLevelGoods(param1:Goods) : void
      {
         if(this.tempItem != null && this.tempItem.parent != null)
         {
            this.tempItem.parent.removeChild(this.tempItem);
         }
         this.tempItem = new ItemFace(param1);
         this.tempItem.x = 45 + 2;
         this.tempItem.y = 33 + 2;
         this._container2.addChild(this.tempItem);
         this.GoodsCount = param1.count;
      }
      
      public function setRideList(param1:XML, param2:int) : void
      {
         this.rideList.dataProvider = param1;
         this.scroll.update();
         if(this.rideList.dataProvider.length > 0)
         {
            this.rideList.setSelectItemByIndex(param2);
            this.rideListSelectLabel = this.rideList.selectItem.label;
         }
         else
         {
            this.rideListSelectLabel = "-1";
         }
      }
      
      public function setSishoushengHuhuan() : void
      {
         this.text1.htmlText = "<textformat leading=\'0.1\'>" + LanResManager.getLanCommonTextWords("选择上方坐骑框内的圣兽，通过圣兽变换神丹，您的圣兽外形将变换为新选择的圣兽。") + "</textformat>";
         this.titleText = LanResManager.getLanCommonTextWords("圣兽互换");
         this._container1.visible = true;
         this._container2.visible = false;
      }
   }
}

