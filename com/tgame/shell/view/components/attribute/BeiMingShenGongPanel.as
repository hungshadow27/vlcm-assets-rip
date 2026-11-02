package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.BeiMingShenGong.model.info.BeiMingShenGongVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   import gs.TweenMax;
   
   public class BeiMingShenGongPanel extends Sprite
   {
      
      public static const UI_BEIMINGSHENGONG_GUANBI_CLICK:String = "UI_BEIMINGSHENGONG_GUANBI_CLICK";
      
      public var _parent:DisplayObject;
      
      public var bgImg:Bitmap;
      
      public var bg:Bitmap;
      
      private var jingmaiCircle:MovieClip;
      
      private var dantianCircle:MovieClip;
      
      private var qihaiCircle:MovieClip;
      
      private var roushenCircle:MovieClip;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var titleFta:FTextArea;
      
      private var miaoshuTitleFta:FTextArea;
      
      private var check:FCheckBox;
      
      private var fta:FTextArea;
      
      private var ftaTotal:FTextArea;
      
      private var fta2:FTextArea;
      
      private var skillText:FTextArea;
      
      private var jianshuContainer:Sprite;
      
      private var skillImg:Bitmap;
      
      private var p:Point;
      
      private var currSkill:ItemFace;
      
      private var isDrag:Boolean;
      
      private var item:ItemFace;
      
      private var xiuLianBtn:SmallButton;
      
      public var tupoBo:Boolean = false;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      private var dqcs:FTextArea;
      
      private var tf:TextFormat;
      
      private var beiMingShenGongTupo:BeiMingShenGongTupoCanvas;
      
      private var _avatar:Bitmap;
      
      private var gongImg:DisplayObject;
      
      private var fc:FCanvas;
      
      private var jmJdNow:int;
      
      private var jmJdMax:int;
      
      private var dtJdNow:int;
      
      private var dtJdMax:int;
      
      private var qhJdNow:int;
      
      private var qhJdMax:int;
      
      private var rsJdNow:int;
      
      private var rsJdMax:int;
      
      private var loadUrl:String;
      
      private var gongMc:MovieClip;
      
      private var loadUrl1:String;
      
      private var gongMc1:MovieClip;
      
      private var loadUrl2:String;
      
      private var gongMc2:MovieClip;
      
      private var loadUrl3:String;
      
      private var gongMc3:MovieClip;
      
      private var loadUrl4:String;
      
      private var gongMc4:MovieClip;
      
      private var loadUrl5:String;
      
      private var gongMc5:MovieClip;
      
      private var loadUrl6:String;
      
      private var gongMc6:MovieClip;
      
      private var loadUrl7:String;
      
      private var gongMc7:MovieClip;
      
      private var loadUrl8:String;
      
      private var gongMc8:MovieClip;
      
      private var gongImgObj:Object;
      
      private var mcObj1:Object;
      
      private var mcObj2:Object;
      
      private var mcObj3:Object;
      
      private var mcObj4:Object;
      
      private var mcObj5:Object;
      
      private var mcObj6:Object;
      
      private var mcObj7:Object;
      
      private var mcObj8:Object;
      
      private var mcObj9:Object;
      
      private var juseSprite:Sprite;
      
      private var tips1:String;
      
      private var tips2:String;
      
      private var tips3:String;
      
      private var tips4:String;
      
      private var nowID:int;
      
      private var sprite1:Sprite;
      
      private var sprite2:Sprite;
      
      private var sprite3:Sprite;
      
      private var sprite4:Sprite;
      
      private var yiLingWu:int = 0;
      
      private var nowCs:int;
      
      private var wuJiFta:FTextArea;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var beimingshi:int = 0;
      
      private var equipContainers:Sprite;
      
      private var isMain:Boolean;
      
      private var kuangHD:Bitmap;
      
      private var kuangSpr:Sprite;
      
      private var fts3:FTextArea;
      
      private var checkHz:FCheckBox;
      
      private var fts4:FTextArea;
      
      private var checkWq:FCheckBox;
      
      private var fts5:FTextArea;
      
      private var checkDt:FCheckBox;
      
      private var fts6:FTextArea;
      
      public function BeiMingShenGongPanel()
      {
         var $mask:Sprite;
         this.gongImgObj = {};
         this.mcObj1 = {};
         this.mcObj2 = {};
         this.mcObj3 = {};
         this.mcObj4 = {};
         this.mcObj5 = {};
         this.mcObj6 = {};
         this.mcObj7 = {};
         this.mcObj8 = {};
         this.mcObj9 = {};
         super();
         this.fc = new FCanvas();
         this.fc.width = 403;
         this.fc.height = 366;
         this.fc.skin = "box_transparence";
         addChild(this.fc);
         this.tf = new TextFormat();
         this.tf.align = "center";
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
         this.juseSprite = new Sprite();
         this.juseSprite.x = -59;
         this.juseSprite.y = 103;
         addChild(this.juseSprite);
         this._avatar = new Bitmap();
         this.juseSprite.addChild(this._avatar);
         this.sprite1 = new Sprite();
         this.sprite1.x = 22;
         this.sprite1.y = 8;
         addChild(this.sprite1);
         this.sprite2 = new Sprite();
         this.sprite2.x = 274;
         this.sprite2.y = 8;
         addChild(this.sprite2);
         this.sprite3 = new Sprite();
         this.sprite3.x = 13;
         this.sprite3.y = 104;
         addChild(this.sprite3);
         this.sprite4 = new Sprite();
         this.sprite4.x = 286;
         this.sprite4.y = 104;
         addChild(this.sprite4);
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "previousButton";
         addChild(this.previousButton);
         this.previousButton.x = 140 + 8;
         this.previousButton.y = 222;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "nextButton";
         addChild(this.nextButton);
         this.nextButton.x = 225 + 8;
         this.nextButton.y = 222;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.dqcs = new FTextArea();
         with(this.dqcs)
         {
            multiline = true;
            filters = StaticValue.filter;
            defaultTextFormat = tf;
            width = 75;
            height = 16;
            x = 155 + 8;
            y = 222;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.dqcs);
         this.titleFta = new FTextArea();
         with(this.titleFta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 83;
            y = 244;
            textColor = StaticValue.ORANGE;
            htmlText = "<font size = \'15\'>" + LanResManager.getLanCommonTextWords("北冥神功") + "</font>";
         }
         addChild(this.titleFta);
         this.wuJiFta = new FTextArea();
         this.wuJiFta.x = 145;
         this.wuJiFta.y = 10;
         this.wuJiFta.textColor = StaticValue.GREEN;
         this.wuJiFta.width = 170;
         this.wuJiFta.height = 20;
         this.wuJiFta.htmlText = LanResManager.getLanCommonTextWords("北冥无极功法（已激活）");
         this.wuJiFta.visible = true;
         addChild(this.wuJiFta);
         this.miaoshuTitleFta = new FTextArea();
         with(this.miaoshuTitleFta)
         {
            filters = StaticValue.filter;
            width = 205;
            height = 100;
            wordWrap = true;
            x = 10;
            y = 265;
            textColor = StaticValue.GREEN;
            htmlText = "";
         }
         addChild(this.miaoshuTitleFta);
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.x = 280;
         this.check.y = 244;
         this.check.addEventListener(MouseEvent.CLICK,this.onShowClick);
         this.fta = new FTextArea();
         this.fta.addEventListener(MouseEvent.MOUSE_OVER,this.onFtaTip);
         this.fta.addEventListener(MouseEvent.MOUSE_OUT,this.onFtaTip);
         with(this.fta)
         {
            x = 300;
            y = 244;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("开启北冥神功使用");
         }
         addChild(this.fta);
         this.ftaTotal = new FTextArea();
         with(this.ftaTotal)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 230;
            y = 265;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanCommonTextWords("人物属性加成");
         }
         addChild(this.ftaTotal);
         this.fta2 = new FTextArea();
         with(this.fta2)
         {
            filters = StaticValue.filter;
            x = 230;
            y = 285;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.fta2);
         this.skillText = new FTextArea();
         with(this.skillText)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 333;
            y = 265;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanCommonTextWords("附带技能");
         }
         addChild(this.skillText);
         this.skillImg = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.skillImg);
         this.skillImg.x = 340;
         this.skillImg.y = 287;
         this.xiuLianBtn = new SmallButton();
         this.xiuLianBtn.label = LanResManager.getLanCommonTextWords("领悟本式");
         addChild(this.xiuLianBtn);
         this.xiuLianBtn.x = 337 - 15;
         this.xiuLianBtn.y = 336;
         this.xiuLianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.beiMingShenGongTupo = new BeiMingShenGongTupoCanvas();
         addChild(this.beiMingShenGongTupo);
         this.beiMingShenGongTupo._parent2 = this;
         this.beiMingShenGongTupo.x = 138;
         this.beiMingShenGongTupo.y = -10;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 410;
         $mask.y = -10;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,500,390);
            endFill();
         }
         this.beiMingShenGongTupo.mask = $mask;
         ToolTips.createToolTips(this.wuJiFta,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("北冥无极功法属性：") + "<br>" + LanResManager.getLanCommonTextWords("攻击8888888、防御 7888888、血量888888888 、暴击 8888、闪避8888 攻速 888、武功十二层") + "<br>" + LanResManager.getLanCommonTextWords("北冥无极：当玩家的内力低于20%时，将100%触发北冥无极状态，此状态下玩家将可以不消耗任何内") + "<br>" + LanResManager.getLanCommonTextWords("力依然不断发出各种强大的技能（使用技能不消耗任何内力）") + "</font>";
            return _loc1_ + "</textformat>";
         });
         addEventListener(UI_BEIMINGSHENGONG_GUANBI_CLICK,this.aa1);
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 7;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("重生心法（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性：：攻击5688888888900 防御4288888888900血量6088888888900暴击 88888闪避888888   所有武功1000000层") + "<br>" + LanResManager.getLanCommonTextWords("★  重生心法 ——  激活北冥神功重生心法的玩家，将100%抵抗五毒阵死亡宣言技能。且每攻击18次必定触发北冥心法效果，") + "<br>" + LanResManager.getLanCommonTextWords("在此效果下，每攻击对手一次降低对手的30%的当前血量伤害，效果持续5秒。");
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10 + 260;
         this.fts2.y = 7;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("北冥内功心法（已激活）");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性：攻击28888亿、防御26888亿、血量30888亿、所有武功提升 240000层") + "<br>" + LanResManager.getLanCommonTextWords("特殊属性：激活该秘籍后，可使用北冥石进行养成属性，每次可增加攻击200亿，所有武功提升10000层！（最多可养成5000次！）") + "<br>" + LanResManager.getLanCommonTextWords("当前已加成") + beimingshi + LanResManager.getLanCommonTextWords("次") + "<br>" + LanResManager.getLanCommonTextWords("攻击") + beimingshi * 200 + LanResManager.getLanCommonTextWords("亿，所有武功提升") + beimingshi * 10000 + LanResManager.getLanCommonTextWords("层") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.kuangSpr = new Sprite();
         this.equipContainers = new Sprite();
         this.equipContainers.x = 295 - 288;
         this.equipContainers.y = 322 - 73 + 1 - 40 - 45 + 30;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         addChild(this.equipContainers);
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuangSpr.addChild(this.kuangHD);
         this.kuangHD.x = 10;
         this.kuangHD.y = 266 - 2 - 1 - 10 - 40 - 45 + 30;
         this.fts3 = new FTextArea();
         this.fts3.x = 10 + 255 + 40;
         this.fts3.y = 7 + 20 + 105 + 90;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 110;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("哈雷军服");
         this.fts3.visible = false;
         addChild(this.fts3);
         this.checkHz = new FCheckBox();
         addChild(this.checkHz);
         this.checkHz.x = 256 + 117;
         this.checkHz.y = 7 + 20 + 105 + 90;
         this.checkHz.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts4 = new FTextArea();
         this.fts4.x = 10 + 255 + 40 - 215;
         this.fts4.y = 7 + 20 + 105 + 90 + 20 - 40;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 110;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("流星落（神器）");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击12888888889000 防御10888888889000 血量13888888889000暴击 88888闪避 88888所有武功3000000层") + "<br>" + LanResManager.getLanCommonTextWords("流星落：天降帝星陨石打造而成，其形状优美，刃可断发，能唤醒流星之力的刀。") + "<br>" + LanResManager.getLanCommonTextWords("流星陨落：攻击时100%触发流星陨落，持续10秒；在此状态下，每次攻击对手都会唤醒流星之力，无数陨石砸向对手，") + "<br>" + LanResManager.getLanCommonTextWords("对手命中后受到陨石火属性的伤害，10秒内无法使用任何武学及任何勋章效果；且受到火属性的灼烧使对手的移动速") + "<br>" + LanResManager.getLanCommonTextWords("度瞬间下降对1点；当状态解除后，对手全身溃烂瞬间下降80%血量，且晕倒原地10秒。冷却60秒") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.checkWq = new FCheckBox();
         addChild(this.checkWq);
         this.checkWq.visible = false;
         this.checkWq.x = 256 + 117 - 200;
         this.checkWq.y = 7 + 20 + 105 + 90 + 20 - 40;
         this.checkWq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts5 = new FTextArea();
         this.fts5.x = 10 + 255 + 40 - 300;
         this.fts5.y = 7 + 20 + 105 + 90 + 20;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 110;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("真龙转世");
         this.fts5.visible = false;
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击128888亿防御108888亿血量138888亿暴击 88888闪避 88888所有武功2500000层") + "<br>" + LanResManager.getLanCommonTextWords("真龙转世：上古龙神转世为龙，乃龙神之主，人物可自己召唤。") + "<br>" + LanResManager.getLanCommonTextWords("真龙：龙神之庇护，攻击时100%触发真龙庇护真元护体，持续30秒；在此状态下，自身") + "<br>" + LanResManager.getLanCommonTextWords("受到攻击时，都将100%抵抗对手的所有攻击能力和技能效果；且瞬间转返对手一个真元") + "<br>" + LanResManager.getLanCommonTextWords("BUFF，使对手的所有攻击能力和技能效果失效，持续10秒，不可清除。冷却60秒。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.checkDt = new FCheckBox();
         addChild(this.checkDt);
         this.checkDt.x = 256 + 117 - 300 - 13;
         this.checkDt.y = 7 + 20 + 105 + 90 + 20;
         this.checkDt.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts6 = new FTextArea();
         this.fts6.x = 10 + 255 + 40 - 155;
         this.fts6.y = 7 + 20 + 105 + 90 + 20;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 110;
         this.fts6.height = 20;
         this.fts6.htmlText = LanResManager.getLanCommonTextWords("真龙破隐秘录");
         this.fts6.visible = false;
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("真龙破隐秘录：开启真龙转世的玩家，可双击使用激活无所遁形秘籍，可永久获得无影秘技，") + "<br>" + LanResManager.getLanCommonTextWords("在此效果下，只要受到对手的攻击，只要对手是隐身状态的都可将对手立即显形，使对手无") + "<br>" + LanResManager.getLanCommonTextWords("遁形，且10秒内对手无法隐身。无所遁形无冷却，乃隐身之克星。") + "</font>";
            return _loc1_ + "</textformat>";
         });
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.checkHz:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkHz.selectState,13]));
               break;
            case this.checkWq:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkWq.selectState,93]));
               break;
            case this.checkDt:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkDt.selectState,92]));
         }
      }
      
      private function aa1(param1:BaseEvent) : void
      {
         this.onShowLv(false);
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._parent = param1;
         this.beiMingShenGongTupo._parent2 = param1;
         this.beiMingShenGongTupo._parent3 = this;
      }
      
      private function onFtaTip(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.fta.addEventListener(MouseEvent.MOUSE_MOVE,this.onFtaTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("北冥神功达到顶层才可以开启技能使用。") + "</font>");
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.fta.removeEventListener(MouseEvent.MOUSE_MOVE,this.onFtaTip);
         }
      }
      
      private function onPurpleTip1(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:RegExp = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               param1.currentTarget.addEventListener(MouseEvent.MOUSE_MOVE,this.onPurpleTip1);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "";
               _loc3_ = /,/g;
               if(this.jmJdNow >= this.jmJdMax)
               {
                  _loc2_ = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("经脉修炼进度已满") + "</font><br>";
                  if(this.yiLingWu - 1 == 18)
                  {
                     _loc2_ += "<font color=\'" + StaticValue.ORANGE_HTML + "\'>";
                  }
                  else
                  {
                     _loc2_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>";
                  }
                  _loc2_ += LanResManager.getLanCommonTextWords("北冥神功达到顶层额外加成") + "<br>" + this.tips1.replace(_loc3_,"<br>") + "</font>";
               }
               else
               {
                  _loc2_ = LanResManager.getLanCommonTextWords("经脉修炼进度") + this.jmJdNow + "/" + this.jmJdMax + "<br><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("经脉修炼进度未满") + "</font><br>" + LanResManager.getLanCommonTextWords("北冥神功达到顶层额外加成") + "<br>" + this.tips1.replace(_loc3_,"<br>");
               }
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               param1.currentTarget.removeEventListener(MouseEvent.MOUSE_MOVE,this.onPurpleTip1);
         }
      }
      
      private function onPurpleTip2(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:RegExp = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               param1.currentTarget.addEventListener(MouseEvent.MOUSE_MOVE,this.onPurpleTip2);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "";
               _loc3_ = /,/g;
               if(this.dtJdNow == this.dtJdMax)
               {
                  _loc2_ = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("丹田修炼进度已满") + "</font><br>";
                  if(this.yiLingWu - 1 == 18)
                  {
                     _loc2_ += "<font color=\'" + StaticValue.ORANGE_HTML + "\'>";
                  }
                  else
                  {
                     _loc2_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>";
                  }
                  _loc2_ += LanResManager.getLanCommonTextWords("北冥神功达到顶层额外加成") + "<br>" + this.tips2.replace(_loc3_,"<br>") + "</font>";
               }
               else
               {
                  _loc2_ = LanResManager.getLanCommonTextWords("丹田修炼进度") + this.dtJdNow + "/" + this.dtJdMax + "<br><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("丹田修炼进度未满") + "</font><br>" + LanResManager.getLanCommonTextWords("北冥神功达到顶层额外加成") + "<br>" + this.tips2.replace(_loc3_,"<br>");
               }
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               param1.currentTarget.removeEventListener(MouseEvent.MOUSE_MOVE,this.onPurpleTip2);
         }
      }
      
      private function onPurpleTip3(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:RegExp = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               param1.currentTarget.addEventListener(MouseEvent.MOUSE_MOVE,this.onPurpleTip3);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "";
               _loc3_ = /,/g;
               if(this.qhJdNow == this.qhJdMax)
               {
                  _loc2_ = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("气海修炼进度已满") + "</font><br>";
                  if(this.yiLingWu - 1 == 18)
                  {
                     _loc2_ += "<font color=\'" + StaticValue.ORANGE_HTML + "\'>";
                  }
                  else
                  {
                     _loc2_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>";
                  }
                  _loc2_ += LanResManager.getLanCommonTextWords("北冥神功达到顶层额外加成") + "<br>" + this.tips3.replace(_loc3_,"<br>") + "</font>";
               }
               else
               {
                  _loc2_ = LanResManager.getLanCommonTextWords("气海修炼进度") + this.qhJdNow + "/" + this.qhJdMax + "<br><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("气海修炼进度未满") + "</font><br>" + LanResManager.getLanCommonTextWords("北冥神功达到顶层额外加成") + "<br>" + this.tips3.replace(_loc3_,"<br>");
               }
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               param1.currentTarget.removeEventListener(MouseEvent.MOUSE_MOVE,this.onPurpleTip3);
         }
      }
      
      private function onPurpleTip4(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:RegExp = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               param1.currentTarget.addEventListener(MouseEvent.MOUSE_MOVE,this.onPurpleTip4);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "";
               _loc3_ = /,/g;
               if(this.rsJdNow == this.rsJdMax)
               {
                  _loc2_ = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("肉身修炼进度已满") + "</font><br>";
                  if(this.yiLingWu - 1 == 18)
                  {
                     _loc2_ += "<font color=\'" + StaticValue.ORANGE_HTML + "\'>";
                  }
                  else
                  {
                     _loc2_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>";
                  }
                  _loc2_ += LanResManager.getLanCommonTextWords("北冥神功达到顶层额外加成") + "<br>" + this.tips4.replace(_loc3_,"<br>") + "</font>";
               }
               else
               {
                  _loc2_ = LanResManager.getLanCommonTextWords("肉身修炼进度") + this.rsJdNow + "/" + this.rsJdMax + "<br><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("肉身修炼进度未满") + "</font><br>" + LanResManager.getLanCommonTextWords("北冥神功达到顶层额外加成") + "<br>" + this.tips4.replace(_loc3_,"<br>");
               }
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               param1.currentTarget.removeEventListener(MouseEvent.MOUSE_MOVE,this.onPurpleTip4);
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
      
      private function onShowClick(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SHIFOUSHIYONGBEIMINGSHENGONG_CLICK,"",this.check.selectState));
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.previousButton:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_BEIMINGSHENGONG_PREVIOUS_CLICK));
               break;
            case this.nextButton:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_BEIMINGSHENGONG_NEXT_CLICK));
               break;
            case this.xiuLianBtn:
               if(this.tupoBo)
               {
                  return;
               }
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_BEIMINGSHENGONG_XIULIAN_CLICK));
         }
      }
      
      public function initializateBmsgPanel(param1:Boolean, param2:BeiMingShenGongVO) : void
      {
         this.checkHz.selectState = param2.isHuanZhuang;
         this.checkWq.selectState = param2.isWuQi;
         this.checkDt.selectState = param2.isDanTian;
         this.isMain = param1;
         this.removeMc();
         this.setTips(param2.jingMaiMiaoShu,param2.danTianMiaoShu,param2.qiHaiMiaoShu,param2.rouShenMiaoShu);
         this.setZhenqiJinduNum(param2.curJingMai,param2.maxJingMai,param2.curDanTian,param2.maxDanTian,param2.curQiHai,param2.maxQiHai,param2.curRouShen,param2.maxRouShen);
         this.setZhaoShiMsg(param2.nowLookingName,param2.nowLookingID,param2.nowID + 1);
         this.setBeimingshengongMiaoshu(param2.miaoshu);
         this.showBeiMingShenGongApd(param2.isUseJiNeng);
         this.setBeiMingShenGongShuxing(param2.isUseDan,param2.act,param2.def,param2.hp,param2.mp);
         this.setSkill(param2.skill,param2.isCanUse);
         this.setWuJiGongFa(param2.wuJiGongFa);
         this.setJiHuo(param1);
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.BEIMINGSHENGONG_CHONGSHENG_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.BEIMINGSHENGONG_NEIGONG_ID];
            this.beimingshi = GameState.dictMainStatus[SpecialGoodsID.BEIMINGSHENGONG_BEIMINGSHI_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.BEIMINGSHENGONG_HALEIJUNFU_ID])
            {
               this.fts3.visible = true;
               this.checkHz.visible = true;
            }
            else
            {
               this.fts3.visible = false;
               this.checkHz.visible = false;
            }
            this.fts5.visible = GameState.dictMainStatus[SpecialGoodsID.BEIMINGSHENGONG_ZHENLONGZHUANSHI_ID];
            this.checkDt.visible = GameState.dictMainStatus[SpecialGoodsID.BEIMINGSHENGONG_ZHENLONGZHUANSHI_ID];
            this.fts6.visible = GameState.dictMainStatus[SpecialGoodsID.BEIMINGSHENGONG_ZHENLONGPOYINMILU_ID];
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.BEIMINGSHENGONG_CHONGSHENG_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.BEIMINGSHENGONG_NEIGONG_ID];
            this.beimingshi = GameState.dictTargetStatus[SpecialGoodsID.BEIMINGSHENGONG_BEIMINGSHI_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.BEIMINGSHENGONG_HALEIJUNFU_ID])
            {
               this.fts3.visible = true;
               this.checkHz.visible = true;
            }
            else
            {
               this.fts3.visible = false;
               this.checkHz.visible = false;
            }
            this.fts5.visible = GameState.dictTargetStatus[SpecialGoodsID.BEIMINGSHENGONG_ZHENLONGZHUANSHI_ID];
            this.checkDt.visible = GameState.dictTargetStatus[SpecialGoodsID.BEIMINGSHENGONG_ZHENLONGZHUANSHI_ID];
            this.fts6.visible = GameState.dictTargetStatus[SpecialGoodsID.BEIMINGSHENGONG_ZHENLONGPOYINMILU_ID];
         }
      }
      
      public function setWuJiGongFa(param1:Boolean) : void
      {
         if(param1)
         {
            this.wuJiFta.textColor = StaticValue.GREEN;
            this.wuJiFta.htmlText = LanResManager.getLanCommonTextWords("北冥无极功法(已激活)");
         }
         else
         {
            this.wuJiFta.textColor = StaticValue.RED;
            this.wuJiFta.htmlText = LanResManager.getLanCommonTextWords("北冥无极功法(未激活)");
         }
      }
      
      public function set avatar(param1:BitmapData) : void
      {
         this._avatar.bitmapData = param1;
         if(!param1)
         {
            return;
         }
         this.movingJS();
      }
      
      private function movingJS() : void
      {
         var moving:Function = null;
         var moving2:Function = null;
         moving = function():void
         {
            if(juseSprite.y == 80)
            {
               TweenMax.to(juseSprite,2,{
                  "y":103,
                  "onComplete":moving2
               });
            }
         };
         moving2 = function():void
         {
            if(juseSprite.y == 103)
            {
               TweenMax.to(juseSprite,2,{
                  "y":80,
                  "onComplete":moving
               });
            }
         };
         if(this.juseSprite.numChildren == 0)
         {
            return;
         }
         if(this.juseSprite.y == 103)
         {
            TweenMax.to(this.juseSprite,2,{
               "y":80,
               "onComplete":moving
            });
         }
      }
      
      public function removeMc() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < 9)
         {
            if(_loc1_ == 0)
            {
               if(Boolean(this.gongMc) && this.gongMc.parent != null)
               {
                  this.gongMc.stop();
                  this.gongMc.parent.removeChild(this.gongMc);
               }
            }
            else if(Boolean(this["gongMc" + _loc1_]) && this["gongMc" + _loc1_].parent != null)
            {
               this["gongMc" + _loc1_].stop();
               this["gongMc" + _loc1_].parent.removeChild(this["gongMc" + _loc1_]);
            }
            _loc1_++;
         }
         if(Boolean(this.jingmaiCircle) && this.jingmaiCircle.parent != null)
         {
            this.jingmaiCircle.parent.removeChild(this.jingmaiCircle);
         }
         if(Boolean(this.dantianCircle) && this.dantianCircle.parent != null)
         {
            this.dantianCircle.parent.removeChild(this.dantianCircle);
         }
         if(Boolean(this.qihaiCircle) && this.qihaiCircle.parent != null)
         {
            this.qihaiCircle.parent.removeChild(this.qihaiCircle);
         }
         if(Boolean(this.roushenCircle) && this.roushenCircle.parent != null)
         {
            this.roushenCircle.parent.removeChild(this.roushenCircle);
         }
      }
      
      private function setTips(param1:String, param2:String, param3:String, param4:String) : void
      {
         this.tips1 = param1;
         this.tips2 = param2;
         this.tips3 = param3;
         this.tips4 = param4;
      }
      
      private function setZhenqiJinduNum(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int) : void
      {
         var int1:int = param1;
         var int2:int = param2;
         var int3:int = param3;
         var int4:int = param4;
         var int5:int = param5;
         var int6:int = param6;
         var int7:int = param7;
         var int8:int = param8;
         this.jmJdNow = int1;
         this.jmJdMax = int2;
         this.dtJdNow = int3;
         this.dtJdMax = int4;
         this.qhJdNow = int5;
         this.qhJdMax = int6;
         this.rsJdNow = int7;
         this.rsJdMax = int8;
         if(int1 >= int2)
         {
            this.loadUrl5 = GameConfig.fileBaseFolder + "res/data/mc/beimingshengong/jingmai" + ".swf";
            if(this.mcObj6[1] != null)
            {
               if(Boolean(this.gongMc5) && this.gongMc5.parent != null)
               {
                  this.gongMc5.stop();
                  this.gongMc5.parent.removeChild(this.gongMc5);
               }
               this.gongMc5 = this.mcObj6[1];
               this.gongMc5.play();
               this.sprite1.addChild(this.gongMc5);
            }
            else
            {
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  if(_loc2_.url.url != loadUrl5)
                  {
                     return;
                  }
                  if(Boolean(gongMc5) && gongMc5.parent != null)
                  {
                     gongMc5.stop();
                     gongMc5.parent.removeChild(gongMc5);
                  }
                  gongMc5 = _loc2_.content as MovieClip;
                  mcObj6[1] = gongMc5;
                  if(gongMc5)
                  {
                     gongMc5.play();
                     sprite1.addChild(gongMc5);
                     sprite1.addEventListener(MouseEvent.MOUSE_OVER,onPurpleTip1);
                     sprite1.addEventListener(MouseEvent.MOUSE_OUT,onPurpleTip1);
                  }
               },null,false,this.loadUrl5);
            }
         }
         else
         {
            this.jingmaiCircle = StaticValue.getMCByClassName("ui.main.function.circle.purple1") as MovieClip;
            addChild(this.jingmaiCircle);
            this.jingmaiCircle.x = 48;
            this.jingmaiCircle.y = 36;
            this.jingmaiCircle.gotoAndStop(50);
            this.jingmaiCircle.addEventListener(MouseEvent.MOUSE_OVER,this.onPurpleTip1);
            this.jingmaiCircle.addEventListener(MouseEvent.MOUSE_OUT,this.onPurpleTip1);
            this.jingmaiCircle.gotoAndStop(int(int1 / int2 * 100));
         }
         if(int3 == int4)
         {
            this.loadUrl6 = GameConfig.fileBaseFolder + "res/data/mc/beimingshengong/dantian" + ".swf";
            if(this.mcObj7[1] != null)
            {
               if(Boolean(this.gongMc6) && this.gongMc6.parent != null)
               {
                  this.gongMc6.stop();
                  this.gongMc6.parent.removeChild(this.gongMc6);
               }
               this.gongMc6 = this.mcObj7[1];
               this.gongMc6.play();
               this.sprite2.addChild(this.gongMc6);
            }
            else
            {
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  if(_loc2_.url.url != loadUrl6)
                  {
                     return;
                  }
                  if(Boolean(gongMc6) && gongMc6.parent != null)
                  {
                     gongMc6.stop();
                     gongMc6.parent.removeChild(gongMc6);
                  }
                  gongMc6 = _loc2_.content as MovieClip;
                  mcObj7[1] = gongMc6;
                  if(gongMc6)
                  {
                     gongMc6.play();
                     sprite2.addChild(gongMc6);
                     sprite2.addEventListener(MouseEvent.MOUSE_OVER,onPurpleTip2);
                     sprite2.addEventListener(MouseEvent.MOUSE_OUT,onPurpleTip2);
                  }
               },null,false,this.loadUrl6);
            }
         }
         else
         {
            this.dantianCircle = StaticValue.getMCByClassName("ui.main.function.circle.purple2") as MovieClip;
            addChild(this.dantianCircle);
            this.dantianCircle.x = 298;
            this.dantianCircle.y = 36;
            this.dantianCircle.gotoAndStop(50);
            this.dantianCircle.addEventListener(MouseEvent.MOUSE_OVER,this.onPurpleTip2);
            this.dantianCircle.addEventListener(MouseEvent.MOUSE_OUT,this.onPurpleTip2);
            this.dantianCircle.gotoAndStop(int(int3 / int4 * 100));
         }
         if(int5 == int6)
         {
            this.loadUrl7 = GameConfig.fileBaseFolder + "res/data/mc/beimingshengong/qihai" + ".swf";
            if(this.mcObj8[1] != null)
            {
               if(Boolean(this.gongMc7) && this.gongMc7.parent != null)
               {
                  this.gongMc7.stop();
                  this.gongMc7.parent.removeChild(this.gongMc7);
               }
               this.gongMc7 = this.mcObj8[1];
               this.gongMc7.play();
               this.sprite3.addChild(this.gongMc7);
            }
            else
            {
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  if(_loc2_.url.url != loadUrl7)
                  {
                     return;
                  }
                  if(Boolean(gongMc7) && gongMc7.parent != null)
                  {
                     gongMc7.stop();
                     gongMc7.parent.removeChild(gongMc7);
                  }
                  gongMc7 = _loc2_.content as MovieClip;
                  mcObj8[1] = gongMc7;
                  if(gongMc7)
                  {
                     gongMc7.play();
                     sprite3.addChild(gongMc7);
                     sprite3.addEventListener(MouseEvent.MOUSE_OVER,onPurpleTip3);
                     sprite3.addEventListener(MouseEvent.MOUSE_OUT,onPurpleTip3);
                  }
               },null,false,this.loadUrl7);
            }
         }
         else
         {
            this.qihaiCircle = StaticValue.getMCByClassName("ui.main.function.circle.purple3") as MovieClip;
            addChild(this.qihaiCircle);
            this.qihaiCircle.x = 36;
            this.qihaiCircle.y = 132;
            this.qihaiCircle.gotoAndStop(50);
            this.qihaiCircle.addEventListener(MouseEvent.MOUSE_OVER,this.onPurpleTip3);
            this.qihaiCircle.addEventListener(MouseEvent.MOUSE_OUT,this.onPurpleTip3);
            this.qihaiCircle.gotoAndStop(int(int5 / int6 * 100));
         }
         if(int7 == int8)
         {
            this.loadUrl8 = GameConfig.fileBaseFolder + "res/data/mc/beimingshengong/roushen" + ".swf";
            if(this.mcObj9[1] != null)
            {
               if(Boolean(this.gongMc8) && this.gongMc8.parent != null)
               {
                  this.gongMc8.stop();
                  this.gongMc8.parent.removeChild(this.gongMc8);
               }
               this.gongMc8 = this.mcObj9[1];
               this.gongMc8.play();
               this.sprite4.addChild(this.gongMc8);
            }
            else
            {
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  if(_loc2_.url.url != loadUrl8)
                  {
                     return;
                  }
                  if(Boolean(gongMc8) && gongMc8.parent != null)
                  {
                     gongMc8.stop();
                     gongMc8.parent.removeChild(gongMc8);
                  }
                  gongMc8 = _loc2_.content as MovieClip;
                  mcObj9[1] = gongMc8;
                  if(gongMc8)
                  {
                     gongMc8.play();
                     sprite4.addChild(gongMc8);
                     sprite4.addEventListener(MouseEvent.MOUSE_OVER,onPurpleTip4);
                     sprite4.addEventListener(MouseEvent.MOUSE_OUT,onPurpleTip4);
                  }
               },null,false,this.loadUrl8);
            }
         }
         else
         {
            this.roushenCircle = StaticValue.getMCByClassName("ui.main.function.circle.purple4") as MovieClip;
            addChild(this.roushenCircle);
            this.roushenCircle.x = 310;
            this.roushenCircle.y = 132;
            this.roushenCircle.gotoAndStop(50);
            this.roushenCircle.addEventListener(MouseEvent.MOUSE_OVER,this.onPurpleTip4);
            this.roushenCircle.addEventListener(MouseEvent.MOUSE_OUT,this.onPurpleTip4);
            this.roushenCircle.gotoAndStop(int(int7 / int8 * 100));
         }
      }
      
      private function setZhaoShiMsg(param1:String, param2:int, param3:int) : void
      {
         var str1:String = param1;
         var int1:int = param2;
         var int2:int = param3;
         this.nowCs = int1;
         this.dqcs.htmlText = str1;
         this.nowID = int1;
         this.yiLingWu = int2;
         if(int1 == 1)
         {
            this.previousButton.enabled = false;
         }
         else
         {
            this.previousButton.enabled = true;
         }
         if(int1 == 18)
         {
            this.nextButton.enabled = false;
         }
         else
         {
            this.nextButton.enabled = true;
         }
         if(int1 == int2)
         {
            this.xiuLianBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
            this.xiuLianBtn.x = 337;
            this.xiuLianBtn.enabled = true;
         }
         else if(int1 < int2)
         {
            this.xiuLianBtn.label = LanResManager.getLanCommonTextWords("已领悟");
            this.xiuLianBtn.x = 338;
            this.xiuLianBtn.enabled = false;
         }
         else
         {
            this.xiuLianBtn.label = LanResManager.getLanCommonTextWords("未领悟");
            this.xiuLianBtn.x = 337 - 15;
            this.xiuLianBtn.enabled = false;
         }
         if(this.gongImg != null && this.gongImg.parent != null)
         {
            removeChild(this.gongImg);
         }
         if(int1 == 0)
         {
            if(this.gongImgObj[1] != null)
            {
               this.gongImg = this.gongImgObj[1];
            }
            else
            {
               this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/beimingshengong/" + int1 + ".jpg",401,244);
               this.gongImgObj[1] = this.gongImg;
            }
         }
         else if(this.gongImgObj[int1] != null)
         {
            this.gongImg = this.gongImgObj[int1];
         }
         else
         {
            this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/beimingshengong/" + int1 + ".jpg",401,244);
            this.gongImgObj[int1] = this.gongImg;
         }
         addChildAt(this.gongImg,0);
         if(int2 - 1 == 18)
         {
            this.loadUrl = GameConfig.fileBaseFolder + "res/data/mc/beimingshengong/juese" + ".swf";
            if(this.mcObj1[1] != null)
            {
               if(Boolean(this.gongMc) && this.gongMc.parent != null)
               {
                  this.gongMc.stop();
                  this.gongMc.parent.removeChild(this.gongMc);
               }
               this.gongMc = this.mcObj1[1];
               this.gongMc.play();
               this.gongMc.x = 171;
               this.gongMc.y = -68;
               this.juseSprite.addChildAt(this.gongMc,0);
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
                  mcObj1[1] = gongMc;
                  if(gongMc)
                  {
                     gongMc.play();
                     gongMc.x = 173;
                     gongMc.y = -68;
                     juseSprite.addChildAt(gongMc,0);
                  }
               },null,false,this.loadUrl);
            }
            this.movingJS();
         }
         if(this.jmJdNow >= this.jmJdMax && int2 - 1 == 18)
         {
            this.loadUrl1 = GameConfig.fileBaseFolder + "res/data/mc/beimingshengong/zuoshang" + ".swf";
            if(this.mcObj2[1] != null)
            {
               if(Boolean(this.gongMc1) && this.gongMc1.parent != null)
               {
                  this.gongMc1.stop();
                  this.gongMc1.parent.removeChild(this.gongMc1);
               }
               this.gongMc1 = this.mcObj2[1];
               this.gongMc1.play();
               this.gongMc1.x = 65;
               this.gongMc1.y = 35;
               addChildAt(this.gongMc1,2);
            }
            else
            {
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  if(_loc2_.url.url != loadUrl1)
                  {
                     return;
                  }
                  if(Boolean(gongMc1) && gongMc1.parent != null)
                  {
                     gongMc1.stop();
                     gongMc1.parent.removeChild(gongMc1);
                  }
                  gongMc1 = _loc2_.content as MovieClip;
                  mcObj2[1] = gongMc1;
                  if(gongMc1)
                  {
                     gongMc1.play();
                     gongMc1.x = 65;
                     gongMc1.y = 35;
                     addChildAt(gongMc1,2);
                  }
               },null,false,this.loadUrl1);
            }
         }
         if(this.dtJdNow == this.dtJdMax && int2 - 1 == 18)
         {
            this.loadUrl2 = GameConfig.fileBaseFolder + "res/data/mc/beimingshengong/youshang" + ".swf";
            if(this.mcObj3[1] != null)
            {
               if(Boolean(this.gongMc2) && this.gongMc2.parent != null)
               {
                  this.gongMc2.stop();
                  this.gongMc2.parent.removeChild(this.gongMc2);
               }
               this.gongMc2 = this.mcObj3[1];
               this.gongMc2.play();
               this.gongMc2.x = 180;
               this.gongMc2.y = 30;
               addChildAt(this.gongMc2,2);
            }
            else
            {
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  if(_loc2_.url.url != loadUrl2)
                  {
                     return;
                  }
                  if(Boolean(gongMc2) && gongMc2.parent != null)
                  {
                     gongMc2.stop();
                     gongMc2.parent.removeChild(gongMc2);
                  }
                  gongMc2 = _loc2_.content as MovieClip;
                  mcObj3[1] = gongMc2;
                  if(gongMc2)
                  {
                     gongMc2.play();
                     gongMc2.x = 180;
                     gongMc2.y = 30;
                     addChildAt(gongMc2,2);
                  }
               },null,false,this.loadUrl2);
            }
         }
         if(this.qhJdNow == this.qhJdMax && int2 - 1 == 18)
         {
            this.loadUrl3 = GameConfig.fileBaseFolder + "res/data/mc/beimingshengong/zuoxia" + ".swf";
            if(this.mcObj4[1] != null)
            {
               if(Boolean(this.gongMc3) && this.gongMc3.parent != null)
               {
                  this.gongMc3.stop();
                  this.gongMc3.parent.removeChild(this.gongMc3);
               }
               this.gongMc3 = this.mcObj4[1];
               this.gongMc3.play();
               this.gongMc3.x = 60;
               this.gongMc3.y = 75;
               addChildAt(this.gongMc3,2);
            }
            else
            {
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  if(_loc2_.url.url != loadUrl3)
                  {
                     return;
                  }
                  if(Boolean(gongMc3) && gongMc3.parent != null)
                  {
                     gongMc3.stop();
                     gongMc3.parent.removeChild(gongMc3);
                  }
                  gongMc3 = _loc2_.content as MovieClip;
                  mcObj4[1] = gongMc3;
                  if(gongMc3)
                  {
                     gongMc3.play();
                     gongMc3.x = 60;
                     gongMc3.y = 75;
                     addChildAt(gongMc3,2);
                  }
               },null,false,this.loadUrl3);
            }
         }
         if(this.rsJdNow == this.rsJdMax && int2 - 1 == 18)
         {
            this.loadUrl4 = GameConfig.fileBaseFolder + "res/data/mc/beimingshengong/youxia" + ".swf";
            if(this.mcObj5[1] != null)
            {
               if(Boolean(this.gongMc4) && this.gongMc4.parent != null)
               {
                  this.gongMc4.stop();
                  this.gongMc4.parent.removeChild(this.gongMc4);
               }
               this.gongMc4 = this.mcObj5[1];
               this.gongMc4.play();
               this.gongMc4.x = 185;
               this.gongMc4.y = 85;
               addChildAt(this.gongMc4,2);
            }
            else
            {
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  if(_loc2_.url.url != loadUrl4)
                  {
                     return;
                  }
                  if(Boolean(gongMc4) && gongMc4.parent != null)
                  {
                     gongMc4.stop();
                     gongMc4.parent.removeChild(gongMc4);
                  }
                  gongMc4 = _loc2_.content as MovieClip;
                  mcObj5[1] = gongMc4;
                  if(gongMc4)
                  {
                     gongMc4.play();
                     gongMc4.x = 185;
                     gongMc4.y = 85;
                     addChildAt(gongMc4,2);
                  }
               },null,false,this.loadUrl4);
            }
         }
      }
      
      private function setBeimingshengongMiaoshu(param1:String) : void
      {
         this.miaoshuTitleFta.htmlText = param1;
      }
      
      public function showBeiMingShenGongApd(param1:Boolean) : void
      {
         this.check.selectState = param1;
      }
      
      private function setBeiMingShenGongShuxing(param1:Boolean, param2:int, param3:int, param4:int, param5:int) : void
      {
         var _loc6_:String = "";
         if(param1 && this.nowCs == 18)
         {
            _loc6_ = "<textformat leading=\'4\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：+") + param2 + " " + "X" + " 2" + "<br>" + LanResManager.getLanCommonTextWords("防御：+") + param3 + " " + "X" + " 2" + "<br>" + LanResManager.getLanCommonTextWords("生命：+") + param4 + " " + "X" + " 2" + "<br>" + LanResManager.getLanCommonTextWords("内力：+") + param5 + "<br>" + "</font></textformat>";
         }
         else
         {
            _loc6_ = "<textformat leading=\'4\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：+") + param2 + "<br>" + LanResManager.getLanCommonTextWords("防御：+") + param3 + "<br>" + LanResManager.getLanCommonTextWords("生命：+") + param4 + "<br>" + LanResManager.getLanCommonTextWords("内力：+") + param5 + "<br>" + "</font></textformat>";
         }
         this.fta2.htmlText = _loc6_;
      }
      
      private function setSkill(param1:Skill, param2:Boolean) : void
      {
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         if(param2)
         {
            param1.isLearn = 1;
         }
         else
         {
            param1.isLearn = 0;
         }
         this.item = new ItemFace(param1);
         this.item.setShowCount(false);
         this.item.x = 342;
         this.item.y = 289;
         addChild(this.item);
         if(param2)
         {
            this.item.filters = [];
            this.check.enabled = true;
         }
         else
         {
            this.item.filters = Tools.blackWhiteFilter;
            this.check.enabled = false;
         }
      }
      
      public function onShowLv(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.beiMingShenGongTupo.x == 138)
            {
               TweenMax.to(this.beiMingShenGongTupo,1,{"x":410});
               this.tupoBo = true;
               this.xiuLianBtn.enabled = false;
               this.previousButton.enabled = false;
               this.nextButton.enabled = false;
            }
         }
         else if(this.beiMingShenGongTupo.x == 410)
         {
            TweenMax.to(this.beiMingShenGongTupo,1,{"x":138});
            this.tupoBo = false;
            this.xiuLianBtn.enabled = true;
            if(this.nowID == 1)
            {
               this.previousButton.enabled = false;
            }
            else
            {
               this.previousButton.enabled = true;
            }
            if(this.nowID == 18)
            {
               this.nextButton.enabled = false;
            }
            else
            {
               this.nextButton.enabled = true;
            }
            this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_BEIMINGSHENGONG_ZIDONGTISHENG_CLICKJ,"",false));
         }
      }
      
      public function setInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         this.beiMingShenGongTupo.setInitialize(param1,param2,param3,param4,param5,param6);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.beiMingShenGongTupo.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.beiMingShenGongTupo.setGoods(param1,param2);
      }
      
      public function setShuoming(param1:String, param2:String) : void
      {
         this.beiMingShenGongTupo.setShuoming(param1,param2);
      }
      
      public function setBtn(param1:Boolean) : void
      {
         this.beiMingShenGongTupo.setBtn(param1);
      }
      
      public function setBeiMingShenGongEnabledFun() : void
      {
         this.xiuLianBtn.enabled = false;
         this.previousButton.enabled = false;
         this.nextButton.enabled = false;
         this.check.enabled = false;
      }
      
      public function isBeiMingShenGongtupoCanvasShow() : Boolean
      {
         if(this.beiMingShenGongTupo.x == 410)
         {
            return true;
         }
         return false;
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         if(this.isMain)
         {
            this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function set_BeiMingShenGong(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.equipContainers.numChildren > 0)
         {
            this.equipContainers.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            if(_loc3_.res.position == ItemPositionRange.POSTION_BEIMINGSHENGONG_DIHUANGYUXI)
            {
               _loc4_.x = 4 + 1;
               _loc4_.y = 4 + 1;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_BEIMINGSHENGONG_LIUXINGLUO)
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.equipContainers.addChild(this.kuangHD);
               this.kuangHD.x = 5 - 2 + 40;
               this.kuangHD.y = 5 - 2;
               _loc4_.x = 4 + 1 + 40;
               _loc4_.y = 4 + 1;
               this.equipContainers.addChild(_loc4_);
               if(_loc4_ != null)
               {
                  this.checkWq.visible = true;
                  this.fts4.visible = true;
               }
               else
               {
                  this.checkWq.visible = false;
                  this.fts4.visible = false;
               }
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_LIHEJUEDAFAXUNZHANG)
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.equipContainers.addChild(this.kuangHD);
               this.kuangHD.x = 344;
               this.kuangHD.y = -185;
               _loc4_.x = 346;
               _loc4_.y = -183;
               this.equipContainers.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
   }
}

