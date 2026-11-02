package com.tgame.shell.view.components.ride
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.list.FListCellRenderer;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.character.PureMount;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.MountSkill;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.shell.view.components.RideFeedPanel;
   import com.tgame.shell.view.components.RidePanel;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.*;
   
   public class Ride extends Sprite
   {
      
      public static const UI_RIDE_TYPE_CHAR:String = "UI_RIDE_TYPE_CHAR";
      
      public static const UI_RIDE_TYPE_TARGET:String = "UI_RIDE_TYPE_TARGET";
      
      public var bgImg:Bitmap;
      
      private var _type:String;
      
      private var _avatar:Bitmap;
      
      private var _mask:Shape;
      
      private var dreamBar:DreamBar;
      
      private var container1:Sprite;
      
      private var container2:Sprite;
      
      private var equipContainer:Sprite;
      
      private var skillContainer:Sprite;
      
      private var title:FLabel;
      
      public var rideList:FList;
      
      private var scroll:FVScorllBar;
      
      private var tip1:FTextArea;
      
      private var tip2:FTextArea;
      
      private var tip3:FTextArea;
      
      private var tip4:FTextArea;
      
      private var addValue:FTextArea;
      
      private var dreamValue:FTextArea;
      
      private var SiShouAddValue:FTextArea;
      
      private var rideBaseAttribute:FTextArea;
      
      private var rideBaseAttribute1:FTextArea;
      
      private var savvyText:FLabel;
      
      private var rideTypeValue:FTextArea;
      
      private var rideBtn:SmallButton;
      
      private var feedBtn:SmallButton;
      
      private var showBtn:SmallButton;
      
      private var releaseBtn:SmallButton;
      
      private var expBar:ColorBar;
      
      private var fightBar:ColorBar;
      
      private var attackBar:ColorBar;
      
      private var recoveryBar:ColorBar;
      
      private var lightBar:ColorBar;
      
      private var healthBar:ColorBar;
      
      private var releaseRide:ReleaseRidePanel;
      
      private var rideSlotExtend:RideSlotExtendPanel;
      
      public var $parent:DisplayObject;
      
      public var ridePanel:RidePanel;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var valueContainer:Sprite;
      
      private var headContainer:Sprite;
      
      private var headImg:Bitmap;
      
      private var headTipCanvas:FCanvas;
      
      private var solt:Bitmap;
      
      private var txtYinCangShuxingJihuo:FTextArea;
      
      private var intYinCangShuXingJiHuo:int = 0;
      
      private var ft_Name1:FTextArea;
      
      private var ft_Value1:FTextArea;
      
      private var ft_Name2:FTextArea;
      
      private var ft_Value2:FTextArea;
      
      private var ft_Name3:FTextArea;
      
      private var ft_Value3:FTextArea;
      
      private var value1:int = 0;
      
      private var value2:int = 0;
      
      private var value3:int = 0;
      
      private var ft_lv:FTextArea;
      
      private var ft_price:FTextArea;
      
      private var moxueContainer:Sprite;
      
      private var BtnContainer:Sprite;
      
      private var chuBtn:NewButton;
      
      private var qiBtn:NewButton;
      
      private var qianBtn:NewButton;
      
      private var yinBtn:NewButton;
      
      private var sxftItem:ItemFace;
      
      private var sk:Skill;
      
      private var fc1:FCanvas;
      
      private var bg9:F9GridBitmap;
      
      private var swzhSprite:Sprite;
      
      private var bg:DisplayObject;
      
      private var ft:FTextArea;
      
      private var targetRideCanvas:TargetRideDataCanvas;
      
      private var dianFengShou:DianFengShouPanel;
      
      private var sxft_feng:Bitmap = null;
      
      private var expireDate:String = "";
      
      private var anju:int = 0;
      
      private var jiangsheng:int = 0;
      
      private var jiaodeng:int = 0;
      
      private var tieti:int = 0;
      
      public function Ride()
      {
         var kuang:DisplayObject = null;
         super();
         this.bgImg = new Bitmap();
         this.bgImg.name = "ui.ride.ui";
         this.fc1 = new FCanvas();
         this.fc1.x = 1;
         this.fc1.y = 297 + 2;
         this.fc1.width = 402;
         this.fc1.height = 48 + 2;
         this.fc1.skin = "box";
         addChild(this.fc1);
         this.bg9 = Tools.get9GridBitmpByName("ride9_bg");
         this.bg9.width = 313 - 1;
         this.bg9.height = 198 + 30 - 2;
         this.bg9.x = 90;
         this.bg9.y = 2 + 2;
         addChild(this.bg9);
         this.fc1 = new FCanvas();
         this.fc1.x = 1;
         this.fc1.y = 1 + 2;
         this.fc1.width = 402;
         this.fc1.height = 345 + 2;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip);
         switch(OtherConst.mount_add_count)
         {
            case 0:
               break;
            case 1:
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 95;
               this.solt.y = 76 - 5;
               addChild(this.solt);
               break;
            case 2:
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 95;
               this.solt.y = 76 - 5;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 95;
               this.solt.y = 126 - 9;
               addChild(this.solt);
               break;
            case 3:
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 95;
               this.solt.y = 76 - 5;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 95;
               this.solt.y = 126 - 9;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 150;
               this.solt.y = 163;
               addChild(this.solt);
               break;
            case 4:
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 95;
               this.solt.y = 76 - 5;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 95;
               this.solt.y = 126 - 9;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 150;
               this.solt.y = 163;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 300;
               this.solt.y = 163;
               addChild(this.solt);
               break;
            case 5:
               kuang = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ride/ui.ride.peishi.swf");
               kuang.x = 95;
               kuang.y = 76 - 5;
               addChild(kuang);
               kuang = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ride/ui.ride.pifeng.swf");
               kuang.x = 95;
               kuang.y = 126 - 9;
               addChild(kuang);
               kuang = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ride/ui.ride.zhanjia.swf");
               kuang.x = 150;
               kuang.y = 163;
               addChild(kuang);
               kuang = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ride/ui.ride.xiangquan.swf");
               kuang.x = 355;
               kuang.y = 76 - 5;
               addChild(kuang);
               kuang = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ride/ui.ride.lizhua.swf");
               kuang.x = 355;
               kuang.y = 126 - 9;
               addChild(kuang);
               kuang = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ride/ui.ride.skill.swf");
               kuang.x = 300;
               kuang.y = 163;
               this.sk = new Skill(200145);
               this.sxftItem = new ItemFace(this.sk);
               this.sxftItem.x = 300 + 2;
               this.sxftItem.y = 163 + 2;
               this.sxftItem.showKungFuTag();
               this.sxftItem.setShowCount(false);
               kuang = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ride/ui.ride.anju.swf");
               kuang.x = 95;
               kuang.y = 26;
               addChild(kuang);
               kuang = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ride/ui.ride.jiangsheng.swf");
               kuang.x = 95;
               kuang.y = 163;
               addChild(kuang);
               kuang = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ride/ui.ride.dengju.swf");
               kuang.x = 355;
               kuang.y = 26;
               addChild(kuang);
               kuang = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ride/ui.ride.titie.swf");
               kuang.x = 355;
               kuang.y = 163;
               addChild(kuang);
               kuang = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ride/ui.ride.zuoling.swf");
               kuang.x = 150;
               kuang.y = 26;
               addChild(kuang);
               kuang = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ride/ui.ride.youling.swf");
               kuang.x = 300;
               kuang.y = 26;
               addChild(kuang);
         }
         this.init();
         this.targetRideCanvas = new TargetRideDataCanvas();
         this.targetRideCanvas.visible = false;
         this.targetRideCanvas.setParent(this.$parent);
         this.targetRideCanvas.x = 414;
         this.targetRideCanvas.y = 0;
         addChild(this.targetRideCanvas);
         this.dianFengShou = new DianFengShouPanel();
         this.dianFengShou.visible = false;
         this.dianFengShou.setParent(this.$parent);
         this.dianFengShou.x = 412;
         this.dianFengShou.y = -20 - 35;
         addChild(this.dianFengShou);
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
         if(param1 == UI_RIDE_TYPE_TARGET)
         {
            this.hideBtn();
         }
      }
      
      private function init() : void
      {
         var bit2:Bitmap;
         var barBg1:Bitmap;
         this._mask = new Shape();
         with(this._mask)
         {
            graphics.beginFill(0,0);
            graphics.drawRect(0,0,148,84);
            graphics.endFill();
         }
         this._mask.x = 212;
         this._mask.y = 21;
         addChild(this._mask);
         this._avatar = new Bitmap();
         this._avatar.name = "avatar";
         addChild(this._avatar);
         this.title = new FLabel();
         this.title.textColor = 16777215;
         this.title.selectable = false;
         addChild(this.title);
         this.title.x = 2;
         this.title.y = 6;
         this.title.text = LanResManager.getLanCommonTextWords("拥有坐骑：");
         bit2 = StaticValue.getBitmapByClassName("ui.line");
         bit2.x = 3;
         bit2.y = 25;
         bit2.width = 93;
         addChild(bit2);
         this.rideList = new FList();
         this.rideList.skin = "list";
         this.rideList.itemRenderer = new MountListRender();
         this.rideList.listHeight = 200;
         this.rideList.listWidth = 72;
         addChild(this.rideList);
         this.rideList.x = 5;
         this.rideList.y = 28;
         this.rideList.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.rideList.addEventListener(MouseEvent.MOUSE_OVER,this.onListMouse);
         this.rideList.addEventListener(MouseEvent.MOUSE_OUT,this.onListMouse);
         this.scroll = new FVScorllBar(this.rideList,200);
         addChild(this.scroll);
         this.scroll.x = 61 + 10;
         this.scroll.y = 28;
         bit2 = StaticValue.getBitmapByClassName("ui.line");
         bit2.x = 0;
         bit2.y = 228;
         bit2.width = 404;
         addChild(bit2);
         this.rideBtn = new SmallButton();
         this.rideBtn.label = LanResManager.getLanCommonTextWords("骑 乘");
         this.rideBtn.toolTip = "<textformat leading=\'\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("骑上该坐骑（骑上之后将会得到该坐骑带来的属性加成）") + "</font></textformat>";
         addChild(this.rideBtn);
         this.rideBtn.x = 100 + 10;
         this.rideBtn.y = 206;
         this.rideBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.feedBtn = new SmallButton();
         this.feedBtn.label = LanResManager.getLanCommonTextWords("驯 养");
         this.feedBtn.toolTip = "<textformat leading=\'\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("通过训练可以让坐骑变得更加强大") + "</font></textformat>";
         addChild(this.feedBtn);
         this.feedBtn.x = 160 + 20;
         this.feedBtn.y = 206;
         this.feedBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.showBtn = new SmallButton();
         this.showBtn.label = LanResManager.getLanCommonTextWords("出 战");
         this.showBtn.toolTip = "<textformat leading=\'\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("令该坐骑出战（出战后的坐骑将会与您并肩战斗）") + "</font></textformat>";
         addChild(this.showBtn);
         this.showBtn.enabled = false;
         this.showBtn.x = 220 + 40;
         this.showBtn.y = 206;
         this.showBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.releaseBtn = new SmallButton();
         this.releaseBtn.label = LanResManager.getLanCommonTextWords("遣 散");
         this.releaseBtn.enabled = false;
         this.releaseBtn.toolTip = "<textformat leading=\'\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("遣散后，该坐骑将会消失，空出一个槽位") + "</font></textformat>";
         addChild(this.releaseBtn);
         this.releaseBtn.x = 330;
         this.releaseBtn.y = 206;
         this.releaseBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ft = new FTextArea();
         this.ft.x = 10;
         this.ft.y = 195 + 30 + 10;
         this.ft.htmlText = "<font color=\'" + StaticValue.SKY_BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前经验：") + "</font>";
         addChild(this.ft);
         barBg1 = StaticValue.getBitmapByClassName("ui.char.attribute.venation.jindutiao");
         addChild(barBg1);
         barBg1.x = 93;
         barBg1.y = 229 - 2 + 10;
         this.expBar = new ColorBar(5,273,5);
         addChild(this.expBar);
         this.expBar.x = 96;
         this.expBar.y = 201 + 30 - 2 + 10;
         this.ft_Name1 = new FTextArea();
         this.ft_Name1.x = 10;
         this.ft_Name1.y = 210 + 30 + 10;
         this.ft_Name1.htmlText = "<textformat leading=\'1\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("生命") + "<br>" + LanResManager.getLanCommonTextWords("攻击") + "<br>" + LanResManager.getLanCommonTextWords("闪避") + "</font></textformat>";
         addChild(this.ft_Name1);
         this.ft_Name2 = new FTextArea();
         this.ft_Name2.x = 150;
         this.ft_Name2.y = 210 + 30 + 10;
         this.ft_Name2.htmlText = "<textformat leading=\'1\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("内力") + "<br>" + LanResManager.getLanCommonTextWords("防御") + "<br>" + LanResManager.getLanCommonTextWords("攻速") + "</font></textformat>";
         addChild(this.ft_Name2);
         this.ft_Name3 = new FTextArea();
         this.ft_Name3.x = 300;
         this.ft_Name3.y = 210 + 30 + 10;
         this.ft_Name3.htmlText = "<textformat leading=\'1\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("体力") + "<br>" + LanResManager.getLanCommonTextWords("暴击") + "<br>" + LanResManager.getLanCommonTextWords("移速") + "</font></textformat>";
         addChild(this.ft_Name3);
         this.ft_Value1 = new FTextArea();
         this.ft_Value1.x = 40 + 30;
         this.ft_Value1.y = 210 + 30 + 10;
         addChild(this.ft_Value1);
         this.ft_Value2 = new FTextArea();
         this.ft_Value2.x = 180 + 30;
         this.ft_Value2.y = 210 + 30 + 10;
         addChild(this.ft_Value2);
         this.ft_Value3 = new FTextArea();
         this.ft_Value3.x = 340 + 30;
         this.ft_Value3.y = 210 + 30 + 10;
         addChild(this.ft_Value3);
         this.ft_price = new FTextArea();
         this.ft_price.x = 305;
         this.ft_price.y = 6;
         this.ft_price.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("身价：") + "1000</font>";
         addChild(this.ft_price);
         this.ft_lv = new FTextArea();
         this.ft_lv.x = 100;
         this.ft_lv.y = 6;
         this.ft_lv.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("等级：") + "100</font>";
         addChild(this.ft_lv);
         this.equipContainer = new Sprite();
         addChild(this.equipContainer);
         this.equipContainer.x = 100;
         this.equipContainer.y = 23;
         with(this.equipContainer.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,310,175);
            endFill();
         }
         this.equipContainer.addEventListener(MouseEvent.MOUSE_UP,this.onEquip,false,30);
         this.skillContainer = new Sprite();
         addChild(this.skillContainer);
         this.skillContainer.x = 13;
         this.skillContainer.y = 325 - 20;
         this.dreamBar = new DreamBar();
         addChild(this.dreamBar);
         this.dreamBar.x = 195;
         this.dreamBar.y = 200 - 25;
         this.reset();
         this.swzhSprite = new Sprite();
         addChild(this.swzhSprite);
         this.swzhSprite.x = 195 + 80 - 5;
         this.swzhSprite.y = 175 - 2;
         with(this.swzhSprite.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,20,20);
            endFill();
         }
      }
      
      private function onLink(param1:TextEvent) : void
      {
         var pinji:String;
         var wuxing:String;
         var gongjiQL:String;
         var fangyuQL:String;
         var qingshenQL:String;
         var jiantiQL:String;
         var e:TextEvent = param1;
         if(this.rideList.selectItem.label == "" || this.rideList.selectItem.label == null)
         {
            return;
         }
         if(this._type == UI_RIDE_TYPE_TARGET)
         {
            return;
         }
         pinji = LanResManager.getLanCommonTextWords("品 级");
         wuxing = LanResManager.getLanCommonTextWords("悟 性");
         gongjiQL = LanResManager.getLanCommonTextWords("攻击潜力");
         fangyuQL = LanResManager.getLanCommonTextWords("防御潜力");
         qingshenQL = LanResManager.getLanCommonTextWords("轻身潜力");
         jiantiQL = LanResManager.getLanCommonTextWords("健体潜力");
         switch(e.text)
         {
            case pinji:
               this.ridePanel.rideFeed.dispatchEvent(new BaseEvent(RideFeedPanel.GET_RENEWENERGR_ENERGYQUALITY_SHOW));
               break;
            case wuxing:
               this.ridePanel.rideFeed.dispatchEvent(new BaseEvent(RideFeedPanel.GET_RENEWENERGR_ENERGYSAVVY_SHOW));
               break;
            case gongjiQL:
               this.ridePanel.rideFeed.dispatchEvent(new BaseEvent(RideFeedPanel.GET_RENEWENERGR_ENERGYACCATK_SHOW));
               break;
            case fangyuQL:
               this.ridePanel.rideFeed.dispatchEvent(new BaseEvent(RideFeedPanel.GET_RENEWENERGR_ENERGYRECOVERY_SHOW));
               break;
            case qingshenQL:
               this.ridePanel.rideFeed.dispatchEvent(new BaseEvent(RideFeedPanel.GET_RENEWENERGR_ENERGYLIGHT_SHOW));
               break;
            case jiantiQL:
               this.ridePanel.rideFeed.dispatchEvent(new BaseEvent(RideFeedPanel.GET_RENEWENERGR_ENERGYHEALTH_SHOW));
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         Tools.currentStage.addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = Tools.currentStage.mouseX + 15;
         this.tipCanvas.y = Tools.currentStage.mouseY + 25;
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this.rideList.selectItem == null)
         {
            return;
         }
         switch(param1.target)
         {
            case this.rideBtn:
               if(this.rideBtn.label == LanResManager.getLanCommonTextWords("骑 乘"))
               {
                  this.$parent.dispatchEvent(new BaseEvent(RidePanel.UI_RIDE_RIDEBTN_CLICK,"",this.rideList.selectItem.label));
               }
               else
               {
                  this.$parent.dispatchEvent(new BaseEvent(RidePanel.UI_RIDE_BREAKBTN_CLICK,"",this.rideList.selectItem.label));
               }
               break;
            case this.feedBtn:
               this.$parent.dispatchEvent(new BaseEvent(RidePanel.UI_RIDE_REEDBTN_CLICK,"",this.rideList.selectItem.label));
               break;
            case this.showBtn:
               if(this.showBtn.label == LanResManager.getLanCommonTextWords("出 战"))
               {
                  this.$parent.dispatchEvent(new BaseEvent(RidePanel.UI_RIDE_SHOWBTN_CLICK,"",this.rideList.selectItem.label));
               }
               else
               {
                  this.$parent.dispatchEvent(new BaseEvent(RidePanel.UI_RIDE_HIDEBTN_CLICK,"",this.rideList.selectItem.label));
               }
               break;
            case this.releaseBtn:
               this.showReleaseRide(this.rideList.selectItem.label);
         }
      }
      
      private function onEquip(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(RidePanel.UI_RIDE_EQUIP_CLICK,"",param1));
      }
      
      private function showReleaseRide(param1:String) : void
      {
         if(this.releaseRide == null)
         {
            this.releaseRide = new ReleaseRidePanel();
            this.releaseRide.$parent = this.$parent;
         }
         if(this.releaseRide.parent)
         {
            return;
         }
         this.releaseRide.id = param1;
         Tools.currentStage.addChild(this.releaseRide);
      }
      
      public function showRideSlotExtend(param1:int, param2:Goods, param3:Boolean) : void
      {
         if(this.rideSlotExtend == null)
         {
            this.rideSlotExtend = new RideSlotExtendPanel();
            this.rideSlotExtend.$parent = this.$parent;
         }
         this.rideSlotExtend.show(param1,param2,param3);
         if(this.rideSlotExtend.parent)
         {
            return;
         }
         POPWindowManager.showWindow(this.rideSlotExtend);
      }
      
      public function swapBtnLabel(param1:int) : void
      {
         switch(param1)
         {
            case 0:
               this.rideBtn.label = LanResManager.getLanCommonTextWords("骑 乘");
               this.showBtn.label = LanResManager.getLanCommonTextWords("出 战");
               this.rideBtn.enabled = true;
               this.feedBtn.enabled = true;
               this.showBtn.enabled = true;
               this.releaseBtn.enabled = true;
               break;
            case 1:
               this.rideBtn.label = LanResManager.getLanCommonTextWords("收 回");
               this.showBtn.label = LanResManager.getLanCommonTextWords("出 战");
               this.rideBtn.enabled = true;
               this.feedBtn.enabled = true;
               this.showBtn.enabled = false;
               this.releaseBtn.enabled = false;
               break;
            case 2:
               this.rideBtn.label = LanResManager.getLanCommonTextWords("骑 乘");
               this.showBtn.label = LanResManager.getLanCommonTextWords("隐 藏");
               this.rideBtn.enabled = false;
               this.feedBtn.enabled = true;
               this.showBtn.enabled = true;
               this.releaseBtn.enabled = false;
         }
      }
      
      public function swapShowBtn() : void
      {
      }
      
      private function onListMouse(param1:MouseEvent) : void
      {
         var _loc2_:FListCellRenderer = null;
         var _loc3_:Object = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:Point = null;
         var _loc8_:Array = null;
         var _loc9_:Date = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               Tools.currentStage.addChild(this.tipCanvas);
               this.tipCanvas.visible = false;
               this.rideList.addEventListener(MouseEvent.MOUSE_MOVE,this.onListMouse);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = param1.target as FListCellRenderer;
               if(_loc2_ == null)
               {
                  return;
               }
               _loc3_ = _loc2_.data;
               _loc4_ = "";
               _loc5_ = _loc3_.showlabel || "";
               _loc6_ = "";
               if(_loc5_.indexOf(LanResManager.getLanCommonTextWords("万灵圣鹿")) == 0 || _loc5_.indexOf(LanResManager.getLanCommonTextWords("新春年兽")) == 0 || _loc5_.indexOf(LanResManager.getLanCommonTextWords("贺岁魔王")) == 0)
               {
                  _loc8_ = this.expireDate.split(".");
                  if(_loc8_.length == 3)
                  {
                     _loc9_ = new Date(Number(_loc8_[0]),Number(_loc8_[1]) - 1,Number(_loc8_[2]));
                     _loc9_ = new Date(_loc9_.getTime() + 30 * 24 * 3600 * 1000);
                     _loc6_ = LanResManager.getLanCommonTextWords("坐骑到期的时间") + _loc9_.getFullYear() + LanResManager.getLanCommonTextWords("年") + (_loc9_.getMonth() + 1) + LanResManager.getLanCommonTextWords("月") + _loc9_.getDate() + LanResManager.getLanCommonTextWords("日");
                  }
               }
               if(_loc3_.showlabel != LanResManager.getLanCommonTextWords("增加槽位") && _loc3_.showlabel != LanResManager.getLanCommonTextWords("空闲槽位"))
               {
                  _loc4_ = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + _loc3_.showlabel + "<br/>" + LanResManager.getLanCommonTextWords("等级：") + _loc3_.level + LanResManager.getLanCommonTextWords("级") + "<br/>" + LanResManager.getLanCommonTextWords("悟性：") + _loc3_.wx + "<br/>" + LanResManager.getLanCommonTextWords("品级：") + _loc3_.quality + "</font>";
               }
               else
               {
                  if(_loc3_.showlabel != LanResManager.getLanCommonTextWords("增加槽位"))
                  {
                     this.tipCanvas.visible = false;
                     return;
                  }
                  _loc4_ = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击增加槽位") + "</font>";
               }
               if(_loc3_.zw1 > 0 ? true : false)
               {
                  _loc10_ = int(_loc3_.zw1) / 100;
                  _loc4_ += "<textformat leading=\'8\'><br><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("伤害增强：") + _loc3_.zw1 + "%</font></textformat>";
               }
               if(_loc3_.zw2 > 0 ? true : false)
               {
                  _loc11_ = int(_loc3_.zw2) / 100;
                  _loc4_ += "<textformat leading=\'8\'><br><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("反弹伤害：") + _loc3_.zw2 + "%</font></textformat>";
               }
               if(_loc3_.zw3 > 0 ? true : false)
               {
                  _loc12_ = int(_loc3_.zw3) / 100;
                  _loc4_ += "<textformat leading=\'8\'><br><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("忽视防御：") + _loc3_.zw3 + "%</font></textformat>";
               }
               if(_loc3_.zw4 > 0 ? true : false)
               {
                  _loc13_ = int(_loc3_.zw4) / 100;
                  _loc4_ += "<textformat leading=\'8\'><br><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("伤害减免：") + _loc3_.zw4 + "%</font></textformat>";
               }
               if(_loc3_.ycsx > 0 ? true : false)
               {
                  _loc4_ += "<textformat leading=\'8\'><br><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("【逆天属性】有几率3秒无视对方攻击并") + "<br>" + LanResManager.getLanCommonTextWords("100%反弹伤害（冷却时间10分钟）") + "</font></textformat>";
               }
               this.tip.htmlText = _loc4_ + "<br>" + _loc6_;
               this.tipCanvas.width = this.tip.width + 4;
               this.tipCanvas.height = this.tip.height + 4;
               this.tipCanvas.visible = true;
               _loc7_ = _loc2_.parent.localToGlobal(new Point(_loc2_.x,_loc2_.y));
               this.tipCanvas.x = _loc7_.x - this.tipCanvas.width;
               this.tipCanvas.y = _loc7_.y;
               break;
            case MouseEvent.MOUSE_OUT:
               this.rideList.removeEventListener(MouseEvent.MOUSE_MOVE,this.onListMouse);
               Tools.currentStage.removeChild(this.tipCanvas);
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
            if(this._type == UI_RIDE_TYPE_TARGET)
            {
               this.$parent.dispatchEvent(new BaseEvent(TargetAttribute.GETRIDEINTBYID,"",this.rideList.selectItem.label));
            }
            else
            {
               this.$parent.dispatchEvent(new BaseEvent(RidePanel.GETRIDEINTBYID,"",this.rideList.selectItem.label));
            }
         }
         else if(this.rideList.selectItem.showlabel == LanResManager.getLanCommonTextWords("增加槽位"))
         {
            this.hideBtn();
            if(this._type == UI_RIDE_TYPE_TARGET)
            {
               this.$parent.dispatchEvent(new BaseEvent(TargetAttribute.GETRIDEINTBYID,"",-2));
            }
            else
            {
               this.$parent.dispatchEvent(new BaseEvent(RidePanel.GETRIDEINTBYID,"",-2));
            }
         }
         else
         {
            this.hideBtn();
            if(this._type == UI_RIDE_TYPE_TARGET)
            {
               this.$parent.dispatchEvent(new BaseEvent(TargetAttribute.GETRIDEINTBYID,"",-1));
            }
            else
            {
               this.$parent.dispatchEvent(new BaseEvent(RidePanel.GETRIDEINTBYID,"",-1));
            }
         }
         this.reset();
      }
      
      private function reset() : void
      {
         this.ft_Value1.htmlText = "<textformat leading=\'1\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>0<br>0<br>0</font></textformat>";
         this.ft_Value2.htmlText = "<textformat leading=\'1\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>0<br>0<br>0</font></textformat>";
         this.ft_Value3.htmlText = "<textformat leading=\'1\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>0<br>0<br>0</font></textformat>";
         this.expBar.setValue(1,100);
         this.setEquip([]);
         this.setSkill([]);
         this.setRideQuality("");
         this.dreamBar.setValue(1,1,1,1,1,false,0,0,0,0);
         this._avatar.bitmapData = null;
         this.ft_lv.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("等级：") + "</font>";
         this.ft_price.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("身价：") + "</font>";
      }
      
      public function set ridelist(param1:XML) : void
      {
         this.rideList.dataProvider = param1;
         this.scroll.update();
         this.reset();
      }
      
      public function set rideCount(param1:String) : void
      {
         this.title.text = LanResManager.getLanCommonTextWords("拥有坐骑：") + "" + param1;
      }
      
      public function setRideQuality(param1:String = "") : void
      {
      }
      
      public function setAddValue(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number) : void
      {
         this.ft_Value1.htmlText = "<textformat leading=\'1\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>+" + param1 + "<br>+" + param4 + "<br>+" + param7 + "</font></textformat>";
         this.ft_Value2.htmlText = "<textformat leading=\'1\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>+" + param2 + "<br>+" + param5 + "<br>+" + param8 + "</font></textformat>";
         this.ft_Value3.htmlText = "<textformat leading=\'1\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>+" + param3 + "<br>+" + param6 + "<br>+" + param9 + "</font></textformat>";
      }
      
      public function setBaseAttribute(param1:String, param2:String, param3:String, param4:String, param5:String) : void
      {
         if(this.rideList.selectItem != null)
         {
            if(this.rideList.selectItem.xs == 1)
            {
               this.setXueShouSkill(true);
            }
            else
            {
               this.setXueShouSkill(false);
            }
         }
         this.ft_lv.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("等级：") + param5 + "</font>";
         this.ft_price.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("身价：") + param4 + "</font>";
      }
      
      public function setAttribute(param1:Number, param2:Number, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:int, param13:int, param14:int, param15:int, param16:int, param17:int, param18:int) : void
      {
         if(param1 <= 0)
         {
            param1 = 0;
         }
         if(param1 >= param2)
         {
            param1 = param2;
         }
         this.expBar.setValue(param1,param2);
      }
      
      public function setEquip(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:Goods = null;
         var _loc5_:ItemFace = null;
         var _loc6_:String = null;
         var _loc7_:Array = null;
         var _loc8_:Bitmap = null;
         while(this.equipContainer.numChildren > 0)
         {
            this.equipContainer.removeChildAt(0);
         }
         this.anju = 0;
         this.jiangsheng = 0;
         this.jiaodeng = 0;
         this.tieti = 0;
         if(this.rideList.selectItem)
         {
            _loc6_ = this.rideList.selectItem.showlabel || "";
            if(_loc6_.indexOf(LanResManager.getLanCommonTextWords("万灵圣鹿")) == 0 || _loc6_.indexOf(LanResManager.getLanCommonTextWords("新春年兽")) == 0 || _loc6_.indexOf(LanResManager.getLanCommonTextWords("贺岁魔王")) == 0)
            {
               _loc7_ = [{
                  "x":-3,
                  "y":5
               },{
                  "x":-4,
                  "y":49
               },{
                  "x":-3,
                  "y":96
               },{
                  "x":-3,
                  "y":142
               },{
                  "x":257,
                  "y":5
               },{
                  "x":257,
                  "y":48
               },{
                  "x":257,
                  "y":95
               },{
                  "x":257,
                  "y":142
               },{
                  "x":52,
                  "y":5
               },{
                  "x":52,
                  "y":142
               },{
                  "x":202,
                  "y":5
               }];
               _loc2_ = 0;
               while(_loc2_ < _loc7_.length)
               {
                  _loc8_ = StaticValue.getBitmapByClassName("ui.tongyong.fugai.kuang");
                  _loc8_.x = _loc7_[_loc2_].x - 2;
                  _loc8_.y = _loc7_[_loc2_].y - 2;
                  this.equipContainer.addChild(_loc8_);
                  _loc2_++;
               }
               return;
            }
         }
         var _loc3_:int = int(param1.length);
         if(_loc3_ == 0)
         {
            return;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = param1[_loc2_] as Goods;
            _loc5_ = new ItemFace(_loc4_);
            if(this._type == UI_RIDE_TYPE_CHAR)
            {
               _loc5_.showRedMask();
            }
            _loc5_.showStrengthenLv = true;
            this.equipContainer.addChild(_loc5_);
            switch(_loc4_.position)
            {
               case ItemPositionRange.POSTION_HOURSE_ANJU:
                  _loc5_.x = 100 - 179 + 1 + 75;
                  _loc5_.y = 26 - 23 + 2;
                  if(_loc4_.id == 370150)
                  {
                     this.anju = 1;
                  }
                  else if(_loc4_.id == 372028)
                  {
                     this.anju = 2;
                  }
                  else
                  {
                     this.anju = 0;
                  }
                  break;
               case ItemPositionRange.POSTION_HOURSE_JIANGSHENG:
                  _loc5_.x = 100 - 180 + 2 + 75;
                  _loc5_.y = 163 - 25 + 3 + 1;
                  if(_loc4_.id == 370151)
                  {
                     this.jiangsheng = 1;
                  }
                  else if(_loc4_.id == 372029)
                  {
                     this.jiangsheng = 2;
                  }
                  else
                  {
                     this.jiangsheng = 0;
                  }
                  break;
               case ItemPositionRange.POSTION_HOURSE_TIJU:
                  _loc5_.x = 355 - 170 - 3 + 75;
                  _loc5_.y = 26 - 24 + 2 + 1;
                  if(_loc4_.id == 370152)
                  {
                     this.jiaodeng = 1;
                  }
                  else if(_loc4_.id == 372030)
                  {
                     this.jiaodeng = 2;
                  }
                  else
                  {
                     this.jiaodeng = 0;
                  }
                  break;
               case ItemPositionRange.POSTION_HOURSE_TITIE:
                  _loc5_.x = 355 - 170 - 2 + 75 - 1;
                  _loc5_.y = 163 - 24 + 3;
                  if(_loc4_.id == 370153)
                  {
                     this.tieti = 1;
                  }
                  else if(_loc4_.id == 372031)
                  {
                     this.tieti = 2;
                  }
                  else
                  {
                     this.tieti = 0;
                  }
                  break;
               case ItemPositionRange.POSTION_HOURSE_NEW1:
                  if(OtherConst.mount_add_count == 2)
                  {
                     _loc5_.x = 57 + 75;
                     _loc5_.y = 40;
                  }
                  else
                  {
                     _loc5_.x = 94 - 120 + 3 + 75;
                     _loc5_.y = 40 + 102;
                  }
                  break;
               case ItemPositionRange.POSTION_HOURSE_NEW2:
                  if(OtherConst.mount_add_count == 2)
                  {
                     _loc5_.x = 130 + 75;
                     _loc5_.y = 40;
                  }
                  else
                  {
                     _loc5_.x = 47 - 125 + 75;
                     _loc5_.y = 40 + 56;
                  }
                  break;
               case ItemPositionRange.POSTION_HOURSE_NEW3:
                  _loc5_.x = 140 + 40 + 2 + 75;
                  _loc5_.y = 40 + 8;
                  break;
               case ItemPositionRange.POSTION_HOURSE_NEW4:
                  _loc5_.x = 47 - 126 + 75;
                  _loc5_.y = -7 + 56;
                  break;
               case ItemPositionRange.POSTION_HOURSE_NEW5:
                  _loc5_.x = 140 + 40 + 2 + 75;
                  _loc5_.y = -7 + 102;
                  break;
               case ItemPositionRange.POSTION_HOURSE_NEW6:
                  _loc5_.x = 52;
                  _loc5_.y = 26 - 23 + 2;
                  break;
               case ItemPositionRange.POSTION_HOURSE_NEW7:
                  _loc5_.x = 355 - 170 - 3 + 75 - 55;
                  _loc5_.y = 26 - 23 + 2;
            }
            _loc2_++;
         }
      }
      
      public function setSkill(param1:Object) : void
      {
         var _loc2_:int = 0;
         var _loc3_:ItemFace = null;
         var _loc4_:Skill = null;
         while(this.skillContainer.numChildren > 0)
         {
            this.skillContainer.removeChildAt(0);
         }
         _loc2_ = 0;
         while(_loc2_ < 8)
         {
            this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
            this.solt.x = 49 * _loc2_ - 1;
            this.solt.y = -2;
            this.skillContainer.addChild(this.solt);
            _loc2_++;
         }
         _loc2_ = 0;
         for each(_loc4_ in param1)
         {
            if(_loc4_ is MountSkill)
            {
               _loc3_ = new ItemFace(_loc4_ as MountSkill);
               if((_loc4_ as MountSkill).lv <= 0)
               {
                  _loc3_.setShowCount(false);
               }
               this.skillContainer.addChild(_loc3_);
               _loc3_.x = 49 * _loc2_;
            }
            else
            {
               _loc3_ = new ItemFace(_loc4_ as Skill);
               _loc3_.setShowCount(false);
               this.skillContainer.addChild(_loc3_);
               _loc3_.x = 49 * _loc2_;
            }
            _loc2_++;
         }
      }
      
      public function disablePartOption(param1:Boolean = false) : void
      {
         this.rideBtn.enabled = param1;
         this.feedBtn.enabled = param1;
         this.showBtn.enabled = param1;
         this.releaseBtn.enabled = param1;
      }
      
      public function hideBtn() : void
      {
         this.rideBtn.enabled = false;
         this.feedBtn.enabled = false;
         this.showBtn.enabled = false;
         this.releaseBtn.enabled = false;
      }
      
      public function setSelectRideByID(param1:int) : void
      {
         this.rideList.setSelectItemByLabel(param1.toString());
         this.$parent.dispatchEvent(new BaseEvent(RidePanel.GETRIDEINTBYID,"",param1.toString()));
         this.reset();
      }
      
      public function resize(param1:Number, param2:Number) : void
      {
         if(this.releaseRide)
         {
            this.releaseRide.resize(param1,param2);
         }
      }
      
      public function setDreamValue(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number) : void
      {
         this.ft_Value1.htmlText = "<textformat leading=\'1\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>+" + param1 + "<br>+" + param4 + "<br>+" + param7 + "</font></textformat>";
         this.ft_Value2.htmlText = "<textformat leading=\'1\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>+" + param2 + "<br>+" + param5 + "<br>+" + param8 + "</font></textformat>";
         this.ft_Value3.htmlText = "<textformat leading=\'1\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>+" + param3 + "<br>+" + param6 + "<br>+" + param9 + "</font></textformat>";
      }
      
      public function setAvatar(param1:BitmapData, param2:int) : void
      {
         this.avatar = param1;
      }
      
      public function set avatar(param1:BitmapData) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         this._avatar.scaleX = this._avatar.scaleY = 1;
         this._avatar.bitmapData = param1;
         if(!param1)
         {
            return;
         }
         var _loc2_:int = 240;
         var _loc3_:int = 150 + 50;
         var _loc4_:Rectangle = this._avatar.bitmapData.getColorBoundsRect(4278190080,0,false);
         if(_loc4_.width > _loc2_ || _loc4_.height > _loc3_)
         {
            _loc5_ = _loc2_ / _loc4_.width;
            _loc6_ = _loc3_ / _loc4_.height;
            if(_loc5_ > _loc6_)
            {
               this._avatar.scaleX = this._avatar.scaleY = _loc6_;
            }
            else
            {
               this._avatar.scaleX = this._avatar.scaleY = _loc5_;
            }
         }
         this._avatar.y = -20 + 40 + (_loc3_ - this._avatar.height) / 2 - 20;
         this._avatar.x = -30 + 140 + (_loc2_ - this._avatar.width) / 2;
      }
      
      public function setDreamBarPercentage(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Boolean, param7:int, param8:int, param9:int, param10:int) : void
      {
         this.dreamBar.setValue(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         this.dreamBar.setHeianGuangming(this.anju,this.jiangsheng,this.jiaodeng,this.tieti);
      }
      
      public function setSiShengShouValue(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number) : void
      {
         this.ft_Value1.htmlText = "<textformat leading=\'1\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>+" + param1 + "<br>+" + param4 + "<br>+" + param7 + "</font></textformat>";
         this.ft_Value2.htmlText = "<textformat leading=\'1\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>+" + param2 + "<br>+" + param5 + "<br>+" + param8 + "</font></textformat>";
         this.ft_Value3.htmlText = "<textformat leading=\'1\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>+" + param3 + "<br>+" + param6 + "<br>+" + param9 + "</font></textformat>";
      }
      
      public function setYinCangShuXingJiHuo(param1:int) : void
      {
         this.intYinCangShuXingJiHuo = param1;
      }
      
      public function setShouwangzhihun(param1:Boolean, param2:Boolean) : void
      {
         var _loc3_:String = "";
         var _loc4_:String = "";
         while(this.swzhSprite.numChildren > 0)
         {
            this.swzhSprite.removeChildAt(0);
         }
         if(param1)
         {
         }
      }
      
      public function setXueShouSkill(param1:Boolean) : void
      {
      }
      
      public function showTargetRide(param1:Boolean) : void
      {
         if(param1)
         {
            this.targetRideCanvas.visible = true;
            this.targetRideCanvas.setParent(this.$parent);
         }
         else
         {
            this.targetRideCanvas.visible = false;
         }
      }
      
      public function setTargetRide(param1:int, param2:String, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:int, param13:int, param14:int, param15:int, param16:int, param17:int) : void
      {
         this.targetRideCanvas.setParent(this.$parent);
         this.targetRideCanvas.setData(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14,param15,param16,param17);
      }
      
      public function setTips(param1:Array) : void
      {
         this.targetRideCanvas.setParent(this.$parent);
         this.targetRideCanvas.setTips(param1);
      }
      
      public function setExpireDate(param1:String) : void
      {
         if(param1 != "")
         {
            this.expireDate = param1;
         }
      }
      
      public function showTargetDianFengShou(param1:Boolean) : void
      {
         if(param1)
         {
            this.dianFengShou.visible = true;
            this.dianFengShou.setParent(this.$parent);
            addChild(this.dianFengShou);
         }
         else
         {
            this.dianFengShou.visible = false;
            if(this.dianFengShou.parent)
            {
               this.dianFengShou.parent.removeChild(this.dianFengShou);
            }
         }
      }
      
      public function setDianFengShouData(param1:int, param2:Array, param3:PureMount, param4:int) : void
      {
         this.dianFengShou.setPanelData(param1,param2,param3,param4);
      }
      
      public function setDianFengShouFun() : void
      {
         this.dianFengShou.setTargetFun();
      }
   }
}

