package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.*;
   import gs.TweenMax;
   
   public class XiuweiPanel extends Sprite
   {
      
      public var _$parent:DisplayObject;
      
      private var fc1:FCanvas;
      
      private var lb:FTextArea;
      
      private var fta1:FTextArea;
      
      private var fta2:FTextArea;
      
      private var fta3:FTextArea;
      
      private var fta4:FTextArea;
      
      private var fta5:FTextArea;
      
      private var buf:FTextArea;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      private var ft:FTextArea;
      
      private var tf:TextFormat;
      
      private var barBg1:Bitmap;
      
      private var barBar1:ColorBar;
      
      private var fb1:FLabel;
      
      private var img:Bitmap;
      
      private var buyBtn:SecondButton;
      
      private var kslwBtn:SecondButton;
      
      private var zdlwBtn:SecondButton;
      
      private var goodsId:int;
      
      private var item:ItemFace;
      
      private var loadUrl:String;
      
      private var ldUrl:String;
      
      private var mcObj:Object;
      
      private var Obj:Object;
      
      private var gongMc:MovieClip;
      
      private var yanhuaMc:MovieClip;
      
      private var mc1:MovieClip;
      
      private var t:int;
      
      private var m:int;
      
      private var n:int;
      
      private var buffSpr:Sprite;
      
      private var fts:FTextArea;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var fts3:FTextArea;
      
      public var check:FCheckBox;
      
      private var checkLabel:FLabel;
      
      private var fts4:FTextArea;
      
      private var check1:FCheckBox;
      
      private var checkLabel1:FLabel;
      
      private var fts5:FTextArea;
      
      private var check2:FCheckBox;
      
      private var equipContainers:Sprite;
      
      private var kuangHD:Bitmap;
      
      private var isMainChar:Boolean;
      
      private var fts6:FTextArea;
      
      public function XiuweiPanel()
      {
         var tf1:TextFormat;
         this.mcObj = {};
         this.Obj = {};
         super();
         this.fc1 = new FCanvas();
         this.fc1.x = 0;
         this.fc1.y = 2;
         this.fc1.width = 402;
         this.fc1.height = 365;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.fc1 = new FCanvas();
         this.fc1.x = 2;
         this.fc1.y = 4;
         this.fc1.width = 398;
         this.fc1.height = 203;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.fc1 = new FCanvas();
         this.fc1.x = 2;
         this.fc1.y = 231;
         this.fc1.width = 203;
         this.fc1.height = 134;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.fc1 = new FCanvas();
         this.fc1.x = 204;
         this.fc1.y = 231;
         this.fc1.width = 196;
         this.fc1.height = 134;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.lb = new FTextArea();
         with(this.lb)
         {
            x = 285;
            y = 5;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\' size=\'15\'>" + LanResManager.getLanCommonTextWords("修行") + "</font>";
         }
         addChild(this.lb);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            x = 206;
            y = 20;
            width = 193;
            height = 165;
            wordWrap = true;
            htmlText = "";
         }
         addChild(this.fta1);
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "previousButton";
         addChild(this.previousButton);
         this.previousButton.x = 227 + 18 - 9 - 20 + 5 - 5 - 3;
         this.previousButton.y = 167 + 20 - 10 - 28 + 15 + 6 + 6;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "nextButton";
         addChild(this.nextButton);
         this.nextButton.x = 355 + 18 - 20 + 5 + 6 + 5 + 3;
         this.nextButton.y = 167 + 20 - 10 - 28 + 15 + 6 + 6;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ft = new FTextArea();
         this.tf = new TextFormat();
         this.tf.align = "center";
         with(this.ft)
         {
            multiline = true;
            filters = StaticValue.filter;
            defaultTextFormat = tf;
            width = 116 + 6 + 10 + 6;
            height = 16;
            x = 265 - 9 - 20 + 5 - 5 - 3;
            y = 167 + 20 - 10 - 28 + 15 + 6 + 7;
            textColor = StaticValue.WHITE;
            background = true;
            backgroundColor = 1186072;
            htmlText = "";
         }
         addChild(this.ft);
         this.barBg1 = StaticValue.getBitmapByClassName("ui.xiuwei.exp.bg");
         addChild(this.barBg1);
         this.barBg1.x = 2;
         this.barBg1.y = 206;
         this.barBar1 = new ColorBar(5,351,8);
         addChild(this.barBar1);
         this.barBar1.x = 25;
         this.barBar1.y = 216;
         this.fta2 = new FTextArea();
         tf1 = new TextFormat();
         tf1.size = 12;
         tf1.color = 65276;
         with(this.fta2)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            defaultTextFormat = tf1;
            width = 110;
            height = 20;
            x = 10;
            y = 235;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanCommonTextWords("悟通本式加成如下属性：");
         }
         addChild(this.fta2);
         this.fta3 = new FTextArea();
         with(this.fta3)
         {
            filters = StaticValue.filter;
            x = 10;
            y = 260;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.fta3);
         this.fb1 = new FLabel();
         with(this.fb1)
         {
            x = 214;
            y = 235;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.fb1);
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.img);
         this.img.x = 218;
         this.img.y = 252;
         this.buyBtn = new SecondButton();
         this.buyBtn.label = LanResManager.getLanCommonTextWords("购买");
         this.buyBtn.x = 216;
         this.buyBtn.y = 293;
         this.buyBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fta4 = new FTextArea();
         with(this.fta4)
         {
            filters = StaticValue.filter;
            x = 265;
            y = 235;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.fta4);
         this.fta5 = new FTextArea();
         with(this.fta5)
         {
            filters = StaticValue.filter;
            x = 216;
            y = 320;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.fta5);
         this.buf = new FTextArea();
         with(this.buf)
         {
            filters = StaticValue.filter;
            x = 295;
            y = 300;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.buf);
         this.kslwBtn = new SecondButton();
         this.kslwBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
         addChild(this.kslwBtn);
         this.kslwBtn.x = 216;
         this.kslwBtn.y = 340;
         this.kslwBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zdlwBtn = new SecondButton();
         this.zdlwBtn.label = LanResManager.getLanCommonTextWords("自动领悟");
         addChild(this.zdlwBtn);
         this.zdlwBtn.x = 325;
         this.zdlwBtn.y = 340;
         this.zdlwBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fts = new FTextArea();
         this.fts.x = 10;
         this.fts.y = 20;
         this.fts.textColor = StaticValue.RED;
         this.fts.width = 170;
         this.fts.height = 20;
         this.fts.htmlText = LanResManager.getLanCommonTextWords("修行顶级属性(未激活)");
         addChild(this.fts);
         ToolTips.createToolTips(this.fts,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击1288888、防御888888、血量8888888、暴击88、闪避88") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 35;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击12888888、防御6888888、血量18888888、暴击888、闪避888 、所有武功提升12层") + "<br>" + LanResManager.getLanCommonTextWords("激活后，玩家将可以在永久活动中每天免费领取 江湖恩仇录×188") + "<br>" + LanResManager.getLanCommonTextWords("激活后，玩家将可以在永久活动中每天免费领取 武功升级丹×3") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 50;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.htmlText = new Goods(SpecialGoodsID.XIUXING_GAISHIWUXIA_ID).res.name;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("2018神功秘籍效果") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 173;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 170;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("皇途霸业秘籍（已激活）");
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性：攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 600000层") + "<br>" + LanResManager.getLanCommonTextWords("★将可以获得该系统的专属称号“皇途霸业”！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.x = 101 - 33;
         this.check.y = 345;
         this.check.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.checkLabel = new FLabel();
         with(this.checkLabel)
         {
            x = check.x + 20;
            --check.y;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("VIP尊享聊天卡已激活");
         }
         addChild(this.checkLabel);
         ToolTips.createToolTips(this.checkLabel,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("VIP尊享特权：点击勾选使用修行VIP尊享特权，聊天字体颜色将变成紫色，VIP尊享特权永久存在。");
            return _loc1_ + "</textformat>";
         });
         this.fts4 = new FTextArea();
         this.fts4.x = 10;
         this.fts4.y = 137;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 170;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("破天神器石(已激活)");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 500000层") + "<br>" + LanResManager.getLanCommonTextWords("（特殊技能）：激活破天神器石的玩家，可拥有破天神器套装的合体功能，套装可和人") + "<br>" + LanResManager.getLanCommonTextWords("物合体，变幻成霸气套装。同时拥有破天神器和破天套装的玩家，被攻击时100%触发破") + "<br>" + LanResManager.getLanCommonTextWords("天怒击，持续20秒；在此状态状态下，攻击时100%破除对手的所有无敌状态，即使对手") + "<br>" + LanResManager.getLanCommonTextWords("处于无敌状态，一样可以打破攻击对手，使对手无招架之力，冷却90秒。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.check1 = new FCheckBox();
         addChild(this.check1);
         this.check1.x = 10;
         this.check1.y = 28 + 35 + 95 - 3;
         this.check1.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.checkLabel1 = new FLabel();
         with(this.checkLabel1)
         {
            x = check1.x + 20;
            --check1.y;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("自动换装");
         }
         addChild(this.checkLabel1);
         this.fts5 = new FTextArea();
         this.fts5.x = 10;
         this.fts5.y = 120;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 170;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("墨家冰晶虎");
         this.fts5.visible = false;
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 500000层") + "<br>" + LanResManager.getLanCommonTextWords("冰晶虎：墨家多年研究使用钻石水晶打造而成的机关虎，拥有坚硬的外壳，人物可自己转换战斗模式。") + "<br>" + LanResManager.getLanCommonTextWords("冰魄刺：攻击时100%触发冰魄刺，持续10秒；在此状态下，拥有冰晶虎的玩家周围将形成一冰形的刺") + "<br>" + LanResManager.getLanCommonTextWords("包围自己，使自身免疫所有负面状态和伤害；形成一最强的防御盾；且在此状态下，每受到对手一次") + "<br>" + LanResManager.getLanCommonTextWords("攻击或是技能效果都将瞬间转移给对手，且使其瞬间定身原地5秒。冷却60秒。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.check2 = new FCheckBox();
         addChild(this.check2);
         this.check2.visible = false;
         this.check2.x = 10 + 75;
         this.check2.y = 28 + 35 + 95 - 3 + 25 - 60;
         this.check2.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.equipContainers = new Sprite();
         this.equipContainers.x = 343 + 8 - 165;
         this.equipContainers.y = 12 + 30 + 135 - 25;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick00,false,30);
         addChild(this.equipContainers);
         this.fts6 = new FTextArea();
         this.fts6.x = 10;
         this.fts6.y = 102;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 170;
         this.fts6.height = 20;
         this.fts6.htmlText = "Chấn Thiên Bảo Giáp";
         this.fts6.visible = false;
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Chấn Thiên Bảo Giáp: Khi bị tấn công có xác suất làm đối phương phải tạm thời mất đi 50.000.000 " + "<br>" + "Tầng Võ Công trong 10 giây. Thời gian chờ là 180 Giây." + "</font>";
            return _loc1_ + "</textformat>";
         });
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.check:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check.selectState,9]));
               break;
            case this.check1:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check1.selectState,19]));
               break;
            case this.check2:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check2.selectState,74]));
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.previousButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.XIUWEI_ARROW_CLICK,"",0));
               break;
            case this.nextButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.XIUWEI_ARROW_CLICK,"",1));
               break;
            case this.kslwBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_XIUWEI_KAISHITISHENG_CLICKJ));
               break;
            case this.zdlwBtn:
               if(this.zdlwBtn.label == LanResManager.getLanCommonTextWords("自动领悟"))
               {
                  this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_XIUWEI_ZIDONGTISHENG_CLICKJ,"",true));
               }
               else
               {
                  this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_XIUWEI_ZIDONGTISHENG_CLICKJ,"",false));
               }
               break;
            case this.buyBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.XIUWEI_GOUMAI_CLICK,"",this.goodsId));
         }
      }
      
      private function aa(param1:Event = null) : void
      {
         var e:Event = param1;
         var ftaw1:FTextArea = new FTextArea();
         with(ftaw1)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.CENTER;
            x = 125;
            y = 216;
            textColor = StaticValue.YELLOW;
            width = 132;
         }
         if(this.m == 0)
         {
            ftaw1.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("获得了") + this.n + LanResManager.getLanCommonTextWords("修行值") + "</font><br>";
            TweenMax.to(ftaw1,1.5,{
               "y":181,
               "onComplete":this.onCom1,
               "onCompleteParams":[ftaw1]
            });
         }
         else if(this.m == 1)
         {
            ftaw1.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\' size=\'20\'>" + LanResManager.getLanCommonTextWords("恭喜您！您通过大悟，获得了") + this.n + LanResManager.getLanCommonTextWords("修行值") + "</font><br>";
            TweenMax.to(ftaw1,1.5,{
               "y":161,
               "onComplete":this.onCom1,
               "onCompleteParams":[ftaw1]
            });
         }
         else if(this.m == 2)
         {
            ftaw1.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\' size=\'26\'>" + LanResManager.getLanCommonTextWords("恭喜您！您通过顿悟，获得了") + this.n + LanResManager.getLanCommonTextWords("修行值") + "</font><br>";
            TweenMax.to(ftaw1,1.5,{
               "y":141,
               "onComplete":this.onCom1,
               "onCompleteParams":[ftaw1]
            });
         }
         addChild(ftaw1);
      }
      
      private function onCom1(param1:FTextArea) : void
      {
         if(param1 != null && param1.parent != null)
         {
            param1.parent.removeChild(param1);
         }
      }
      
      public function setInitializeText(param1:String, param2:String, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Boolean, param10:Boolean, param11:Boolean) : void
      {
         if(param8 != 0)
         {
            this.buf.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("顿悟几率") + " + 5%</font>";
         }
         else
         {
            this.buf.htmlText = "";
         }
         this.isMainChar = param9;
         this.fta1.htmlText = param1;
         this.fta4.htmlText = "<textformat leading=\'1\'>" + param2 + "</textformat>";
         this.fta3.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：") + param3 + "<br>" + LanResManager.getLanCommonTextWords("防御：") + param4 + "<br>" + LanResManager.getLanCommonTextWords("生命：") + param5 + "<br>" + LanResManager.getLanCommonTextWords("内力：") + param6 + "<br>" + LanResManager.getLanCommonTextWords("体力：") + param7 + "</font><br>" + "</textformat>";
         this.jihuoGaiShiwuxia(param9);
         this.check.selectState = param10;
         this.check1.selectState = param11;
      }
      
      public function setGoods(param1:Goods, param2:String, param3:int, param4:Boolean) : void
      {
         this.goodsId = param1.id;
         this.fb1.text = param2;
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(param1);
         this.item.x = 220;
         this.item.y = 254;
         addChild(this.item);
         if(param4)
         {
            this.item.filters = [];
            this.fta5.htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("消耗") + "：" + param2 + " X " + param3 + LanResManager.getLanCommonTextWords("本") + "</textformat>";
         }
         else
         {
            this.item.filters = Tools.blackWhiteFilter;
            this.fta5.htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("消耗") + "：" + param2 + " X " + param3 + LanResManager.getLanCommonTextWords("本") + "</textformat>";
         }
      }
      
      public function setJinduNum(param1:int, param2:int, param3:int, param4:int) : *
      {
         this.m = param3;
         this.n = param4;
         if(param1 > param2)
         {
            this.barBar1.setValue(param2,param2);
         }
         else
         {
            this.barBar1.setValue(param1,param2);
         }
         this.aa();
      }
      
      public function setZhaoShiMsg(param1:String, param2:int, param3:int) : void
      {
         var str1:String = param1;
         var int1:int = param2;
         var int2:int = param3;
         this.ft.htmlText = str1;
         if(int1 == 1)
         {
            this.previousButton.enabled = false;
         }
         else
         {
            this.previousButton.enabled = true;
         }
         if(int1 == 10)
         {
            this.nextButton.enabled = false;
         }
         else
         {
            this.nextButton.enabled = true;
         }
         if(int1 == int2)
         {
            this.kslwBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
            this.kslwBtn.enabled = true;
            this.zdlwBtn.visible = true;
            this.zdlwBtn.enabled = true;
         }
         else if(int1 < int2)
         {
            this.kslwBtn.label = LanResManager.getLanCommonTextWords("已领悟");
            this.kslwBtn.enabled = false;
            this.zdlwBtn.visible = false;
         }
         else
         {
            this.kslwBtn.label = LanResManager.getLanCommonTextWords("未领悟");
            this.kslwBtn.enabled = false;
            this.zdlwBtn.visible = true;
            this.zdlwBtn.enabled = false;
         }
         this.loadUrl = GameConfig.fileBaseFolder + "res/data/mc/xiuwei/" + int1 + ".swf";
         if(this.mcObj[int1] != null)
         {
            if(Boolean(this.gongMc) && this.gongMc.parent != null)
            {
               this.gongMc.stop();
               this.gongMc.parent.removeChild(this.gongMc);
            }
            this.gongMc = this.mcObj[int1];
            this.gongMc.play();
            this.gongMc.x = 4;
            this.gongMc.y = 6;
            addChildAt(this.gongMc,1);
         }
         else
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl)
               {
                  return;
               }
               if(Boolean(gongMc) && gongMc.parent != null)
               {
                  gongMc.stop();
                  gongMc.parent.removeChild(gongMc);
               }
               gongMc = _loc2_.content as MovieClip;
               mcObj[int1] = gongMc;
               if(gongMc)
               {
                  gongMc.play();
                  gongMc.x = 4;
                  gongMc.y = 6;
                  addChildAt(gongMc,1);
               }
            },null,false,this.loadUrl);
         }
         if(int1 <= 4)
         {
            this.t = 12;
         }
         else if(int1 >= 5 && int1 <= 8)
         {
            this.t = 11;
         }
         else if(int1 >= 9)
         {
            this.t = 13;
         }
         this.ldUrl = GameConfig.fileBaseFolder + "res/data/mc/xiuwei/" + this.t + ".swf";
         if(this.Obj[this.t] != null)
         {
            if(Boolean(this.mc1) && this.gongMc.parent != null)
            {
               this.mc1.stop();
               this.mc1.parent.removeChild(this.mc1);
            }
            this.mc1 = this.Obj[this.t];
            this.mc1.play();
            this.mc1.x = 4;
            this.mc1.y = 6;
            addChildAt(this.mc1,0);
         }
         else
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != ldUrl)
               {
                  return;
               }
               if(Boolean(mc1) && mc1.parent != null)
               {
                  mc1.stop();
                  mc1.parent.removeChild(mc1);
               }
               mc1 = _loc2_.content as MovieClip;
               Obj[t] = mc1;
               if(mc1)
               {
                  mc1.play();
                  mc1.x = 4;
                  mc1.y = 6;
                  addChildAt(mc1,0);
               }
            },null,false,this.ldUrl);
         }
      }
      
      public function setBtn(param1:Boolean) : void
      {
         if(param1)
         {
            this.zdlwBtn.label = LanResManager.getLanCommonTextWords("自动领悟");
         }
         else
         {
            this.zdlwBtn.label = LanResManager.getLanCommonTextWords("停止领悟");
         }
      }
      
      public function bofangYanhua() : void
      {
         if(Boolean(this.yanhuaMc) && this.yanhuaMc.parent != null)
         {
            this.yanhuaMc.parent.removeChild(this.yanhuaMc);
         }
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            yanhuaMc = _loc2_.content as MovieClip;
            yanhuaMc.x = -55;
            yanhuaMc.y = 156;
            addChild(yanhuaMc);
         },null,false,GameConfig.fileBaseFolder + "res/data/mc/xiuwei/yanhua.swf");
      }
      
      public function setXiuweiEnabledFun() : void
      {
         this.previousButton.enabled = false;
         this.nextButton.enabled = false;
         this.kslwBtn.visible = false;
         this.zdlwBtn.visible = false;
         this.buyBtn.enabled = false;
      }
      
      public function setDingJiShuXing(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts.textColor = StaticValue.GREEN;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("修行顶级属性(已激活)");
         }
         else
         {
            this.fts.textColor = StaticValue.RED;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("修行顶级属性(未激活)");
         }
      }
      
      public function huanzhuang(param1:Boolean) : void
      {
         this.check2.selectState = param1;
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.textColor = StaticValue.GREEN;
            this.fts1.htmlText = LanResManager.getLanCommonTextWords("修成正果隐藏属性(已激活)");
         }
         else
         {
            this.fts1.textColor = StaticValue.RED;
            this.fts1.htmlText = LanResManager.getLanCommonTextWords("修成正果隐藏属性(未激活)");
         }
      }
      
      public function jihuoGaiShiwuxia(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.XIUXING_GAISHIWUXIA_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.XIUXING_HUANGTUBAYE];
            this.check.visible = this.checkLabel.visible = GameState.dictMainStatus[SpecialGoodsID.XIUWEI_CHAT_ID];
            this.fts6.visible = GameState.dictMainStatus[731259];
            if(GameState.dictMainStatus[SpecialGoodsID.XIUWEI_POTIANSHENQISHI_ID])
            {
               this.fts4.visible = true;
               this.check1.visible = true;
               this.checkLabel1.visible = true;
            }
            else
            {
               this.fts4.visible = false;
               this.check1.visible = false;
               this.checkLabel1.visible = false;
            }
         }
         else
         {
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.XIUXING_GAISHIWUXIA_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.XIUXING_HUANGTUBAYE];
            this.check.visible = this.checkLabel.visible = GameState.dictTargetStatus[SpecialGoodsID.XIUWEI_CHAT_ID];
            this.fts6.visible = GameState.dictTargetStatus[731259];
            if(GameState.dictTargetStatus[SpecialGoodsID.XIUWEI_POTIANSHENQISHI_ID])
            {
               this.fts4.visible = true;
               this.check1.visible = true;
               this.checkLabel1.visible = true;
            }
            else
            {
               this.fts4.visible = false;
               this.check1.visible = false;
               this.checkLabel1.visible = false;
            }
         }
      }
      
      private function onItemClick00(param1:MouseEvent) : void
      {
         if(this.isMainChar)
         {
            this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function set_XiuWei(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.equipContainers.numChildren > 0)
         {
            this.equipContainers.removeChildAt(0);
         }
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.equipContainers.addChild(this.kuangHD);
         this.kuangHD.x = -40;
         this.kuangHD.y = 0;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            if(_loc3_.res.position == ItemPositionRange.POSTION_XIUWEI_BINGJINGHU)
            {
               _loc4_ = new ItemFace(_loc3_);
               _loc4_.x = 2 - 40;
               _loc4_.y = 2;
               this.equipContainers.addChild(_loc4_);
               if(_loc4_ != null)
               {
                  this.check2.visible = true;
                  this.fts5.visible = true;
               }
               else
               {
                  this.check2.visible = false;
                  this.fts5.visible = false;
               }
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_20171115YINGXIONGLISHI)
            {
               _loc4_ = new ItemFace(_loc3_);
               _loc4_.isHotGoods = true;
               _loc4_.x = 2 - 40;
               _loc4_.y = 2;
               this.equipContainers.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
   }
}

