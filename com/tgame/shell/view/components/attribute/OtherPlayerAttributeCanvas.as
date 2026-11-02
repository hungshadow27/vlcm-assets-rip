package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import com.zcp.manager.RslLoaderManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.text.*;
   import flash.utils.Dictionary;
   import gs.TweenMax;
   
   public class OtherPlayerAttributeCanvas extends Sprite
   {
      
      public var bgImg:Bitmap;
      
      public var diZiBgImg:DisplayObject;
      
      private var _avatar:Bitmap;
      
      private var _mask:Shape;
      
      public var ico:CharAttributeOccultIco;
      
      private var baseAttributeTitle:FTextArea;
      
      private var charName:FTextArea;
      
      private var level:FTextArea;
      
      private var party:FTextArea;
      
      private var hpTitle:FTextArea;
      
      private var expBar:ColorBar;
      
      private var zhenqiBar:ColorBar;
      
      private var hpBar:ColorBar;
      
      private var mpBar:ColorBar;
      
      private var nqBar:ColorBar;
      
      private var skillTitle:FTextArea;
      
      private var skillValue:FTextArea;
      
      private var _skillValue1:Number;
      
      private var _skillValue2:Number;
      
      private var _skillValue3:Number;
      
      private var _skillValue4:Number;
      
      private var _skillValue1TT:String;
      
      private var _skillValue2TT:String;
      
      private var _skillValue3TT:String;
      
      private var _skillValue4TT:String;
      
      private var _skillValue5TT:String;
      
      private var _skillValue6TT:String;
      
      private var _skillValue7TT:String;
      
      private var _skillValue8TT:String;
      
      private var _skillValue9TT:String;
      
      private var _skillValue5:int;
      
      private var _skillValue6:int;
      
      private var _skillValue7:Number;
      
      private var _skillValue8:Number;
      
      private var _skillValue9:Number;
      
      private var hpMax:Number;
      
      private var mpMax:Number;
      
      private var npMax:Number;
      
      private var arr1:Array;
      
      private var colorBar1:ColorBar;
      
      private var colorBar2:ColorBar;
      
      private var colorBar3:ColorBar;
      
      private var colorBar4:ColorBar;
      
      private var colorBar4Ft:FTextArea;
      
      private var chatBtn:SecondButton;
      
      private var tradingBtn:SecondButton;
      
      private var cheerBtn:SecondButton;
      
      private var teamBtn:SecondButton;
      
      private var adoreBtn:SecondButton;
      
      private var despiseBtn:SecondButton;
      
      private var zhandouliBtn:SecondButton;
      
      public var $parent:DisplayObject;
      
      private var equipContainer:Sprite;
      
      private var flag:MovieClip;
      
      private var zanwenBtn:FSimpleButton;
      
      private var zanwenMask:Sprite;
      
      public var zanwenValue:OtherAttributeCanvas;
      
      private var tf:TextFormat;
      
      private var img:Bitmap;
      
      private var imgShiZhuang:Bitmap;
      
      private var starSpr:Sprite;
      
      private var starSta:int = 0;
      
      private var starMc:MovieClip;
      
      private var tianGangZhengQiSpr:Sprite;
      
      private var tianGangZhengQiSta:int = 0;
      
      private var tianGangZhengQiMc:MovieClip;
      
      private var mcObj:Array;
      
      private var wushuangBo:Boolean = false;
      
      private var zhizuntianxiaBo:Boolean = false;
      
      public var equipList:EquipList;
      
      public var nbEquipCanvas:NbEquipCanvas;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var img1:Bitmap;
      
      private var yupei:ItemFace;
      
      private var colorBarBg:Bitmap;
      
      private var zhandouBg:Bitmap;
      
      private var colorBarBg1:Bitmap;
      
      private var colorBarBg2:Bitmap;
      
      private var text1:FTextArea;
      
      private var isDizi:Boolean = false;
      
      public var specialAttributeTitle:FTextArea;
      
      public var specialValue0:FTextArea;
      
      public var specialValue1:FTextArea;
      
      public var specialValue2:FTextArea;
      
      public var specialValue3:FTextArea;
      
      public var wuShengQiDict:Dictionary;
      
      private var cheng1:Boolean;
      
      private var cheng2:Boolean;
      
      public function OtherPlayerAttributeCanvas()
      {
         this.arr1 = [];
         super();
         this.bgImg = new Bitmap();
         addChild(this.bgImg);
         this.bgImg.name = "ui.char.attribute.other.ui";
         this.diZiBgImg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/woDeMenPai/diZiAttributeBg.swf");
         this.diZiBgImg.visible = false;
         addChild(this.diZiBgImg);
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
         this.mcObj = new Array();
         this.initChar();
      }
      
      private function initChar() : void
      {
         this.colorBarBg = StaticValue.getBitmapByClassName("ui.char.attribute.colorBar.bg");
         addChild(this.colorBarBg);
         this.colorBarBg.x = 80;
         this.colorBarBg.y = 42;
         this.zhandouBg = StaticValue.getBitmapByClassName("ui.char.attribute.text.zhandou");
         addChild(this.zhandouBg);
         this.zhandouBg.x = 230;
         this.zhandouBg.y = 63;
         this.colorBarBg1 = StaticValue.getBitmapByClassName("ui.char.attribute.colorBar.bg");
         addChild(this.colorBarBg1);
         this.colorBarBg1.x = 260;
         this.colorBarBg1.y = 42;
         this.colorBarBg2 = StaticValue.getBitmapByClassName("ui.char.attribute.colorBar.bg");
         addChild(this.colorBarBg2);
         this.colorBarBg2.x = 52;
         this.colorBarBg2.y = 77;
         this.colorBarBg2.width = 168;
         this.colorBarBg2.visible = false;
         this._mask = new Shape();
         with(this._mask)
         {
            graphics.beginFill(0,1);
            graphics.drawRect(0,0,1000,280);
            graphics.endFill();
         }
         this._mask.x = -500;
         this._mask.y = -16;
         addChild(this._mask);
         this._avatar = new Bitmap();
         addChild(this._avatar);
         this._avatar.mask = this._mask;
         this.specialAttributeTitle = new FTextArea();
         with(this.specialAttributeTitle)
         {
            x = 240;
            y = 158;
            htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanCommonTextWords("攻击增强比例") + "<br>" + LanResManager.getLanCommonTextWords("伤害反弹比例") + "<br>" + LanResManager.getLanCommonTextWords("忽视防御比例") + "<br>" + LanResManager.getLanCommonTextWords("伤害减免比例") + "<br>" + LanResManager.getLanCommonTextWords("爆击伤害减免比例") + "<br>" + LanResManager.getLanCommonTextWords("暗器伤害减免比例") + "<br>" + LanResManager.getLanCommonTextWords("抵抗对方暗器几率") + "<br>" + LanResManager.getLanCommonTextWords("抵抗对方弓箭几率") + "<br>" + LanResManager.getLanCommonTextWords("抵抗丹田武学几率") + "<br>" + LanResManager.getLanCommonTextWords("武功层数") + "</textformat>";
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.BLUE;
            visible = false;
            addChild(specialAttributeTitle);
         }
         this.specialAttributeTitle.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip5);
         this.specialAttributeTitle.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip5);
         this.specialValue0 = new FTextArea();
         with(this.specialValue0)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 340;
            y = 158;
            textColor = StaticValue.WHITE;
            visible = false;
         }
         addChild(this.specialValue0);
         this.specialValue1 = new FTextArea();
         with(this.specialValue1)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 370;
            y = 158;
            textColor = StaticValue.WHITE;
            visible = false;
         }
         addChild(this.specialValue1);
         this.specialValue2 = new FTextArea();
         with(this.specialValue2)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 340;
            y = 242;
            textColor = StaticValue.WHITE;
            visible = false;
         }
         addChild(this.specialValue2);
         this.specialValue3 = new FTextArea();
         with(this.specialValue3)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 370;
            y = 242;
            textColor = StaticValue.WHITE;
            visible = false;
         }
         addChild(this.specialValue3);
         this.expBar = new ColorBar(5,99,5,true,true);
         addChild(this.expBar);
         this.expBar.x = 85;
         this.expBar.y = 45;
         this.zhenqiBar = new ColorBar(5,99,5,true,true);
         addChild(this.zhenqiBar);
         this.zhenqiBar.x = 265;
         this.zhenqiBar.y = 45;
         this.baseAttributeTitle = new FTextArea();
         with(this.baseAttributeTitle)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 20;
            y = 4;
            textColor = StaticValue.BlUE20;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"其他玩家基本属性标题",null,false) + "</textformat>";
         }
         addChild(this.baseAttributeTitle);
         this.charName = new FTextArea();
         with(this.charName)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 50;
            y = 4;
            textColor = StaticValue.WHITE;
         }
         addChild(this.charName);
         this.level = new FTextArea();
         with(this.level)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 190;
            y = 4;
            textColor = StaticValue.WHITE;
         }
         addChild(this.level);
         this.party = new FTextArea();
         with(this.party)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 327;
            y = 4;
            textColor = StaticValue.WHITE;
         }
         addChild(this.party);
         this.hpTitle = new FTextArea();
         with(this.hpTitle)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 20;
            y = 45;
            textColor = StaticValue.BlUE20;
            htmlText = LanResManager.getLanTextWords(this,"生命内力体力");
         }
         addChild(this.hpTitle);
         this.hpBar = new ColorBar(1,156,7);
         addChild(this.hpBar);
         this.hpBar.setValue(100,100);
         this.hpBar.x = 58;
         this.hpBar.y = 50;
         this.hpBar.visible = false;
         this.mpBar = new ColorBar(2,156,7);
         addChild(this.mpBar);
         this.mpBar.x = 58;
         this.mpBar.y = this.hpBar.y + 15;
         this.mpBar.setValue(100,100);
         this.mpBar.visible = false;
         this.nqBar = new ColorBar(4,156,7);
         addChild(this.nqBar);
         this.nqBar.x = 58;
         this.nqBar.y = this.hpBar.y + 30;
         this.nqBar.setValue(100,100);
         this.nqBar.visible = false;
         this.skillTitle = new FTextArea();
         with(this.skillTitle)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 256;
            y = 83;
            textColor = StaticValue.ORANGE;
            htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanCommonTextWords("生命上限") + "<br>" + LanResManager.getLanCommonTextWords("内力上限") + "<br>" + LanResManager.getLanCommonTextWords("体力上限") + "<br>" + LanResManager.getLanCommonTextWords("攻　　击") + "<br>" + LanResManager.getLanCommonTextWords("防　　御") + "<br>" + LanResManager.getLanCommonTextWords("暴　　击") + "<br>" + LanResManager.getLanCommonTextWords("闪　　避") + "<br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击速度") + "<br>" + LanResManager.getLanCommonTextWords("移动速度") + "</font></textformat>";
         }
         addChild(this.skillTitle);
         this.skillValue = new FTextArea();
         with(this.skillValue)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 326;
            y = 82;
            textColor = StaticValue.WHITE;
            htmlText = LanResManager.getLanTextWords(this,"123456666");
         }
         addChild(this.skillValue);
         this.skillValue.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip6);
         this.skillValue.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip6);
         this.text1 = new FTextArea();
         with(this.text1)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 230;
            y = 209 + 57;
            textColor = StaticValue.ORANGE;
            htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanCommonTextWords("武功境界") + "<br></textformat>";
         }
         addChild(this.text1);
         this.colorBar1 = new ColorBar(5,100,5);
         addChild(this.colorBar1);
         this.colorBar1.x = 290;
         this.colorBar1.y = 268 + 4;
         this.colorBar2 = new ColorBar(5,100,5);
         this.colorBar2.x = 290;
         this.colorBar2.y = 232;
         this.colorBar4 = new ColorBar(5,100,5,false);
         this.colorBar4.x = 290;
         this.colorBar4.y = 250;
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.colorBar4Ft = new FTextArea();
         with(this.colorBar4Ft)
         {
            defaultTextFormat = new TextFormat(null,9,16777215,null,null,null,null,null,"center");
            filters = StaticValue.filter;
            x = 290;
            y = 244;
            width = 100;
            textColor = StaticValue.WHITE;
            htmlText = "0/0";
         }
         this.colorBar3 = new ColorBar(5,100,5);
         this.colorBar3.x = 290;
         this.colorBar3.y = 268;
         this.chatBtn = new SecondButton();
         this.chatBtn.label = LanResManager.getLanTextWords(this,"密聊");
         this.chatBtn.x = 240;
         this.chatBtn.y = 288;
         addChild(this.chatBtn);
         this.chatBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tradingBtn = new SecondButton();
         this.tradingBtn.label = LanResManager.getLanTextWords(this,"交易");
         addChild(this.tradingBtn);
         this.tradingBtn.x = 320;
         this.tradingBtn.y = 288;
         this.tradingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cheerBtn = new SecondButton();
         this.cheerBtn.label = LanResManager.getLanTextWords(this,"加友");
         addChild(this.cheerBtn);
         this.cheerBtn.x = 240;
         this.cheerBtn.y = 314;
         this.cheerBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.teamBtn = new SecondButton();
         this.teamBtn.label = LanResManager.getLanTextWords(this,"组队");
         addChild(this.teamBtn);
         this.teamBtn.x = 320;
         this.teamBtn.y = 314;
         this.teamBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zhandouliBtn = new SecondButton();
         this.zhandouliBtn.label = LanResManager.getLanCommonTextWords("查看战斗力");
         addChild(this.zhandouliBtn);
         this.zhandouliBtn.x = 240;
         this.zhandouliBtn.y = 340;
         this.zhandouliBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.adoreBtn = new SecondButton();
         this.adoreBtn.label = LanResManager.getLanTextWords(this,"崇拜一下");
         addChild(this.adoreBtn);
         this.adoreBtn.x = 240;
         this.adoreBtn.y = 340;
         this.adoreBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.adoreBtn.visible = false;
         this.despiseBtn = new SecondButton();
         this.despiseBtn.label = LanResManager.getLanTextWords(this,"鄙视一下");
         addChild(this.despiseBtn);
         this.despiseBtn.x = 320;
         this.despiseBtn.y = 340;
         this.despiseBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.despiseBtn.visible = false;
         this.equipContainer = new Sprite();
         addChild(this.equipContainer);
         this.equipContainer.x = 13;
         this.equipContainer.y = 66;
         this.ico = new CharAttributeOccultIco();
         addChild(this.ico);
         this.ico.isMainChar = false;
         this.ico.x = 147;
         this.ico.y = 75;
         this.zanwenMask = new Sprite();
         addChild(this.zanwenMask);
         this.zanwenMask.x = 414;
         this.zanwenMask.y = 13;
         this.zanwenMask.mouseEnabled = false;
         with(this.zanwenMask.graphics)
         {
            beginFill(0);
            drawRect(0,0,182 + 24,364);
            endFill();
         }
         this.zanwenValue = new OtherAttributeCanvas(false);
         this.zanwenValue.x = 414;
         this.zanwenValue.y = 13;
         this.zanwenValue.mask = this.zanwenMask;
         this.zanwenBtn = new FSimpleButton();
         this.zanwenBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("等级在60级以上的玩家将拥有更多战斗属性") + "</font>";
         this.zanwenBtn.skin = "attribute_otherBtn";
         addChild(this.zanwenBtn);
         this.zanwenBtn.x = 287;
         this.zanwenBtn.y = 63;
         this.zanwenBtn.addEventListener(MouseEvent.CLICK,this.onShowLv);
         this.starSpr = new Sprite();
         this.starSpr.x = 375;
         this.starSpr.y = 25;
         addChild(this.starSpr);
         this.starSpr.addEventListener(MouseEvent.MOUSE_OVER,this.onStarMouseTip);
         this.starSpr.addEventListener(MouseEvent.MOUSE_OUT,this.onStarMouseTip);
         this.tianGangZhengQiSpr = new Sprite();
         this.tianGangZhengQiSpr.x = 220;
         this.tianGangZhengQiSpr.y = 4;
         addChild(this.tianGangZhengQiSpr);
         ToolTips.createToolTips(this.tianGangZhengQiSpr,this,function(param1:*, param2:MouseEvent):String
         {
            var _loc3_:String = "";
            if(cheng2)
            {
               _loc3_ += "<textformat leading=\'6\'>";
               _loc3_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("英雄传说1") + "<br>" + LanResManager.getLanCommonTextWords("英雄传说2") + "<br>" + LanResManager.getLanCommonTextWords("英雄传说3") + "<br>" + LanResManager.getLanCommonTextWords("英雄传说4") + "<br>" + LanResManager.getLanCommonTextWords("英雄传说5") + "</font>";
               _loc3_ += "</textformat>";
            }
            else if(cheng1)
            {
               _loc3_ += "<textformat leading=\'6\'>";
               _loc3_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("武林传奇1") + "<br>" + LanResManager.getLanCommonTextWords("武林传奇2") + "<br>" + LanResManager.getLanCommonTextWords("武林传奇3") + "<br>" + LanResManager.getLanCommonTextWords("武林传奇4") + "<br>" + LanResManager.getLanCommonTextWords("武林传奇5") + "</font>";
               _loc3_ += "</textformat>";
            }
            else if(zhizuntianxiaBo)
            {
               _loc3_ += "<textformat leading=\'6\'>";
               _loc3_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("至尊天下") + "<br>" + LanResManager.getLanCommonTextWords("攻击防御血量暴击闪避所有武功：至尊天下") + "<br>" + LanResManager.getLanCommonTextWords("特殊属性：至尊天下") + "</font>";
               _loc3_ += "</textformat>";
            }
            else if(wushuangBo)
            {
               _loc3_ += "<textformat leading=\'6\'>";
               _loc3_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("乱世无双") + "<br>" + LanResManager.getLanCommonTextWords("攻击10888888888888 防御8888888888888 血量12888888888888暴击 88888闪避88888   所有武功1800000层") + "<br>" + LanResManager.getLanCommonTextWords("特殊属性：受到攻击时，有几率使对手内力体力全失，自身有10%几率恢复满血状态！") + "</font>";
               _loc3_ += "</textformat>";
            }
            else
            {
               _loc3_ += "<textformat leading=\'6\'>";
               _loc3_ += "<font color=\'" + (tianGangZhengQiSta == 0 ? StaticValue.HUISE_HTML : StaticValue.RED_HTML) + "\'>" + LanResManager.getLanCommonTextWords("帝王天罡正气") + (tianGangZhengQiSta == 0 ? LanResManager.getLanCommonTextWords("未激活") : LanResManager.getLanCommonTextWords("已激活")) + "<br></font>" + "<font color=\'" + (tianGangZhengQiSta == 0 ? StaticValue.HUISE_HTML : StaticValue.ORANGE_HTML) + "\'>" + LanResManager.getLanCommonTextWords("攻击：14888、防御：10888、血量：68888、暴击：88、闪避：88") + "<br></font>" + "<font color=\'" + (tianGangZhengQiSta == 0 ? StaticValue.HUISE_HTML : StaticValue.RED_HTML) + "\'>" + LanResManager.getLanCommonTextWords("特殊属性：受到攻击时，有10%几率恢复满血状态（技能冻结时间10分钟）") + "</font>";
               _loc3_ += "</textformat>";
            }
            return _loc3_;
         });
         this.equipList = new EquipList();
         this.equipList.x = 20;
         this.equipList.y = 320;
         this.equipList.$parent = this;
         this.equipList.$parent2 = this.$parent;
         this.equipList.setClickSta(false,true);
         addChild(this.equipList);
         this.nbEquipCanvas = new NbEquipCanvas();
         this.nbEquipCanvas.x = 410;
         this.nbEquipCanvas.y = -60;
         this.nbEquipCanvas.$parent = this;
         this.nbEquipCanvas.$parent2 = this.$parent;
         this.nbEquipCanvas.setClickSta(false,true);
         addChild(this.nbEquipCanvas);
         this.imgShiZhuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
      }
      
      private function onCjjdClick(param1:TextEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(TargetAttribute.GET_OTHERPLAYER_CHENGJIUJINDU));
      }
      
      private function onShowLv(param1:MouseEvent = null) : void
      {
         if(GameInstance.mainCharData.attributeInfo.lv < 60)
         {
            if(this.zanwenValue.parent)
            {
               this.zanwenValue.parent.removeChild(this.zanwenValue);
            }
            return;
         }
         if(!this.zanwenValue.parent)
         {
            addChild(this.zanwenValue);
            this.zanwenValue.x = 242;
            TweenMax.to(this.zanwenValue,1,{"x":414});
         }
         else
         {
            TweenMax.to(this.zanwenValue,1,{
               "x":242,
               "onComplete":this.onCom
            });
         }
      }
      
      private function onCom() : void
      {
         if(this.zanwenValue.parent)
         {
            this.zanwenValue.parent.removeChild(this.zanwenValue);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.chatBtn:
               this.$parent.dispatchEvent(new BaseEvent(TargetAttribute.GET_OTHERPLAYER_PRIVATECHAT));
               break;
            case this.tradingBtn:
               this.$parent.dispatchEvent(new BaseEvent(TargetAttribute.GET_OTHERPLAYER_TRADING));
               break;
            case this.cheerBtn:
               this.$parent.dispatchEvent(new BaseEvent(TargetAttribute.GET_OTHERPLAYER_CHEER));
               break;
            case this.teamBtn:
               this.$parent.dispatchEvent(new BaseEvent(TargetAttribute.GET_OTHERPLAYER_TEAM));
               break;
            case this.adoreBtn:
               this.$parent.dispatchEvent(new BaseEvent(TargetAttribute.GET_OTHERPLAYER_ADORE));
               break;
            case this.despiseBtn:
               this.$parent.dispatchEvent(new BaseEvent(TargetAttribute.GET_OTHERPLAYER_DESPISE));
               break;
            case this.zhandouliBtn:
               this.$parent.dispatchEvent(new BaseEvent(TargetAttribute.GET_OTHERPLAYER_ZHANDOULI));
         }
      }
      
      private function onMouseTip5(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc10_:String = null;
         var _loc11_:int = 0;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.specialAttributeTitle.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip5);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = LanResManager.getLanCommonTextWords("攻击增强比例");
               _loc3_ = LanResManager.getLanCommonTextWords("伤害反弹比例");
               _loc4_ = LanResManager.getLanCommonTextWords("忽视防御比例");
               _loc5_ = LanResManager.getLanCommonTextWords("伤害减免比例");
               _loc6_ = LanResManager.getLanCommonTextWords("爆击伤害减免比例");
               _loc7_ = LanResManager.getLanCommonTextWords("暗器伤害减免比例");
               _loc8_ = LanResManager.getLanCommonTextWords("抵抗对方暗器几率");
               _loc9_ = LanResManager.getLanCommonTextWords("抵抗对方弓箭几率");
               _loc10_ = LanResManager.getLanCommonTextWords("抵抗丹田武学几率");
               _loc11_ = this.specialAttributeTitle.getCharIndexAtPoint(this.specialAttributeTitle.mouseX,this.specialAttributeTitle.mouseY);
               if(_loc11_ >= this.specialAttributeTitle.text.indexOf(_loc2_) && _loc11_ <= this.specialAttributeTitle.text.indexOf(_loc2_) + _loc2_.length - 1)
               {
                  this.showTip(LanResManager.getLanTextWords(OtherAttributeCanvas,"攻击增强比例提示",[StaticValue.RED_HTML,StaticValue.GREEN_STRONG_HTML,StaticValue.YELLOW_HTML]));
               }
               else if(_loc11_ >= this.specialAttributeTitle.text.indexOf(_loc3_) && _loc11_ <= this.specialAttributeTitle.text.indexOf(_loc3_) + _loc3_.length - 1)
               {
                  this.showTip(LanResManager.getLanTextWords(OtherAttributeCanvas,"伤害反弹比例提示1",[StaticValue.RED_HTML,StaticValue.GREEN_STRONG_HTML,StaticValue.YELLOW_HTML]));
               }
               else if(_loc11_ >= this.specialAttributeTitle.text.indexOf(_loc4_) && _loc11_ <= this.specialAttributeTitle.text.indexOf(_loc4_) + _loc4_.length - 1)
               {
                  this.showTip(LanResManager.getLanTextWords(OtherAttributeCanvas,"忽视防御比例提示",[StaticValue.RED_HTML,StaticValue.GREEN_STRONG_HTML,StaticValue.YELLOW_HTML]));
               }
               else if(_loc11_ >= this.specialAttributeTitle.text.indexOf(_loc5_) && _loc11_ <= this.specialAttributeTitle.text.indexOf(_loc5_) + _loc5_.length - 1)
               {
                  this.showTip(LanResManager.getLanTextWords(OtherAttributeCanvas,"伤害减免比例提示",[StaticValue.RED_HTML,StaticValue.GREEN_STRONG_HTML,StaticValue.YELLOW_HTML]));
               }
               else if(_loc11_ >= this.specialAttributeTitle.text.indexOf(_loc6_) && _loc11_ <= this.specialAttributeTitle.text.indexOf(_loc6_) + _loc6_.length - 1)
               {
                  this.showTip(LanResManager.getLanTextWords(OtherAttributeCanvas,"爆击伤害减免比例提示"));
               }
               else if(_loc11_ >= this.specialAttributeTitle.text.indexOf(_loc7_) && _loc11_ <= this.specialAttributeTitle.text.indexOf(_loc7_) + _loc7_.length - 1)
               {
                  this.showTip(LanResManager.getLanTextWords(OtherAttributeCanvas,"暗器伤害减免比例提示"));
               }
               else if(_loc11_ >= this.specialAttributeTitle.text.indexOf(_loc8_) && _loc11_ <= this.specialAttributeTitle.text.indexOf(_loc8_) + _loc8_.length - 1)
               {
                  this.showTip(LanResManager.getLanTextWords(OtherAttributeCanvas,"抵抗对方暗器几率提示"));
               }
               else if(_loc11_ >= this.specialAttributeTitle.text.indexOf(_loc9_) && _loc11_ <= this.specialAttributeTitle.text.indexOf(_loc9_) + _loc9_.length - 1)
               {
                  this.showTip(LanResManager.getLanTextWords(OtherAttributeCanvas,"抵抗对方弓箭几率提示"));
               }
               else if(_loc11_ >= this.specialAttributeTitle.text.indexOf(_loc10_) && _loc11_ <= this.specialAttributeTitle.text.indexOf(_loc10_) + _loc10_.length - 1)
               {
                  this.showTip(LanResManager.getLanTextWords(OtherAttributeCanvas,"抵抗丹田武学几率"));
               }
               else if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.specialAttributeTitle.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip5);
         }
      }
      
      private function onMouseTip6(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.skillValue.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip6);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = this.skillValue.getCharIndexAtPoint(this.skillValue.mouseX,this.skillValue.mouseY);
               _loc3_ = "";
               _loc3_ = LanResManager.getLanCommonTextWords("生命上限") + "：" + this._skillValue7.toString() + "<br>" + LanResManager.getLanCommonTextWords("内力上限") + "：" + this._skillValue8.toString() + "<br>" + LanResManager.getLanCommonTextWords("体力上限") + "：" + this._skillValue9.toString() + "<br>" + LanResManager.getLanCommonTextWords("攻　　击") + "：" + this._skillValue1.toString() + "<br>" + LanResManager.getLanCommonTextWords("防　　御") + "：" + this._skillValue2.toString() + "<br>" + LanResManager.getLanCommonTextWords("暴　　击") + "：" + this._skillValue3.toString() + "<br>" + LanResManager.getLanCommonTextWords("闪　　避") + "：" + this._skillValue4.toString() + "<br>" + LanResManager.getLanCommonTextWords("攻击速度") + "：" + this._skillValue5.toString() + "<br>" + LanResManager.getLanCommonTextWords("移动速度") + "：" + this._skillValue6.toString();
               this.showTip(_loc3_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.skillValue.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip6);
         }
      }
      
      public function setBaseAttribute(param1:String, param2:String, param3:Number, param4:Number, param5:int, param6:String, param7:String, param8:String, param9:Number, param10:int, param11:int, param12:int, param13:int) : void
      {
         if(this.arr1.length == 0)
         {
            this.arr1.push(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13);
         }
         else
         {
            this.arr1[0] = param1;
            this.arr1[1] = param2;
            this.arr1[2] = param3;
            this.arr1[3] = param4;
            this.arr1[4] = param5;
            this.arr1[5] = param6;
            this.arr1[6] = param7;
            this.arr1[7] = param8;
            this.arr1[8] = param9;
            this.arr1[9] = param10;
            this.arr1[10] = param11;
            this.arr1[11] = param12;
            this.arr1[12] = param13;
         }
         if(this.arr1[2] > 100000000000)
         {
            this.expBar.type = 3;
         }
         else if(this.arr1[2] > 200000000000)
         {
            this.expBar.type = 4;
         }
         this.expBar.setValue(this.arr1[2],this.arr1[3]);
         this.charName.htmlText = "<textformat leading=\'0\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + this.arr1[0] + "</font><br>" + this.arr1[5] + "</textformat>";
         this.level.htmlText = "<textformat leading=\'0\'>" + this.arr1[4] + "<br>" + this.arr1[7] + "</textformat>";
         this.party.htmlText = "<textformat leading=\'0\'>" + this.arr1[6] + "<br>" + this.arr1[9] + "</textformat>";
         this.zanwenValue.setShengWang(this.arr1[1],this.arr1[8],this.arr1[10],this.arr1[11],this.arr1[12]);
      }
      
      public function setShowItem(param1:Array, param2:Boolean) : void
      {
         /*
          * Decompilation error
          * Timeout (1 minute) was reached
          * Instruction count: 2068
          */
         throw new flash.errors.IllegalOperationError("Not decompiled due to timeout");
      }
      
      private function resizeXuanyuanjianYlzr() : void
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:DisplayObject = null;
         var _loc3_:DisplayObject = null;
         var _loc4_:DisplayObject = null;
         var _loc5_:DisplayObject = null;
         var _loc6_:DisplayObject = null;
         var _loc7_:DisplayObject = null;
         var _loc8_:DisplayObject = null;
         var _loc9_:DisplayObject = null;
         var _loc10_:DisplayObject = null;
         var _loc11_:DisplayObject = null;
         var _loc12_:DisplayObject = null;
         var _loc13_:DisplayObject = null;
         var _loc14_:DisplayObject = null;
         var _loc15_:DisplayObject = null;
         var _loc16_:DisplayObject = null;
         var _loc17_:DisplayObject = null;
         var _loc18_:DisplayObject = null;
         var _loc19_:DisplayObject = null;
         var _loc20_:DisplayObject = null;
         var _loc21_:DisplayObject = null;
         var _loc22_:DisplayObject = null;
         var _loc23_:DisplayObject = null;
         var _loc24_:DisplayObject = null;
         var _loc25_:DisplayObject = null;
         var _loc26_:DisplayObject = null;
         var _loc27_:DisplayObject = null;
         var _loc28_:DisplayObject = null;
         var _loc29_:DisplayObject = null;
         var _loc30_:DisplayObject = null;
         var _loc31_:DisplayObject = null;
         var _loc32_:DisplayObject = null;
         var _loc33_:DisplayObject = null;
         var _loc34_:DisplayObject = null;
         var _loc35_:DisplayObject = null;
         var _loc36_:DisplayObject = null;
         var _loc37_:DisplayObject = null;
         var _loc38_:DisplayObject = null;
         var _loc39_:DisplayObject = null;
         var _loc40_:DisplayObject = null;
         var _loc41_:DisplayObject = null;
         var _loc42_:DisplayObject = null;
         var _loc43_:DisplayObject = null;
         var _loc44_:DisplayObject = null;
         var _loc45_:DisplayObject = null;
         var _loc46_:DisplayObject = null;
         var _loc47_:DisplayObject = null;
         var _loc48_:DisplayObject = null;
         var _loc49_:DisplayObject = null;
         var _loc50_:DisplayObject = null;
         var _loc51_:DisplayObject = null;
         var _loc52_:DisplayObject = null;
         var _loc53_:DisplayObject = null;
         var _loc54_:DisplayObject = null;
         var _loc55_:DisplayObject = null;
         var _loc56_:DisplayObject = null;
         var _loc57_:DisplayObject = null;
         var _loc58_:DisplayObject = null;
         var _loc59_:DisplayObject = null;
         var _loc60_:DisplayObject = null;
         var _loc61_:DisplayObject = null;
         var _loc62_:DisplayObject = null;
         var _loc63_:DisplayObject = null;
         var _loc64_:DisplayObject = null;
         var _loc65_:DisplayObject = null;
         var _loc66_:DisplayObject = null;
         var _loc67_:DisplayObject = null;
         var _loc68_:DisplayObject = null;
         var _loc69_:DisplayObject = null;
         var _loc70_:DisplayObject = null;
         var _loc71_:DisplayObject = null;
         var _loc72_:DisplayObject = null;
         var _loc73_:DisplayObject = null;
         var _loc74_:DisplayObject = null;
         var _loc75_:DisplayObject = null;
         var _loc76_:DisplayObject = null;
         var _loc77_:DisplayObject = null;
         var _loc78_:DisplayObject = null;
         var _loc79_:DisplayObject = null;
         var _loc80_:DisplayObject = null;
         var _loc81_:DisplayObject = null;
         var _loc82_:DisplayObject = null;
         var _loc83_:DisplayObject = null;
         var _loc84_:DisplayObject = null;
         var _loc85_:DisplayObject = null;
         var _loc86_:DisplayObject = null;
         var _loc87_:DisplayObject = null;
         var _loc88_:DisplayObject = null;
         var _loc89_:DisplayObject = null;
         var _loc90_:DisplayObject = null;
         var _loc91_:DisplayObject = null;
         var _loc92_:DisplayObject = null;
         var _loc93_:DisplayObject = null;
         var _loc94_:DisplayObject = null;
         var _loc95_:DisplayObject = null;
         var _loc96_:DisplayObject = null;
         var _loc97_:DisplayObject = null;
         var _loc98_:DisplayObject = null;
         var _loc99_:DisplayObject = null;
         var _loc100_:DisplayObject = null;
         var _loc101_:DisplayObject = null;
         var _loc102_:DisplayObject = null;
         var _loc103_:DisplayObject = null;
         var _loc104_:DisplayObject = null;
         var _loc105_:DisplayObject = null;
         var _loc106_:DisplayObject = null;
         var _loc107_:DisplayObject = null;
         var _loc108_:DisplayObject = null;
         var _loc109_:DisplayObject = null;
         var _loc110_:DisplayObject = null;
         var _loc111_:DisplayObject = null;
         var _loc112_:DisplayObject = null;
         var _loc113_:DisplayObject = null;
         var _loc114_:DisplayObject = null;
         var _loc115_:DisplayObject = null;
         var _loc116_:DisplayObject = null;
         var _loc117_:DisplayObject = null;
         var _loc118_:DisplayObject = null;
         var _loc119_:DisplayObject = null;
         var _loc120_:DisplayObject = null;
         var _loc121_:DisplayObject = null;
         var _loc122_:DisplayObject = null;
         var _loc123_:DisplayObject = null;
         var _loc124_:DisplayObject = null;
         var _loc125_:DisplayObject = null;
         var _loc126_:DisplayObject = null;
         var _loc127_:DisplayObject = null;
         var _loc128_:DisplayObject = null;
         var _loc129_:DisplayObject = null;
         var _loc130_:DisplayObject = null;
         var _loc131_:DisplayObject = null;
         var _loc132_:DisplayObject = null;
         var _loc133_:DisplayObject = null;
         var _loc134_:DisplayObject = null;
         var _loc135_:DisplayObject = null;
         var _loc136_:DisplayObject = null;
         var _loc137_:DisplayObject = null;
         var _loc138_:DisplayObject = null;
         var _loc139_:DisplayObject = null;
         var _loc140_:DisplayObject = null;
         var _loc141_:DisplayObject = null;
         var _loc142_:DisplayObject = null;
         var _loc143_:DisplayObject = null;
         var _loc144_:DisplayObject = null;
         var _loc145_:DisplayObject = null;
         var _loc146_:DisplayObject = null;
         var _loc147_:DisplayObject = null;
         var _loc148_:DisplayObject = null;
         var _loc149_:DisplayObject = null;
         var _loc150_:DisplayObject = null;
         var _loc151_:DisplayObject = null;
         var _loc152_:DisplayObject = null;
         var _loc153_:DisplayObject = null;
         var _loc154_:DisplayObject = null;
         var _loc155_:DisplayObject = null;
         var _loc156_:DisplayObject = null;
         var _loc157_:DisplayObject = null;
         var _loc158_:DisplayObject = null;
         var _loc159_:DisplayObject = null;
         var _loc160_:DisplayObject = null;
         var _loc161_:DisplayObject = null;
         var _loc162_:DisplayObject = null;
         var _loc163_:DisplayObject = null;
         var _loc164_:DisplayObject = null;
         var _loc165_:DisplayObject = null;
         var _loc166_:DisplayObject = null;
         var _loc167_:DisplayObject = null;
         var _loc168_:DisplayObject = null;
         var _loc169_:DisplayObject = null;
         var _loc170_:DisplayObject = null;
         var _loc171_:DisplayObject = null;
         var _loc172_:DisplayObject = null;
         var _loc173_:DisplayObject = null;
         var _loc174_:DisplayObject = null;
         var _loc175_:DisplayObject = null;
         var _loc176_:DisplayObject = null;
         var _loc177_:DisplayObject = null;
         var _loc178_:DisplayObject = null;
         var _loc179_:DisplayObject = null;
         var _loc180_:DisplayObject = null;
         var _loc181_:DisplayObject = null;
         var _loc182_:DisplayObject = null;
         var _loc183_:DisplayObject = null;
         var _loc184_:DisplayObject = null;
         var _loc185_:DisplayObject = null;
         var _loc186_:DisplayObject = null;
         var _loc187_:DisplayObject = null;
         var _loc188_:DisplayObject = null;
         var _loc189_:DisplayObject = null;
         var _loc190_:DisplayObject = null;
         var _loc191_:DisplayObject = null;
         var _loc192_:DisplayObject = null;
         var _loc193_:DisplayObject = null;
         var _loc194_:DisplayObject = null;
         var _loc195_:DisplayObject = null;
         var _loc196_:DisplayObject = null;
         var _loc197_:DisplayObject = null;
         var _loc198_:DisplayObject = null;
         var _loc199_:DisplayObject = null;
         var _loc200_:int = 0;
         var _loc201_:int = 0;
         var _loc202_:int = 0;
         var _loc203_:Array = null;
         var _loc204_:int = 0;
         var _loc205_:int = 0;
         var _loc206_:DisplayObject = null;
         _loc1_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_SHENQI));
         _loc2_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_YLZR));
         _loc3_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_STDRJ));
         _loc4_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_AOJIAN));
         _loc5_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_GJMY));
         _loc6_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_LONGYA));
         _loc7_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_YAYUEDAO));
         _loc8_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_XUANTIEZHONGJIAN));
         _loc9_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_GUANGMINGZHANG));
         _loc10_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_HUIMIE));
         _loc11_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_ZHUMOZHANG));
         _loc12_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_CHIYAN));
         _loc13_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_TIANJING));
         _loc14_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_FENGTIANJI));
         _loc15_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_HUOLONGDAO));
         _loc16_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_POJUN));
         _loc17_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_DAGOUBANG));
         _loc8_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_XUANTIEZHONGJIAN));
         _loc18_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_XINGTIAN_GUOFU));
         _loc19_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_GUXING_GUOFU));
         _loc20_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_JINWUMINGGUANGTANG_GUOFU));
         _loc21_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_LIETIANBAWANGJI_GUOFU));
         _loc22_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_ZILINGHUANYUEJI_GUOFU));
         _loc23_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_WUYINGJIAN_GUOFU));
         _loc24_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_SHENGXIAOSHENQI));
         _loc25_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_HUOYUN_GUOFU));
         _loc26_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_TIANZHU));
         _loc27_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_PANGUKAITIANFU));
         _loc28_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_TIANDI));
         _loc29_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_HANQIBINGPO));
         _loc30_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_JIANZUNLONGQUANJIAN));
         _loc31_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_CHUANGSHI));
         _loc32_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_SUILIESHIFU));
         _loc33_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_MOYUAN));
         _loc34_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_CHENGJIECHANGJI));
         _loc35_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_TIANXIEJIAN));
         _loc36_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_JUNZIJIAN));
         _loc37_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_WANGZHEJIAN));
         _loc38_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_FENGBAODAO));
         _loc39_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_FENGYUN));
         _loc40_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_SHENGDAN2015));
         _loc41_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_FENGSHA));
         _loc42_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_FENGYIJIAN));
         _loc43_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_LEXINJI));
         _loc44_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_FENGYINGJIAN));
         _loc45_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_ZHENFENGJIAN));
         _loc46_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_FENGYUNJIAN));
         _loc47_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_BINGFENGJIAN));
         _loc48_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_HONGLEIZHANGU));
         _loc49_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_SANDENGGUFO));
         _loc50_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_FONUJI));
         _loc51_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_FENGYINJIAN));
         _loc52_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_TIANMAJIAN));
         _loc53_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_WUHUNJIAN));
         _loc54_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_ZHENTIANJIAN));
         _loc55_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_TIANXUE));
         _loc56_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_XIONGJIJIAN));
         _loc57_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_WUJINJIAN));
         _loc58_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_SHUNTIANJIAN));
         _loc59_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_WANGZHEQICANG));
         _loc60_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_BIXUEJIAN));
         _loc61_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_WUYIJIAN));
         _loc62_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_SHIJIANSHENQI));
         _loc63_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_QINGFENGJIAN));
         _loc64_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_HUOLINJIAN));
         _loc65_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_ZHUIHUNJI));
         _loc66_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_BIYUDAO));
         _loc67_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_WUWOZHANG));
         _loc68_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_YEHUOHONGLIAN));
         _loc69_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_MINGYUEDAO));
         _loc70_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_QINGFENGJIAN2));
         _loc71_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_ZHIZUNJIAN));
         _loc72_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_BAOLEIJI));
         _loc73_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_MINGSHENGZHANG));
         _loc74_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_ZUNSHIJIAN));
         _loc75_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_RENZHEZHANG));
         _loc76_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_ZHIZHEJIAN));
         _loc77_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_YANGMINGJIAN));
         _loc78_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_XIWANGJIAN));
         _loc79_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_XUEJINGJIAN));
         _loc80_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_XUANBINGJIAN));
         _loc81_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_PINGANJIAN));
         _loc82_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_QINGHUAJIAN));
         _loc83_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_YUXUJIAN));
         _loc84_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_YUQINGSHAN));
         _loc85_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_HUOMODAO));
         _loc86_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_YIHEJI));
         _loc87_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_ERHEJIAN));
         _loc88_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_SANHEDAO));
         _loc89_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_MIEHUSHAN));
         _loc90_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_QINGMINGDAO));
         _loc91_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_HUOXINGFU));
         _loc92_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_SHENZAO));
         _loc93_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_KAITIANGONG));
         _loc94_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_YANWENFENGMO));
         _loc95_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_LINGLONGZI));
         _loc96_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_SHASHENJIAN));
         _loc97_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_DUANQINGJI));
         _loc98_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_NULONG));
         _loc99_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_QINIAN));
         _loc100_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_ZHUXIAN));
         _loc101_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_HANBING));
         _loc102_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_POSHAN));
         _loc103_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_HAIYU));
         _loc104_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_TIANMINGDAO));
         _loc105_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_JINGTIANYIJI));
         _loc106_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_JINGLEIJUEDAO));
         _loc107_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_YINGXIONGJIAN));
         _loc108_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_CHANGSHENGJIAN));
         _loc109_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_GUIYINGGONG));
         _loc110_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_JINGLEIZHANG));
         _loc111_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_HUNDUN));
         _loc112_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_DINGHUN));
         _loc113_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_WUJI));
         _loc114_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_HUOXINGJIAN));
         _loc115_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_WANGZHEFU));
         _loc116_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_DUOMINGDAO));
         _loc117_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_XIAOSHEN));
         _loc118_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_WANSHI));
         _loc119_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_ZHONGQIU));
         _loc120_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_SHENJIAN));
         _loc121_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_YUHUAZHANG));
         _loc122_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_BANIANGONG));
         _loc123_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_BANIANJIAN));
         _loc124_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_BANIANJI));
         _loc125_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2019SHENDAN));
         _loc126_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2019GENGZI));
         _loc127_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2019FEIHUA));
         _loc128_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2019XIONGWANG));
         _loc129_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020XUEHUAN));
         _loc130_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BADAO));
         _loc131_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN01));
         _loc132_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN02));
         _loc133_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN03));
         _loc134_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN04));
         _loc135_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN05));
         _loc136_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN06));
         _loc137_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN07));
         _loc138_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN08));
         _loc139_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN09));
         _loc140_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN10));
         _loc141_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN11));
         _loc142_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN12));
         _loc143_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN13));
         _loc144_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN14));
         _loc145_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN15));
         _loc146_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN16));
         _loc147_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN17));
         _loc148_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN18));
         _loc149_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN19));
         _loc150_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN20));
         _loc151_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN21));
         _loc152_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN22));
         _loc153_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN23));
         _loc154_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN24));
         _loc155_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN25));
         _loc156_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN26));
         _loc157_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN27));
         _loc158_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN28));
         _loc159_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN29));
         _loc160_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN30));
         _loc161_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN31));
         _loc162_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN32));
         _loc163_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN33));
         _loc164_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN34));
         _loc165_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN35));
         _loc166_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN36));
         _loc167_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN37));
         _loc168_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN38));
         _loc169_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN39));
         _loc170_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN40));
         _loc171_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN41));
         _loc172_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN42));
         _loc173_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN43));
         _loc174_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN44));
         _loc175_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN45));
         _loc176_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN46));
         _loc177_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN47));
         _loc178_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN48));
         _loc179_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN49));
         _loc180_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN50));
         _loc181_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN51));
         _loc182_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN52));
         _loc183_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN53));
         _loc184_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN54));
         _loc185_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN55));
         _loc186_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN56));
         _loc187_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN57));
         _loc188_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN58));
         _loc189_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN59));
         _loc190_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN60));
         _loc191_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN61));
         _loc192_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN62));
         _loc193_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN63));
         _loc194_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN64));
         _loc195_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN65));
         _loc196_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN66));
         _loc197_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN67));
         _loc198_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN68));
         _loc199_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_2020BAOJIAN69));
         _loc200_ = 36;
         _loc201_ = 0;
         _loc202_ = 0;
         _loc203_ = [];
         _loc204_ = 0;
         while(_loc204_ < ItemPositionRange.POSITION_NB_WEAPON_ARR.length)
         {
            _loc206_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_NB_WEAPON_ARR[_loc204_]));
            if(_loc206_)
            {
               _loc203_.push(_loc206_);
            }
            _loc204_++;
         }
         _loc205_ = 0;
         while(_loc205_ < _loc203_.length)
         {
            if(_loc203_[_loc205_])
            {
               if(_loc201_ > 5)
               {
                  _loc203_[_loc205_].x = 272 - 226 + 36;
                  _loc203_[_loc205_].y = 211 - 6 - _loc200_ * _loc202_ - 36;
                  _loc202_++;
               }
               else
               {
                  _loc203_[_loc205_].x = 272 - 226;
                  _loc203_[_loc205_].y = 211 - 6 - _loc200_ * _loc201_;
                  _loc201_++;
               }
            }
            _loc205_++;
         }
         if(_loc1_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc1_.x = 60 - 13 + 36;
               _loc1_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc1_.x = 60 - 13;
               _loc1_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc2_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc2_.x = 60 - 13 + 36;
               _loc2_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc2_.x = 60 - 13;
               _loc2_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc3_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc3_.x = 60 - 13 + 36;
               _loc3_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc3_.x = 60 - 13;
               _loc3_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc4_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc4_.x = 60 - 13 + 36;
               _loc4_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc4_.x = 60 - 13;
               _loc4_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc5_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc5_.x = 60 - 13 + 36;
               _loc5_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc5_.x = 60 - 13;
               _loc5_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc6_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc6_.x = 272 - 226 + 36;
               _loc6_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc6_.x = 272 - 226;
               _loc6_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc16_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc16_.x = 60 - 13 + 36;
               _loc16_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc16_.x = 60 - 13;
               _loc16_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc17_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc17_.x = 60 - 13 + 36;
               _loc17_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc17_.x = 60 - 13;
               _loc17_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc7_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc7_.x = 272 - 226 + 36;
               _loc7_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc7_.x = 272 - 226;
               _loc7_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc8_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc8_.x = 60 - 13 + 36;
               _loc8_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc8_.x = 60 - 13;
               _loc8_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc18_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc18_.x = 60 - 13 + 36;
               _loc18_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc18_.x = 60 - 13;
               _loc18_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc19_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc19_.x = 60 - 13 + 36;
               _loc19_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc19_.x = 60 - 13;
               _loc19_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc20_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc20_.x = 60 - 13 + 36;
               _loc20_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc20_.x = 60 - 13;
               _loc20_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc21_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc21_.x = 60 - 13 + 36;
               _loc21_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc21_.x = 60 - 13;
               _loc21_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc9_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc9_.x = 272 - 226 + 36;
               _loc9_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc9_.x = 272 - 226;
               _loc9_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc22_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc22_.x = 60 - 13 + 36;
               _loc22_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc22_.x = 60 - 13;
               _loc22_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc23_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc23_.x = 60 - 13 + 36;
               _loc23_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc23_.x = 60 - 13;
               _loc23_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc12_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc12_.x = 60 - 13 + 36;
               _loc12_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc12_.x = 60 - 13;
               _loc12_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc24_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc24_.x = 60 - 13 + 36;
               _loc24_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc24_.x = 60 - 13;
               _loc24_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc10_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc10_.x = 272 - 226 + 36;
               _loc10_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc10_.x = 272 - 226;
               _loc10_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc13_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc13_.x = 60 - 13 + 36;
               _loc13_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc13_.x = 60 - 13;
               _loc13_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc11_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc11_.x = 272 - 226 + 36;
               _loc11_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc11_.x = 272 - 226;
               _loc11_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc12_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc12_.x = 272 - 226 + 36;
               _loc12_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc12_.x = 272 - 226;
               _loc12_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc13_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc13_.x = 272 - 226 + 36;
               _loc13_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc13_.x = 272 - 226;
               _loc13_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc14_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc14_.x = 272 - 226 + 36;
               _loc14_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc14_.x = 272 - 226;
               _loc14_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc15_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc15_.x = 272 - 226 + 36;
               _loc15_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc15_.x = 272 - 226;
               _loc15_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc26_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc26_.x = 272 - 226 + 36;
               _loc26_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc26_.x = 272 - 226;
               _loc26_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc27_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc27_.x = 272 - 226 + 36;
               _loc27_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc27_.x = 272 - 226;
               _loc27_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc28_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc28_.x = 272 - 226 + 36;
               _loc28_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc28_.x = 272 - 226;
               _loc28_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc29_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc29_.x = 272 - 226 + 36;
               _loc29_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc29_.x = 272 - 226;
               _loc29_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc30_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc30_.x = 272 - 226 + 36;
               _loc30_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc30_.x = 272 - 226;
               _loc30_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc31_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc31_.x = 272 - 226 + 36;
               _loc31_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc31_.x = 272 - 226;
               _loc31_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc32_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc32_.x = 272 - 226 + 36;
               _loc32_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc32_.x = 272 - 226;
               _loc32_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc33_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc33_.x = 272 - 226 + 36;
               _loc33_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc33_.x = 272 - 226;
               _loc33_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc34_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc34_.x = 272 - 226 + 36;
               _loc34_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc34_.x = 272 - 226;
               _loc34_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc35_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc35_.x = 272 - 226 + 36;
               _loc35_.y = 211 - 6 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc35_.x = 272 - 226;
               _loc35_.y = 211 - 6 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc25_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc25_.x = 60 - 13 + 36;
               _loc25_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc25_.x = 60 - 13;
               _loc25_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc36_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc36_.x = 60 - 13 + 36;
               _loc36_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc36_.x = 60 - 13;
               _loc36_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc37_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc37_.x = 60 - 13 + 36;
               _loc37_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc37_.x = 60 - 13;
               _loc37_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc38_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc38_.x = 60 - 13 + 36;
               _loc38_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc38_.x = 60 - 13;
               _loc38_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc39_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc39_.x = 60 - 13 + 36;
               _loc39_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc39_.x = 60 - 13;
               _loc39_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc40_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc40_.x = 60 - 13 + 36;
               _loc40_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc40_.x = 60 - 13;
               _loc40_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc41_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc41_.x = 60 - 13 + 36;
               _loc41_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc41_.x = 60 - 13;
               _loc41_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc42_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc42_.x = 60 - 13 + 36;
               _loc42_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc42_.x = 60 - 13;
               _loc42_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc43_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc43_.x = 60 - 13 + 36;
               _loc43_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc43_.x = 60 - 13;
               _loc43_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc44_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc44_.x = 60 - 13 + 36;
               _loc44_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc44_.x = 60 - 13;
               _loc44_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc45_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc45_.x = 60 - 13 + 36;
               _loc45_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc45_.x = 60 - 13;
               _loc45_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc46_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc46_.x = 60 - 13 + 36;
               _loc46_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc46_.x = 60 - 13;
               _loc46_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc47_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc47_.x = 60 - 13 + 36;
               _loc47_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc47_.x = 60 - 13;
               _loc47_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc48_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc48_.x = 60 - 13 + 36;
               _loc48_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc48_.x = 60 - 13;
               _loc48_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc49_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc49_.x = 60 - 13 + 36;
               _loc49_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc49_.x = 60 - 13;
               _loc49_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc50_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc50_.x = 60 - 13 + 36;
               _loc50_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc50_.x = 60 - 13;
               _loc50_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc51_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc51_.x = 60 - 13 + 36;
               _loc51_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc51_.x = 60 - 13;
               _loc51_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc52_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc52_.x = 60 - 13 + 36;
               _loc52_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc52_.x = 60 - 13;
               _loc52_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc53_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc53_.x = 60 - 13 + 36;
               _loc53_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc53_.x = 60 - 13;
               _loc53_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc54_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc54_.x = 60 - 13 + 36;
               _loc54_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc54_.x = 60 - 13;
               _loc54_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc55_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc55_.x = 60 - 13 + 36;
               _loc55_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc55_.x = 60 - 13;
               _loc55_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc56_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc56_.x = 60 - 13 + 36;
               _loc56_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc56_.x = 60 - 13;
               _loc56_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc57_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc57_.x = 60 - 13 + 36;
               _loc57_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc57_.x = 60 - 13;
               _loc57_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc58_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc58_.x = 60 - 13 + 36;
               _loc58_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc58_.x = 60 - 13;
               _loc58_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc59_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc59_.x = 60 - 13 + 36;
               _loc59_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc59_.x = 60 - 13;
               _loc59_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc60_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc60_.x = 60 - 13 + 36;
               _loc60_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc60_.x = 60 - 13;
               _loc60_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc61_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc61_.x = 60 - 13 + 36;
               _loc61_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc61_.x = 60 - 13;
               _loc61_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc62_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc62_.x = 60 - 13 + 36;
               _loc62_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc62_.x = 60 - 13;
               _loc62_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc63_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc63_.x = 60 - 13 + 36;
               _loc63_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc63_.x = 60 - 13;
               _loc63_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc64_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc64_.x = 60 - 13 + 36;
               _loc64_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc64_.x = 60 - 13;
               _loc64_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc65_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc65_.x = 60 - 13 + 36;
               _loc65_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc65_.x = 60 - 13;
               _loc65_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc66_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc66_.x = 60 - 13 + 36;
               _loc66_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc66_.x = 60 - 13;
               _loc66_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc67_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc67_.x = 60 - 13 + 36;
               _loc67_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc67_.x = 60 - 13;
               _loc67_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc68_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc68_.x = 60 - 13 + 36;
               _loc68_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc68_.x = 60 - 13;
               _loc68_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc69_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc69_.x = 60 - 13 + 36;
               _loc69_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc69_.x = 60 - 13;
               _loc69_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc70_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc70_.x = 60 - 13 + 36;
               _loc70_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc70_.x = 60 - 13;
               _loc70_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc71_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc71_.x = 60 - 13 + 36;
               _loc71_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc71_.x = 60 - 13;
               _loc71_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc72_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc72_.x = 60 - 13 + 36;
               _loc72_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc72_.x = 60 - 13;
               _loc72_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc73_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc73_.x = 60 - 13 + 36;
               _loc73_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc73_.x = 60 - 13;
               _loc73_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc74_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc74_.x = 60 - 13 + 36;
               _loc74_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc74_.x = 60 - 13;
               _loc74_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc75_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc75_.x = 60 - 13 + 36;
               _loc75_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc75_.x = 60 - 13;
               _loc75_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc76_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc76_.x = 60 - 13 + 36;
               _loc76_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc76_.x = 60 - 13;
               _loc76_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc77_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc77_.x = 60 - 13 + 36;
               _loc77_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc77_.x = 60 - 13;
               _loc77_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc78_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc78_.x = 60 - 13 + 36;
               _loc78_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc78_.x = 60 - 13;
               _loc78_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc79_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc79_.x = 60 - 13 + 36;
               _loc79_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc79_.x = 60 - 13;
               _loc79_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc80_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc80_.x = 60 - 13 + 36;
               _loc80_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc80_.x = 60 - 13;
               _loc80_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc81_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc81_.x = 60 - 13 + 36;
               _loc81_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc81_.x = 60 - 13;
               _loc81_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc82_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc82_.x = 60 - 13 + 36;
               _loc82_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc82_.x = 60 - 13;
               _loc82_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc83_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc83_.x = 60 - 13 + 36;
               _loc83_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc83_.x = 60 - 13;
               _loc83_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc84_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc84_.x = 60 - 13 + 36;
               _loc84_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc84_.x = 60 - 13;
               _loc84_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc85_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc85_.x = 60 - 13 + 36;
               _loc85_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc85_.x = 60 - 13;
               _loc85_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc86_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc86_.x = 60 - 13 + 36;
               _loc86_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc86_.x = 60 - 13;
               _loc86_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc87_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc87_.x = 60 - 13 + 36;
               _loc87_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc87_.x = 60 - 13;
               _loc87_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc88_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc88_.x = 60 - 13 + 36;
               _loc88_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc88_.x = 60 - 13;
               _loc88_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc89_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc89_.x = 60 - 13 + 36;
               _loc89_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc89_.x = 60 - 13;
               _loc89_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc90_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc90_.x = 60 - 13 + 36;
               _loc90_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc90_.x = 60 - 13;
               _loc90_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc91_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc91_.x = 60 - 13 + 36;
               _loc91_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc91_.x = 60 - 13;
               _loc91_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc92_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc92_.x = 60 - 13 + 36;
               _loc92_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc92_.x = 60 - 13;
               _loc92_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc93_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc93_.x = 60 - 13 + 36;
               _loc93_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc93_.x = 60 - 13;
               _loc93_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc94_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc94_.x = 60 - 13 + 36;
               _loc94_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc94_.x = 60 - 13;
               _loc94_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc95_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc95_.x = 60 - 13 + 36;
               _loc95_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc95_.x = 60 - 13;
               _loc95_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc96_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc96_.x = 60 - 13 + 36;
               _loc96_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc96_.x = 60 - 13;
               _loc96_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc121_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc121_.x = 60 - 13 + 36;
               _loc121_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc121_.x = 60 - 13;
               _loc121_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc122_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc122_.x = 60 - 13 + 36;
               _loc122_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc122_.x = 60 - 13;
               _loc122_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc123_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc123_.x = 60 - 13 + 36;
               _loc123_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc123_.x = 60 - 13;
               _loc123_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc124_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc124_.x = 60 - 13 + 36;
               _loc124_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc124_.x = 60 - 13;
               _loc124_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc125_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc125_.x = 60 - 13 + 36;
               _loc125_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc125_.x = 60 - 13;
               _loc125_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc126_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc126_.x = 60 - 13 + 36;
               _loc126_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc126_.x = 60 - 13;
               _loc126_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc127_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc127_.x = 60 - 13 + 36;
               _loc127_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc127_.x = 60 - 13;
               _loc127_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc128_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc128_.x = 60 - 13 + 36;
               _loc128_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc128_.x = 60 - 13;
               _loc128_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc129_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc129_.x = 60 - 13 + 36;
               _loc129_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc129_.x = 60 - 13;
               _loc129_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc130_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc130_.x = 60 - 13 + 36;
               _loc130_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc130_.x = 60 - 13;
               _loc130_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc131_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc131_.x = 60 - 13 + 36;
               _loc131_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc131_.x = 60 - 13;
               _loc131_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc132_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc132_.x = 60 - 13 + 36;
               _loc132_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc132_.x = 60 - 13;
               _loc132_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc133_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc133_.x = 60 - 13 + 36;
               _loc133_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc133_.x = 60 - 13;
               _loc133_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc134_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc134_.x = 60 - 13 + 36;
               _loc134_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc134_.x = 60 - 13;
               _loc134_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc135_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc135_.x = 60 - 13 + 36;
               _loc135_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc135_.x = 60 - 13;
               _loc135_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc136_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc136_.x = 60 - 13 + 36;
               _loc136_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc136_.x = 60 - 13;
               _loc136_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc137_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc137_.x = 60 - 13 + 36;
               _loc137_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc137_.x = 60 - 13;
               _loc137_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc138_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc138_.x = 60 - 13 + 36;
               _loc138_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc138_.x = 60 - 13;
               _loc138_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc139_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc139_.x = 60 - 13 + 36;
               _loc139_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc139_.x = 60 - 13;
               _loc139_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc140_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc140_.x = 60 - 13 + 36;
               _loc140_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc140_.x = 60 - 13;
               _loc140_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc141_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc141_.x = 60 - 13 + 36;
               _loc141_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc141_.x = 60 - 13;
               _loc141_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc142_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc142_.x = 60 - 13 + 36;
               _loc142_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc142_.x = 60 - 13;
               _loc142_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc143_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc143_.x = 60 - 13 + 36;
               _loc143_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc143_.x = 60 - 13;
               _loc143_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc144_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc144_.x = 60 - 13 + 36;
               _loc144_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc144_.x = 60 - 13;
               _loc144_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc145_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc145_.x = 60 - 13 + 36;
               _loc145_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc145_.x = 60 - 13;
               _loc145_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc146_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc146_.x = 60 - 13 + 36;
               _loc146_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc146_.x = 60 - 13;
               _loc146_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc147_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc147_.x = 60 - 13 + 36;
               _loc147_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc147_.x = 60 - 13;
               _loc147_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc148_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc148_.x = 60 - 13 + 36;
               _loc148_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc148_.x = 60 - 13;
               _loc148_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc149_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc149_.x = 60 - 13 + 36;
               _loc149_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc149_.x = 60 - 13;
               _loc149_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc150_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc150_.x = 60 - 13 + 36;
               _loc150_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc150_.x = 60 - 13;
               _loc150_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc151_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc151_.x = 60 - 13 + 36;
               _loc151_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc151_.x = 60 - 13;
               _loc151_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc152_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc152_.x = 60 - 13 + 36;
               _loc152_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc152_.x = 60 - 13;
               _loc152_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc153_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc153_.x = 60 - 13 + 36;
               _loc153_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc153_.x = 60 - 13;
               _loc153_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc154_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc154_.x = 60 - 13 + 36;
               _loc154_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc154_.x = 60 - 13;
               _loc154_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc155_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc155_.x = 60 - 13 + 36;
               _loc155_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc155_.x = 60 - 13;
               _loc155_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc156_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc156_.x = 60 - 13 + 36;
               _loc156_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc156_.x = 60 - 13;
               _loc156_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc157_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc157_.x = 60 - 13 + 36;
               _loc157_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc157_.x = 60 - 13;
               _loc157_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc158_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc158_.x = 60 - 13 + 36;
               _loc158_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc158_.x = 60 - 13;
               _loc158_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc159_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc159_.x = 60 - 13 + 36;
               _loc159_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc159_.x = 60 - 13;
               _loc159_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc160_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc160_.x = 60 - 13 + 36;
               _loc160_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc160_.x = 60 - 13;
               _loc160_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc161_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc161_.x = 60 - 13 + 36;
               _loc161_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc161_.x = 60 - 13;
               _loc161_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc162_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc162_.x = 60 - 13 + 36;
               _loc162_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc162_.x = 60 - 13;
               _loc162_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc163_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc163_.x = 60 - 13 + 36;
               _loc163_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc163_.x = 60 - 13;
               _loc163_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc164_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc164_.x = 60 - 13 + 36;
               _loc164_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc164_.x = 60 - 13;
               _loc164_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc165_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc165_.x = 60 - 13 + 36;
               _loc165_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc165_.x = 60 - 13;
               _loc165_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc166_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc166_.x = 60 - 13 + 36;
               _loc166_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc166_.x = 60 - 13;
               _loc166_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc167_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc167_.x = 60 - 13 + 36;
               _loc167_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc167_.x = 60 - 13;
               _loc167_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc168_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc168_.x = 60 - 13 + 36;
               _loc168_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc168_.x = 60 - 13;
               _loc168_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc169_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc169_.x = 60 - 13 + 36;
               _loc169_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc169_.x = 60 - 13;
               _loc169_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc170_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc170_.x = 60 - 13 + 36;
               _loc170_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc170_.x = 60 - 13;
               _loc170_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc171_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc171_.x = 60 - 13 + 36;
               _loc171_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc171_.x = 60 - 13;
               _loc171_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc172_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc172_.x = 60 - 13 + 36;
               _loc172_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc172_.x = 60 - 13;
               _loc172_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc173_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc173_.x = 60 - 13 + 36;
               _loc173_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc173_.x = 60 - 13;
               _loc173_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc174_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc174_.x = 60 - 13 + 36;
               _loc174_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc174_.x = 60 - 13;
               _loc174_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc175_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc175_.x = 60 - 13 + 36;
               _loc175_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc175_.x = 60 - 13;
               _loc175_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc176_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc176_.x = 60 - 13 + 36;
               _loc176_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc176_.x = 60 - 13;
               _loc176_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc177_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc177_.x = 60 - 13 + 36;
               _loc177_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc177_.x = 60 - 13;
               _loc177_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc178_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc178_.x = 60 - 13 + 36;
               _loc178_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc178_.x = 60 - 13;
               _loc178_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc179_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc179_.x = 60 - 13 + 36;
               _loc179_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc179_.x = 60 - 13;
               _loc179_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc180_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc180_.x = 60 - 13 + 36;
               _loc180_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc180_.x = 60 - 13;
               _loc180_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc181_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc181_.x = 60 - 13 + 36;
               _loc181_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc181_.x = 60 - 13;
               _loc181_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc182_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc182_.x = 60 - 13 + 36;
               _loc182_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc182_.x = 60 - 13;
               _loc182_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc183_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc183_.x = 60 - 13 + 36;
               _loc183_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc183_.x = 60 - 13;
               _loc183_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc184_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc184_.x = 60 - 13 + 36;
               _loc184_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc184_.x = 60 - 13;
               _loc184_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc185_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc185_.x = 60 - 13 + 36;
               _loc185_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc185_.x = 60 - 13;
               _loc185_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc186_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc186_.x = 60 - 13 + 36;
               _loc186_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc186_.x = 60 - 13;
               _loc186_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc187_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc187_.x = 60 - 13 + 36;
               _loc187_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc187_.x = 60 - 13;
               _loc187_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc188_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc188_.x = 60 - 13 + 36;
               _loc188_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc188_.x = 60 - 13;
               _loc188_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc189_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc189_.x = 60 - 13 + 36;
               _loc189_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc189_.x = 60 - 13;
               _loc189_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc190_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc190_.x = 60 - 13 + 36;
               _loc190_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc190_.x = 60 - 13;
               _loc190_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc191_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc191_.x = 60 - 13 + 36;
               _loc191_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc191_.x = 60 - 13;
               _loc191_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc192_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc192_.x = 60 - 13 + 36;
               _loc192_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc192_.x = 60 - 13;
               _loc192_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc193_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc193_.x = 60 - 13 + 36;
               _loc193_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc193_.x = 60 - 13;
               _loc193_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc194_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc194_.x = 60 - 13 + 36;
               _loc194_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc194_.x = 60 - 13;
               _loc194_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc195_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc195_.x = 60 - 13 + 36;
               _loc195_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc195_.x = 60 - 13;
               _loc195_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc196_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc196_.x = 60 - 13 + 36;
               _loc196_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc196_.x = 60 - 13;
               _loc196_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc197_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc197_.x = 60 - 13 + 36;
               _loc197_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc197_.x = 60 - 13;
               _loc197_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc198_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc198_.x = 60 - 13 + 36;
               _loc198_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc198_.x = 60 - 13;
               _loc198_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc199_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc199_.x = 60 - 13 + 36;
               _loc199_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc199_.x = 60 - 13;
               _loc199_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc97_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc97_.x = 60 - 13 + 36;
               _loc97_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc97_.x = 60 - 13;
               _loc97_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc98_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc98_.x = 60 - 13 + 36;
               _loc98_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc98_.x = 60 - 13;
               _loc98_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc99_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc99_.x = 60 - 13 + 36;
               _loc99_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc99_.x = 60 - 13;
               _loc99_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc100_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc100_.x = 60 - 13 + 36;
               _loc100_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc100_.x = 60 - 13;
               _loc100_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc101_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc101_.x = 60 - 13 + 36;
               _loc101_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc101_.x = 60 - 13;
               _loc101_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc102_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc102_.x = 60 - 13 + 36;
               _loc102_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc102_.x = 60 - 13;
               _loc102_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc103_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc103_.x = 60 - 13 + 36;
               _loc103_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc103_.x = 60 - 13;
               _loc103_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc104_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc104_.x = 60 - 13 + 36;
               _loc104_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc104_.x = 60 - 13;
               _loc104_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc105_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc105_.x = 60 - 13 + 36;
               _loc105_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc105_.x = 60 - 13;
               _loc105_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc106_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc106_.x = 60 - 13 + 36;
               _loc106_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc106_.x = 60 - 13;
               _loc106_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc107_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc107_.x = 60 - 13 + 36;
               _loc107_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc107_.x = 60 - 13;
               _loc107_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc108_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc108_.x = 60 - 13 + 36;
               _loc108_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc108_.x = 60 - 13;
               _loc108_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc109_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc109_.x = 60 - 13 + 36;
               _loc109_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc109_.x = 60 - 13;
               _loc109_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc110_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc110_.x = 60 - 13 + 36;
               _loc110_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc110_.x = 60 - 13;
               _loc110_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc111_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc111_.x = 60 - 13 + 36;
               _loc111_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc111_.x = 60 - 13;
               _loc111_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc112_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc112_.x = 60 - 13 + 36;
               _loc112_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc112_.x = 60 - 13;
               _loc112_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc113_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc113_.x = 60 - 13 + 36;
               _loc113_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc113_.x = 60 - 13;
               _loc113_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc114_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc114_.x = 60 - 13 + 36;
               _loc114_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc114_.x = 60 - 13;
               _loc114_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc115_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc115_.x = 60 - 13 + 36;
               _loc115_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc115_.x = 60 - 13;
               _loc115_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc116_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc116_.x = 60 - 13 + 36;
               _loc116_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc116_.x = 60 - 13;
               _loc116_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc117_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc117_.x = 60 - 13 + 36;
               _loc117_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc117_.x = 60 - 13;
               _loc117_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc118_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc118_.x = 60 - 13 + 36;
               _loc118_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc118_.x = 60 - 13;
               _loc118_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc119_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc119_.x = 60 - 13 + 36;
               _loc119_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc119_.x = 60 - 13;
               _loc119_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
         if(_loc120_ != null)
         {
            if(_loc201_ > 5)
            {
               _loc120_.x = 60 - 13 + 36;
               _loc120_.y = 271 - 66 - _loc200_ * _loc202_ - 36;
               _loc202_++;
            }
            else
            {
               _loc120_.x = 60 - 13;
               _loc120_.y = 271 - 66 - _loc200_ * _loc201_;
               _loc201_++;
            }
         }
      }
      
      public function setHPMP(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         this.hpBar.setValue(Math.floor(param1),Math.floor(param2));
         this.mpBar.setValue(Math.floor(param3),Math.floor(param4));
         this.nqBar.setValue(Math.floor(param5),Math.floor(param6));
      }
      
      public function setSkillValue(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number) : void
      {
         this._skillValue1 = param1;
         this._skillValue2 = param2;
         this._skillValue3 = param3;
         this._skillValue4 = param4;
         this._skillValue5 = param5;
         this._skillValue6 = param6;
         this._skillValue7 = param7;
         this._skillValue8 = param8;
         this._skillValue9 = param9;
         this.mpMax = param7;
         this.hpMax = param8;
         this.npMax = param9;
         if(param1 > 99999999)
         {
            this._skillValue1TT = int(param1 / 100000000) + "TT";
         }
         else
         {
            this._skillValue1TT = param1 + "";
         }
         if(param2 > 99999999)
         {
            this._skillValue2TT = int(param2 / 100000000) + "TT";
         }
         else
         {
            this._skillValue2TT = param2 + "";
         }
         if(param3 > 99999999)
         {
            this._skillValue3TT = int(param3 / 100000000) + "TT";
         }
         else
         {
            this._skillValue3TT = param3 + "";
         }
         if(param4 > 99999999)
         {
            this._skillValue4TT = int(param4 / 100000000) + "TT";
         }
         else
         {
            this._skillValue4TT = param4 + "";
         }
         if(param5 > 99999999)
         {
            this._skillValue5TT = int(param5 / 100000000) + "TT";
         }
         else
         {
            this._skillValue5TT = param5 + "";
         }
         if(param6 > 99999999)
         {
            this._skillValue6TT = int(param6 / 100000000) + "TT";
         }
         else
         {
            this._skillValue6TT = param6 + "";
         }
         if(param7 > 99999999)
         {
            this._skillValue7TT = int(param7 / 100000000) + "TT";
         }
         else
         {
            this._skillValue7TT = param7 + "";
         }
         if(param8 > 99999999)
         {
            this._skillValue8TT = int(param8 / 100000000) + "TT";
         }
         else
         {
            this._skillValue8TT = param8 + "";
         }
         if(param9 > 99999999)
         {
            this._skillValue9TT = int(param9 / 100000000) + "TT";
         }
         else
         {
            this._skillValue9TT = param9 + "";
         }
         if(this.isDizi)
         {
            this.skillValue.htmlText = "<textformat leading=\'6\'>" + (param1 > 100000000 ? (param1 / 100000000).toFixed(2) + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("亿") + "</font>" : param1) + "<br>" + (param2 > 100000000 ? (param2 / 100000000).toFixed(2) + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("亿") + "</font>" : param2) + "<br>" + (param3 > 100000000 ? (param3 / 100000000).toFixed(2) + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("亿") + "</font>" : param3) + "<br>" + (param4 > 100000000 ? (param4 / 100000000).toFixed(2) + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("亿") + "</font>" : param4) + "<br><font color=\'" + StaticValue.GREEN_HTML + "\'>" + (param5 > 100000000 ? (param5 / 100000000).toFixed(2) + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("亿") + "</font>" : param5) + "<br>" + (param6 > 100000000 ? (param6 / 100000000)
            .toFixed(2) + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("亿") + "</font>" : param6) + "</font></textformat>";
         }
         else
         {
            this.skillValue.htmlText = "<textformat leading=\'5\'>" + this._skillValue7TT + "<br>" + this._skillValue8TT + "<br>" + this._skillValue9TT + "<br>" + this._skillValue1TT + "<br>" + this._skillValue2TT + "<br>" + this._skillValue3TT + "<br>" + this._skillValue4TT + "<br><font color=\'" + StaticValue.GREEN_HTML + "\'>" + this._skillValue5TT + "<br>" + this._skillValue6TT + "</font></textformat>";
         }
      }
      
      public function setSkillSchedule(param1:Number, param2:Number) : void
      {
         this.colorBar1.setValue(param1,param2);
      }
      
      public function setVenation(param1:int, param2:int) : void
      {
         this.colorBar2.setValue(param1,param2);
      }
      
      public function setAccomplishment(param1:int, param2:int) : void
      {
         this.colorBar3.setValue(param1,param2);
      }
      
      public function setRoushenjingjie(param1:int, param2:int, param3:int) : void
      {
         this.colorBar4.setValue(param2,param3);
         this.colorBar4Ft.htmlText = "（" + param1 + "J）" + param2 + "/" + param3;
      }
      
      public function setZhenQi(param1:int, param2:int) : void
      {
         this.zhenqiBar.setValue(param1,param2);
      }
      
      public function set avatar(param1:BitmapData) : void
      {
         this._avatar.bitmapData = param1;
         this._avatar.x = 115 - this._avatar.width / 2;
         this._avatar.y = 240 - this._avatar.height + 20;
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
               addChildAt(flag,1);
               flag.x = 80 - flag.width / 2;
               flag.y = 70;
            }
         };
         RslLoaderManager.lazyLoad(onCom,null,GameConfig.fileBaseFolder + "res/data/mc/flag/lv1flag.swf",GameConfig.fileBaseFolder + "res/data/mc/flag/lv2flag.swf",GameConfig.fileBaseFolder + "res/data/mc/flag/lv3flag.swf");
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
         addChild(this.yupei);
         this.yupei.x = 134;
         this.yupei.y = 271;
      }
      
      public function hideZanWen() : void
      {
         if(this.zanwenValue.parent)
         {
            this.zanwenValue.parent.removeChild(this.zanwenValue);
         }
      }
      
      private function isShowZanWenBtn(param1:Boolean) : void
      {
      }
      
      public function setZanWenValue(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int) : void
      {
         this.zanwenValue.setZanWen(param1,param2,param3,param4,param5,param6,param7,param8);
         this.specialValue0.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "%" + "<br>" + param3 + "%" + "<br>" + param5 + "%" + "<br>" + param7 + "%" + "</font>" + "</textformat>";
         this.specialValue1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + (param2 > 0 ? "+" + param2 + "%" : "") + "<br>" + (param4 > 0 ? "+" + param4 + "%" : "") + "<br>" + (param6 > 0 ? "+" + param6 + "%" : "") + "<br>" + (param8 > 0 ? "+" + param8 + "%" : "") + "<br>" + "</font>" + "</textformat>";
      }
      
      public function set9JianJianCheng(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number) : void
      {
         this.zanwenValue.set9JIanJiaCheng(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         this.specialValue2.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "%<br>" + param2 + "%<br>" + param3 + "%<br>" + param4 + "%<br>" + param5 + "%<br>" + "</font>" + "</textformat>";
         this.specialValue3.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + (param6 > 0 ? "+" + param6 / 100 + "%" : "") + "<br>" + (param7 > 0 ? "+" + param7 / 100 + "%" : "") + "<br>" + (param8 > 0 ? "+" + param8 / 100 + "%" : "") + "<br>" + (param9 > 0 ? "+" + param9 / 100 + "%" : "") + "<br>" + (param10 > 0 ? "+" + param10 / 100 + "%" : "") + "<br>" + "</font>" + "</textformat>";
      }
      
      public function setAvaterXY(param1:Boolean, param2:int = 0, param3:int = 0) : void
      {
         if(param1)
         {
            this._avatar.x = 115 - this._avatar.width / 2;
            this._avatar.y = 240 - this._avatar.height - 15;
         }
         else
         {
            this._avatar.x = param2;
            this._avatar.y = param3;
         }
      }
      
      public function setZhuangbeiKaiqi() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
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
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 15;
         this.tipCanvas.y = mouseY + 25;
      }
      
      public function setStarSta(param1:int) : void
      {
         var bmp:Bitmap = null;
         var loadUrl:String = null;
         var type:int = param1;
         while(this.starSpr.numChildren > 0)
         {
            this.starSpr.removeChildAt(0);
         }
         this.starSta = type;
         if(this.starSta >= 1)
         {
            if(this.starMc == null)
            {
               loadUrl = GameConfig.fileBaseFolder + "res/data/mc/longhun/fire.swf";
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = null;
                  _loc2_ = param1.target as LoadingItem;
                  starMc = _loc2_.content as MovieClip;
                  if(starMc)
                  {
                     starMc.x = -19;
                     starMc.y = -41;
                     starSpr.addChild(starMc);
                  }
               },null,false,loadUrl);
            }
            else
            {
               this.starSpr.addChild(this.starMc);
            }
            bmp = StaticValue.getBitmapByClassName("ui.biwuDahui.star.liang");
            this.starSpr.addChild(bmp);
         }
         else
         {
            bmp = StaticValue.getBitmapByClassName("ui.biwuDahui.star.an");
            this.starSpr.addChild(bmp);
         }
      }
      
      public function setStatusByString(param1:String) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         if(param1 == null || param1.length == 0)
         {
            this.setTianGangZhenQi(0);
            return;
         }
         _loc2_ = param1.split(";");
         _loc3_ = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = _loc2_[_loc3_].split(",");
            switch(parseInt(_loc4_[0]))
            {
               case 1:
                  this.setTianGangZhenQi(parseInt(_loc4_[1]));
            }
            _loc3_++;
         }
      }
      
      private function setTianGangZhenQi(param1:int) : void
      {
         var loadUrl:String = null;
         var bmp:DisplayObject = null;
         var sta:int = param1;
         while(this.tianGangZhengQiSpr.numChildren > 0)
         {
            this.tianGangZhengQiSpr.removeChildAt(0);
         }
         this.wushuangBo = GameState.dictTargetStatus[SpecialGoodsID.ZHU_LUANSHIWUSHUANG_ID];
         this.zhizuntianxiaBo = GameState.dictTargetStatus[SpecialGoodsID.ZHU_ZHIZUNTIANXIA_ID];
         this.cheng1 = GameState.dictTargetStatus[729746];
         this.cheng2 = GameState.dictTargetStatus[729747];
         if(this.cheng2)
         {
            if(this.mcObj[4] == null)
            {
               loadUrl = GameConfig.fileBaseFolder + "res/data/mc/tiangangzhengqi/2.swf";
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = null;
                  _loc2_ = param1.target as LoadingItem;
                  tianGangZhengQiMc = _loc2_.content as MovieClip;
                  if(tianGangZhengQiMc)
                  {
                     tianGangZhengQiMc.x = -4;
                     tianGangZhengQiMc.y = 0;
                     tianGangZhengQiSpr.addChild(tianGangZhengQiMc);
                  }
                  mcObj[3] = tianGangZhengQiMc;
               },null,false,loadUrl);
            }
            else
            {
               this.tianGangZhengQiSpr.addChild(this.tianGangZhengQiMc);
            }
         }
         else if(this.cheng1)
         {
            if(this.mcObj[5] == null)
            {
               loadUrl = GameConfig.fileBaseFolder + "res/data/mc/tiangangzhengqi/1.swf";
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = null;
                  _loc2_ = param1.target as LoadingItem;
                  tianGangZhengQiMc = _loc2_.content as MovieClip;
                  if(tianGangZhengQiMc)
                  {
                     tianGangZhengQiMc.x = -4;
                     tianGangZhengQiMc.y = 0;
                     tianGangZhengQiSpr.addChild(tianGangZhengQiMc);
                  }
                  mcObj[3] = tianGangZhengQiMc;
               },null,false,loadUrl);
            }
            else
            {
               this.tianGangZhengQiSpr.addChild(this.tianGangZhengQiMc);
            }
         }
         else if(this.zhizuntianxiaBo)
         {
            loadUrl = GameConfig.fileBaseFolder + "res/data/mc/tiangangzhengqi/zhizuntianxia2.swf";
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = null;
               _loc2_ = param1.target as LoadingItem;
               tianGangZhengQiMc = _loc2_.content as MovieClip;
               if(tianGangZhengQiMc)
               {
                  tianGangZhengQiMc.x = -4;
                  tianGangZhengQiMc.y = 0;
                  tianGangZhengQiSpr.addChild(tianGangZhengQiMc);
               }
               mcObj[3] = tianGangZhengQiMc;
            },null,false,loadUrl);
         }
         else if(this.wushuangBo)
         {
            loadUrl = GameConfig.fileBaseFolder + "res/data/mc/tiangangzhengqi/luanshiwushuang.swf";
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = null;
               _loc2_ = param1.target as LoadingItem;
               tianGangZhengQiMc = _loc2_.content as MovieClip;
               if(tianGangZhengQiMc)
               {
                  tianGangZhengQiMc.x = -4;
                  tianGangZhengQiMc.y = 0;
                  tianGangZhengQiSpr.addChild(tianGangZhengQiMc);
               }
               mcObj[2] = tianGangZhengQiMc;
            },null,false,loadUrl);
         }
         else
         {
            this.tianGangZhengQiSta = sta;
            if(this.tianGangZhengQiSta >= 1)
            {
               loadUrl = GameConfig.fileBaseFolder + "res/data/mc/tiangangzhengqi/tiangangzhengqi.swf";
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = null;
                  _loc2_ = param1.target as LoadingItem;
                  tianGangZhengQiMc = _loc2_.content as MovieClip;
                  if(tianGangZhengQiMc)
                  {
                     tianGangZhengQiMc.x = -19;
                     tianGangZhengQiMc.y = -21;
                     tianGangZhengQiSpr.addChild(tianGangZhengQiMc);
                  }
                  mcObj[1] = tianGangZhengQiMc;
               },null,false,loadUrl);
            }
            else
            {
               bmp = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/tiangangzhengqi/tiangangzhengqi.png",68,19);
               bmp.y = -2;
               bmp.x = -3;
               this.tianGangZhengQiSpr.addChild(bmp);
            }
         }
      }
      
      private function onStarMouseTip(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:Boolean = false;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.starSpr.addEventListener(MouseEvent.MOUSE_MOVE,this.onStarMouseTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "";
               if(this.starSta == 0)
               {
                  _loc2_ = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("龙魂未激活") + "<br></font>" + "<font color=\'" + StaticValue.HUISE_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：2888、防御：2888、攻击速度：88、暴击伤害加成20%") + "<br></font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("帝王龙魂(最终)未激活") + "<br></font>" + "<font color=\'" + StaticValue.HUISE_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：12000、防御：10000、血量：68888") + "<br></font>";
               }
               else if(this.starSta == 1)
               {
                  _loc2_ = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("龙魂已激活") + "<br></font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：2888、防御：2888、攻击速度：88、暴击伤害加成20%") + "<br></font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("帝王龙魂(最终)未激活") + "<br></font>" + "<font color=\'" + StaticValue.HUISE_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：12000、防御：10000、血量：68888") + "<br></font>";
               }
               else if(this.starSta == 2)
               {
                  _loc2_ = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("龙魂未激活") + "<br></font>" + "<font color=\'" + StaticValue.HUISE_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：2888、防御：2888、攻击速度：88、暴击伤害加成20%") + "<br></font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("帝王龙魂(最终)已激活") + "<br></font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：12000、防御：10000、血量：68888") + "<br></font>";
               }
               else if(this.starSta == 3)
               {
                  _loc2_ = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("龙魂已激活") + "<br></font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：2888、防御：2888、攻击速度：88、暴击伤害加成20%") + "<br></font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("帝王龙魂(最终)已激活") + "<br></font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：12000、防御：10000、血量：68888") + "<br></font>";
               }
               _loc3_ = false;
               _loc3_ = Boolean(this.wuShengQiDict[10001]) && Boolean(this.wuShengQiDict[10002]) && Boolean(this.wuShengQiDict[10002]) && Boolean(this.wuShengQiDict[10003]) && Boolean(this.wuShengQiDict[10004]);
               if(GameState.dictTargetStatus[SpecialGoodsID.QINGLONG_JINGPO_ID])
               {
                  _loc2_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("青龙精魄：") + "<br>" + "   " + LanResManager.getLanCommonTextWords("人物可吸收青龙精魄提升攻击5888888889000 防御5888888889000 血量6888888889000 暴击") + "<br>" + "   " + LanResManager.getLanCommonTextWords("88888闪避 88888所有武功600000层且可激活青龙印技能.") + "<br>" + "   " + LanResManager.getLanCommonTextWords("青龙印：攻击时100%触发青龙印，持续10秒； 在此状态下，人物将瞬间飞跃至天空中，消") + "<br>" + "   " + LanResManager.getLanCommonTextWords("失至对手视线之中。冷却60秒。") + "<br></font>";
               }
               if(GameState.dictTargetStatus[SpecialGoodsID.BAIHU_JINGPO_ID])
               {
                  _loc2_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("白虎精魄：") + "<br>" + "   " + LanResManager.getLanCommonTextWords("人物可吸收白虎精魄提升攻击5888888889000 防御5888888889000 血量6888888889000 暴击") + "<br>" + "   " + LanResManager.getLanCommonTextWords("88888闪避 88888所有武功600000层且可激活白虎印技能.") + "<br>" + "   " + LanResManager.getLanCommonTextWords("白虎印：被攻击时100%触发白虎印，持续10秒；在此状态下，100%破除对手所有效果，对") + "<br>" + "   " + LanResManager.getLanCommonTextWords("手在此状态下，将无法触发任何抵抗BUFF，直至状态解除为止。冷却60秒。") + "<br></font>";
               }
               if(GameState.dictTargetStatus[SpecialGoodsID.ZHUQUE_JINGPO_ID])
               {
                  _loc2_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("朱雀精魄：") + "<br>" + "   " + LanResManager.getLanCommonTextWords("人物可吸收朱雀精魄提升攻击5888888889000 防御5888888889000 血量6888888889000 暴击") + "<br>" + "   " + LanResManager.getLanCommonTextWords("88888闪避 88888所有武功600000层且可激活朱雀印技能.") + "<br>" + "   " + LanResManager.getLanCommonTextWords("朱雀印：攻击时100%触发朱雀印，持续10秒；对手在此状态下，将受到地狱之火不断灼烧，") + "<br>" + "   " + LanResManager.getLanCommonTextWords("每秒掉血60%，且对手双手受火焰燃烧，无法继续攻击操作。冷却60秒。") + "<br></font>";
               }
               if(GameState.dictTargetStatus[SpecialGoodsID.XUANWU_JINGPO_ID])
               {
                  _loc2_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("玄武精魄：") + "<br>" + "   " + LanResManager.getLanCommonTextWords("人物可吸收玄武精魄提升攻击5888888889000 防御5888888889000 血量6888888889000 暴击") + "<br>" + "   " + LanResManager.getLanCommonTextWords("88888闪避 88888所有武功600000层且可激活玄武印技能.") + "<br>" + "   " + LanResManager.getLanCommonTextWords("玄武印：被攻击时100%触发玄武印，持续10秒；在此状态下，自身所受到的所有攻击、所有") + "<br>" + "   " + LanResManager.getLanCommonTextWords("百分比伤害、所有负面状态都将免疫，使自身进入无敌的状态，让对手不可侵犯。冷却60秒。") + "<br></font>";
               }
               if(GameState.dictTargetStatus[SpecialGoodsID.SHISHITAOZHUANGJIHUOSHI_ID])
               {
                  _loc2_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("史诗套装激活石：") + "<br>" + LanResManager.getLanCommonTextWords("套装属性：攻击88888亿 防御62888亿 血量90888亿 暴击 88888闪避88888 ") + "<br>" + LanResManager.getLanCommonTextWords("青龙战纹100%、白虎战纹100%、朱雀战纹80%、所有武功1400000层") + "<br>" + LanResManager.getLanCommonTextWords("史诗侵蚀：攻击时100%触发史诗侵蚀，持续10秒；自身在此状态下，对手所有攻击施发的技") + "<br>" + LanResManager.getLanCommonTextWords("能效果都将被史诗装备侵蚀，使自身达到免疫的状态；每受到对手一次，都将立即反噬对手") + "<br>" + LanResManager.getLanCommonTextWords("一次侵蚀效果，瞬间掉血80%，且使对手所有攻击都被立即停止，持续10秒。冷却60秒。") + "<br></font>";
               }
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.starSpr.removeEventListener(MouseEvent.MOUSE_MOVE,this.onStarMouseTip);
         }
      }
      
      public function addSlot(param1:Boolean) : void
      {
         if(param1)
         {
            this.img1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
            addChildAt(this.img1,1);
            this.img1.x = 132;
            this.img1.y = 232;
         }
      }
      
      public function deleteSlot() : void
      {
         if(Boolean(this.img1) && this.img1.parent != null)
         {
            this.img1.parent.removeChild(this.img1);
         }
      }
      
      public function setLayout(param1:Boolean = false) : void
      {
         this.isDizi = param1;
         if(!param1)
         {
            this.bgImg.visible = true;
            this.diZiBgImg.visible = false;
            this.colorBarBg.visible = true;
            this.colorBarBg.x = 80;
            this.colorBarBg.y = 42;
            this.colorBarBg.width = 110;
            this.zhandouBg.x = 250;
            this.zhandouBg.y = 63;
            this.colorBarBg1.visible = true;
            this.colorBarBg1.x = 260;
            this.colorBarBg1.y = 42;
            this.colorBarBg1.width = 110;
            this.colorBarBg2.visible = false;
            this.baseAttributeTitle.htmlText = LanResManager.getLanTextWords(this,"其他玩家基本属性标题");
            this.baseAttributeTitle.x = 20;
            this.charName.x = 50;
            this.level.x = 190;
            this.equipContainer.x = 13;
            this.equipContainer.y = 66;
            this.hpTitle.visible = false;
            this.hpBar.visible = false;
            this.mpBar.visible = false;
            this.nqBar.visible = false;
            this.skillTitle.x = 238;
            this.skillTitle.y = 82;
            this.skillTitle.htmlText = "<textformat leading=\'5\'>" + LanResManager.getLanCommonTextWords("生命上限") + "<br>" + LanResManager.getLanCommonTextWords("内力上限") + "<br>" + LanResManager.getLanCommonTextWords("体力上限") + "<br>" + LanResManager.getLanCommonTextWords("攻　　击") + "<br>" + LanResManager.getLanCommonTextWords("防　　御") + "<br>" + LanResManager.getLanCommonTextWords("暴　　击") + "<br>" + LanResManager.getLanCommonTextWords("闪　　避") + "<br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击速度") + "<br>" + LanResManager.getLanCommonTextWords("移动速度") + "</font></textformat>";
            this.skillValue.x = 298;
            this.skillValue.y = 82;
            this.text1.visible = true;
            this.colorBar1.visible = true;
            this.expBar.visible = true;
            this.zhenqiBar.visible = true;
            this.ico.visible = true;
            this.zanwenBtn.visible = true;
            this.starSpr.visible = true;
            this.tianGangZhengQiSpr.visible = true;
            this.party.visible = true;
            this.specialAttributeTitle.visible = false;
            this.specialValue0.visible = false;
            this.specialValue1.visible = false;
            this.specialValue2.visible = false;
            this.specialValue3.visible = false;
            this.chatBtn.visible = true;
            this.tradingBtn.visible = true;
            this.cheerBtn.visible = true;
            this.teamBtn.visible = true;
            this.adoreBtn.visible = false;
            this.despiseBtn.visible = false;
            this.zhandouliBtn.visible = true;
            this.nbEquipCanvas.visible = true;
            if(this.flag)
            {
               this.flag.visible = true;
            }
         }
         else
         {
            this.bgImg.visible = false;
            this.diZiBgImg.visible = true;
            this.colorBarBg.x = 52;
            this.colorBarBg.y = 47;
            this.colorBarBg.width = 168;
            this.colorBarBg1.x = 52;
            this.colorBarBg1.y = 62;
            this.colorBarBg1.width = 168;
            this.colorBarBg2.visible = true;
            this.zhandouBg.x = 285;
            this.zhandouBg.y = 8;
            this.baseAttributeTitle.htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanCommonTextWords("姓名:") + "                          " + LanResManager.getLanCommonTextWords("等级:") + "                  <br>" + LanResManager.getLanCommonTextWords("门派:") + "                          " + LanResManager.getLanCommonTextWords("祖师:") + "                  <br>" + "</textformat>";
            this.baseAttributeTitle.x = 5;
            this.charName.x = 50 - 20;
            this.level.x = 150;
            this.equipContainer.x = 13;
            this.equipContainer.y = 106;
            this.text1.visible = false;
            this.colorBar1.visible = false;
            this.hpTitle.visible = true;
            this.hpBar.visible = true;
            this.mpBar.visible = true;
            this.nqBar.visible = true;
            this.skillTitle.x = 240;
            this.skillTitle.y = 32;
            this.skillTitle.htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanCommonTextWords("攻　　击") + "<br>" + LanResManager.getLanCommonTextWords("防　　御") + "<br>" + LanResManager.getLanCommonTextWords("暴　　击") + "<br>" + LanResManager.getLanCommonTextWords("闪　　避") + "<br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击速度") + "<br>" + LanResManager.getLanCommonTextWords("移动速度") + "</font></textformat>";
            this.skillValue.x = 340;
            this.skillValue.y = 32;
            this.expBar.visible = false;
            this.zhenqiBar.visible = false;
            this.ico.visible = false;
            this.zanwenBtn.visible = false;
            this.starSpr.visible = false;
            this.tianGangZhengQiSpr.visible = false;
            this.party.visible = false;
            this.specialAttributeTitle.visible = true;
            this.specialValue0.visible = true;
            this.specialValue1.visible = true;
            this.specialValue2.visible = true;
            this.specialValue3.visible = true;
            this.chatBtn.visible = false;
            this.tradingBtn.visible = false;
            this.cheerBtn.visible = false;
            this.teamBtn.visible = false;
            this.adoreBtn.visible = false;
            this.despiseBtn.visible = false;
            this.zhandouliBtn.visible = false;
            this.nbEquipCanvas.visible = false;
            if(this.flag)
            {
               this.flag.visible = false;
            }
         }
      }
      
      public function setDiZiData(param1:String, param2:String, param3:int) : void
      {
         this.charName.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.GREEN_HTML + "\'>    " + this.arr1[0] + "</font><br>" + param1 + "</textformat>";
         this.level.htmlText = "<textformat leading=\'6\'>" + this.arr1[4] + "<br>" + param2 + "</textformat>";
         this.specialValue2.htmlText += "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param3 + "</font>" + "</textformat>";
      }
   }
}

