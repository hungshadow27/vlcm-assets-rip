package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.utils.getDefinitionByName;
   
   public class YunCheng extends Sprite
   {
      
      public var _parent:DisplayObject;
      
      private var fc1:FCanvas;
      
      private var btn1:SimpleButton;
      
      private var $class:Class;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var spr:Sprite;
      
      private var shujuArr:Array;
      
      private var shuoming:SecondButton;
      
      private var jihuoBtn:SecondButton;
      
      private var ft:FTextArea;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var ft3:FTextArea;
      
      private var item:ItemFace;
      
      private var jihuoId:int;
      
      private var yanhuaMc:MovieClip;
      
      public var bgImg:Bitmap;
      
      private var img:Bitmap;
      
      private var shuomingPanel:YunchengShuomingPanel;
      
      private var line:Bitmap;
      
      private var lineSpr:Sprite;
      
      private var zuanzhong:Bitmap;
      
      private var xuanzhongSpr:Sprite;
      
      private var dangqianMc:MovieClip;
      
      private var tarenPd:Boolean = true;
      
      private var yunchengSprite:Sprite;
      
      private var bg:DisplayObject;
      
      private var ft4:FTextArea;
      
      private var redBg:DisplayObject;
      
      private var redSprite:Sprite;
      
      private var dayCount:Number = 0;
      
      private var tiandaoCount:Number = 0;
      
      private var fts:FTextArea;
      
      private var tz1:int = 0;
      
      private var tz2:int = 0;
      
      private var tz3:int = 0;
      
      private var tz4:int = 0;
      
      private var tz5:int = 0;
      
      private var tz6:int = 0;
      
      private var tz7:int = 0;
      
      private var tz8:int = 0;
      
      private var tz9:int = 0;
      
      private var tz10:int = 0;
      
      private var tz11:int = 0;
      
      private var tz12:int = 0;
      
      private var fts1:FTextArea;
      
      private var equipContainers:Sprite;
      
      private var isMain:Boolean;
      
      private var kuangHD:Bitmap;
      
      private var kuangSpr:Sprite;
      
      private var fts3:FTextArea;
      
      private var checkZq1:FCheckBox;
      
      private var checkZq2:FCheckBox;
      
      private var fts4:FTextArea;
      
      public function YunCheng()
      {
         var maskSpr:Sprite;
         super();
         this.fc1 = new FCanvas();
         this.fc1.x = 0;
         this.fc1.y = 0;
         this.fc1.width = 404;
         this.fc1.height = 365;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.bgImg = new Bitmap();
         this.bgImg.name = "ui.yuncheng.bg";
         addChild(this.bgImg);
         this.bgImg.x = 2;
         this.bgImg.y = 2;
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         this.tip.x = 2;
         this.tip.y = 2;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.textColor = StaticValue.WHITE;
         this.tip.filters = StaticValue.filter;
         this.tipCanvas.addChild(this.tip);
         maskSpr = new Sprite();
         maskSpr.x = 0;
         maskSpr.y = 0;
         maskSpr.graphics.beginFill(0,1);
         maskSpr.graphics.drawRect(0,0,400,360);
         addChild(maskSpr);
         this.redSprite = new Sprite();
         this.redSprite.x = 10;
         this.redSprite.y = -40;
         this.redSprite.mask = maskSpr;
         addChild(this.redSprite);
         this.ft = new FTextArea();
         this.ft.x = 6;
         this.ft.y = 306;
         this.ft.autoSize = TextFieldAutoSize.LEFT;
         this.ft.textColor = StaticValue.ORANGE;
         this.ft.filters = StaticValue.filter;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("人物属性加成：");
         addChild(this.ft);
         this.ft4 = new FTextArea();
         this.ft4.x = 6 + 90;
         this.ft4.y = 306;
         this.ft4.autoSize = TextFieldAutoSize.LEFT;
         this.ft4.textColor = StaticValue.GREEN;
         this.ft4.filters = StaticValue.filter;
         this.ft4.text = LanResManager.getLanCommonTextWords("无极乾坤隐藏属性（已激活）");
         this.ft4.visible = false;
         addChild(this.ft4);
         ToolTips.createToolTips(this.ft4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("无极乾坤隐藏属性已激活") + "<br>" + LanResManager.getLanCommonTextWords("无极乾坤每次转动一圈（24小时），都将可以提升人物攻击2000000、防御1000000、血量10000000、所有武功提升8层。") + "<br>" + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.ft1 = new FTextArea();
         this.ft1.x = 6;
         this.ft1.y = 323;
         this.ft1.autoSize = TextFieldAutoSize.LEFT;
         this.ft1.textColor = StaticValue.SKY_BLUE;
         this.ft1.filters = StaticValue.filter;
         addChild(this.ft1);
         this.ft2 = new FTextArea();
         this.ft2.x = 125;
         this.ft2.y = 323;
         this.ft2.autoSize = TextFieldAutoSize.LEFT;
         this.ft2.textColor = StaticValue.SKY_BLUE;
         this.ft2.filters = StaticValue.filter;
         addChild(this.ft2);
         this.ft3 = new FTextArea();
         this.ft3.x = 245;
         this.ft3.y = 323;
         this.ft3.autoSize = TextFieldAutoSize.LEFT;
         this.ft3.textColor = StaticValue.SKY_BLUE;
         this.ft3.filters = StaticValue.filter;
         addChild(this.ft3);
         this.yunchengSprite = new Sprite();
         addChild(this.yunchengSprite);
         this.lineSpr = new Sprite();
         addChild(this.lineSpr);
         this.lineSpr.x = 202;
         this.lineSpr.y = 148;
         this.line = StaticValue.getBitmapByClassName("ui.yuncheng.zhizhen");
         this.line.y = -this.line.height + 12;
         this.line.x = -this.line.width / 2;
         this.lineSpr.addChild(this.line);
         this.spr = new Sprite();
         addChild(this.spr);
         this.xuanzhongSpr = new Sprite();
         addChild(this.xuanzhongSpr);
         this.xuanzhongSpr.mouseChildren = false;
         this.xuanzhongSpr.mouseEnabled = false;
         this.zuanzhong = StaticValue.getBitmapByClassName("ui.yuncheng.xuanzhe");
         this.xuanzhongSpr.addChild(this.zuanzhong);
         this.jihuoBtn = new SecondButton();
         this.jihuoBtn.label = LanResManager.getLanCommonTextWords("激活");
         addChild(this.jihuoBtn);
         this.jihuoBtn.x = 170;
         this.jihuoBtn.y = 180;
         this.jihuoBtn.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.shuoming = new SecondButton();
         this.shuoming.label = LanResManager.getLanCommonTextWords("运程系统说明");
         addChild(this.shuoming);
         this.shuoming.x = 300;
         this.shuoming.y = 20;
         this.shuoming.addEventListener(MouseEvent.CLICK,this.onBtnClick1);
         this.fts = new FTextArea();
         this.fts.x = 10;
         this.fts.y = 7;
         this.fts.textColor = StaticValue.GREEN;
         this.fts.width = 170;
         this.fts.height = 20;
         this.fts.htmlText = LanResManager.getLanCommonTextWords("天道命轮密钥（已激活）");
         addChild(this.fts);
         ToolTips.createToolTips(this.fts,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击50000000000 防御30000000000 血量60000000000 暴击28888 闪避28888 所有武功提升20000层") + "<br>" + LanResManager.getLanCommonTextWords("特殊效果：双击使用之后，天道命轮每次转动一圈（24小时），都将可以提升人物攻击20000000、防御10000000、血量30000000、所有武功提升1000层") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 7 + 20;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 40;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("十二生肖守护神") + "<br>" + LanResManager.getLanCommonTextWords("（已激活）");
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击：56888亿、防御52888亿、血量60888亿、所有武功提升480000层") + "<br>" + LanResManager.getLanCommonTextWords("生肖庇护（特殊技能）：被攻击时有几率触发十二生肖庇护，自身在此状态下，自身可免疫所有") + "<br>" + LanResManager.getLanCommonTextWords("负面状态；且生肖将围绕自身旋转，对手的每次攻击伤害生肖都将抵消掉，对手须打死12生肖后方可") + "<br>" + LanResManager.getLanCommonTextWords("在攻击人物，状态持续10秒。") + "<br>" + LanResManager.getLanCommonTextWords("生肖属性：运程系统全部开通的玩家，可在激活12生肖隐藏属性，每次转动一圈（24小时），都") + "<br>" + LanResManager.getLanCommonTextWords("将可以获得包括武功在内的属性加成。每24小时，都将可以提升人物攻击800000000、防御") + "<br>" + LanResManager.getLanCommonTextWords("500000000、血量1000000000、所有武功提升10000层。此属性为无限加成.") + "<br></font>";
            return _loc1_ + "</textformat>";
         });
         this.kuangSpr = new Sprite();
         this.equipContainers = new Sprite();
         this.equipContainers.x = 295 - 288 + 345;
         this.equipContainers.y = 322 - 73 + 1 - 40 - 45 + 30 - 45 + 95;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuangSpr.addChild(this.kuangHD);
         this.kuangHD.x = 10 + 345;
         this.kuangHD.y = 266 - 2 - 1 - 10 - 40 - 45 + 30 - 45 + 95;
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 250;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 110;
         this.fts3.height = 20 + 40;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("神魔兽") + "<br>" + LanResManager.getLanCommonTextWords("神明兽") + "<br>" + LanResManager.getLanCommonTextWords("魔幽兽");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击128888亿 防御108888亿 血量138888亿 暴击 88888闪避 88888 所有武功2500000层") + "<br>" + LanResManager.getLanCommonTextWords("神魔兽：神魔兽有独有的转换功能，可切换成神明兽，也可切换到魔幽兽，即神即魔，非人非物。") + "<br>" + LanResManager.getLanCommonTextWords("神明兽：经历万年从天庭的次元中诞生的神明兽，一直在天界的边缘守护着次元大门。攻击时100%触发") + "<br>" + LanResManager.getLanCommonTextWords("神明精元，持续10秒；在此状态下，神明兽每移动一个位置每秒都将使神明附近的所有玩家及玩家坐骑") + "<br>" + LanResManager.getLanCommonTextWords("恐惧击退，且在神明状态下，所有对手将无法进行攻击，直至状态结束为止。冷却60秒。") + "<br>" + LanResManager.getLanCommonTextWords("魔幽兽：魔界诞生以来，魔界之王为压制魔界之气，千寻万难从幽冥中降服的魔幽兽，用魔幽之力克制") + "<br>" + LanResManager.getLanCommonTextWords("魔界之力，使魔界不在受魔界之气而混乱，自此魔幽兽就在魔界永存至令。被攻击时100%触发魔幽精魄，") + "<br>" + LanResManager.getLanCommonTextWords("持续10秒；兽不动，气先动，每被攻击一次，都可将对手拉至身边瞬间掉血60%，每被拉一次的对手都将") + "<br>" + LanResManager.getLanCommonTextWords("失去所有能力，持续10秒。冷却60秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkZq1 = new FCheckBox();
         addChild(this.checkZq1);
         this.checkZq1.x = 50;
         this.checkZq1.y = 265;
         this.checkZq1.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.checkZq2 = new FCheckBox();
         addChild(this.checkZq2);
         this.checkZq2.x = 50;
         this.checkZq2.y = 285 - 3;
         this.checkZq2.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts4 = new FTextArea();
         this.fts4.x = 10;
         this.fts4.y = 180 + 45;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 110;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("破天秘籍(已激活)");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击：80888亿、防御60888亿、血量80888亿、 所有武功提升 5600000层 攻速+288") + "<br>" + LanResManager.getLanCommonTextWords("生肖之魂：破天，传闻为生肖神秘使者所持利器，此器一出，风云突变，视苍茫大地为尘土。") + "<br>" + LanResManager.getLanCommonTextWords("使用神器锻造炉锻造而成的破天（神器）拥有12生肖的灵魂附魔，在武器上形成光芒特效。") + "<br>" + LanResManager.getLanCommonTextWords("破天召唤：每攻击8次100%触发破天召唤，天空将被撕开一道裂缝，对手将受裂缝的吸收传送") + "<br>" + LanResManager.getLanCommonTextWords("至异界裂缝处，对手在裂缝内无法逃脱，持续10秒；且在裂缝内的所有玩家都将失去身上所有") + "<br>" + LanResManager.getLanCommonTextWords("勋章的效果；异界乃宇宙之空间产物，对手在异界内攻击速度和移动速度受到失重影响只有1") + "<br>" + LanResManager.getLanCommonTextWords("点，对手须攻击100次，方可从裂缝逃脱。冷却60秒。") + "<br>" + LanResManager.getLanCommonTextWords("生肖附魔：破天由12生肖神器锻造而成，刀刃上附有生肖灵魂，附魔生肖灵魂的破天（神器）") + "<br>" + LanResManager.getLanCommonTextWords("可吸收12生肖的所有精华，使破天召唤的技能冷却时间从60秒降低于10秒，破天一出，逆转乾坤。") + "<br>";
            return _loc1_ + "</textformat>";
         });
      }
      
      public static function getShengXiaoById(param1:int) : String
      {
         switch(param1)
         {
            case 1:
               return LanResManager.getLanCommonTextWords("灵鼠");
            case 2:
               return LanResManager.getLanCommonTextWords("奔牛");
            case 3:
               return LanResManager.getLanCommonTextWords("虎虎");
            case 4:
               return LanResManager.getLanCommonTextWords("玉兔");
            case 5:
               return LanResManager.getLanCommonTextWords("腾龙");
            case 6:
               return LanResManager.getLanCommonTextWords("金蛇");
            case 7:
               return LanResManager.getLanCommonTextWords("骏马");
            case 8:
               return LanResManager.getLanCommonTextWords("三羊");
            case 9:
               return LanResManager.getLanCommonTextWords("仙猴");
            case 10:
               return LanResManager.getLanCommonTextWords("雄鸡");
            case 11:
               return LanResManager.getLanCommonTextWords("神犬");
            case 12:
               return LanResManager.getLanCommonTextWords("瑞猪");
            default:
               return "";
         }
      }
      
      public static function getWuGongById(param1:int) : int
      {
         switch(param1)
         {
            case 1:
               return 8;
            case 2:
               return 10;
            case 3:
               return 20;
            case 4:
               return 30;
            case 5:
               return 40;
            case 6:
               return 50;
            case 7:
               return 60;
            case 8:
               return 88;
            case 9:
               return 100;
            case 10:
               return 200;
            case 11:
               return 400;
            case 12:
               return 1000;
            default:
               return 0;
         }
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.checkZq1:
               this.checkZq2.selectState = false;
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkZq1.selectState,29]));
               break;
            case this.checkZq2:
               this.checkZq1.selectState = false;
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkZq2.selectState,30]));
         }
      }
      
      private function onBtnClick1(param1:MouseEvent) : void
      {
         this.showBowJinjie();
      }
      
      private function onBtnClick(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new BaseEvent(CharAttribute.YUNCHENG_JIHUO,"",this.jihuoId));
      }
      
      private function onMouseTip1(param1:MouseEvent) : void
      {
         var _loc6_:String = null;
         var _loc7_:Array = null;
         var _loc2_:String = param1.currentTarget.name;
         var _loc3_:int = Number(_loc2_);
         var _loc4_:DisplayObject = this.spr.getChildByName(_loc2_);
         var _loc5_:String = "";
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               _loc4_.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip1);
               break;
            case MouseEvent.MOUSE_MOVE:
               if(this.shujuArr[_loc3_ - 1].zhuangtai == 0)
               {
                  _loc6_ = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("未激活") + "</font>";
               }
               else if(this.shujuArr[_loc3_ - 1].zhuangtai == 1)
               {
                  _loc6_ = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可激活") + "</font>";
               }
               else if(this.shujuArr[_loc3_ - 1].zhuangtai == 2)
               {
                  _loc6_ = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("已激活") + "</font>";
               }
               _loc5_ += "<textformat leading=\'6\'>";
               _loc5_ = _loc5_ + ("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("名称：") + "</font>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + " " + this.shujuArr[_loc3_ - 1].name + "</font><br>");
               _loc5_ = _loc5_ + ("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("状态：") + "</font>" + _loc6_ + "<br>");
               _loc5_ = _loc5_ + ("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("前提：") + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + this.shujuArr[_loc3_ - 1].qianti + "</font><br>");
               _loc5_ = _loc5_ + ("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("名称：") + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + this.shujuArr[_loc3_ - 1].miaoshu + "<br></font>");
               if(this["tz" + _loc3_] > 0)
               {
                  _loc7_ = [3];
                  if(_loc7_.indexOf(_loc3_) != -1)
                  {
                     _loc5_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("已使用") + getShengXiaoById(_loc3_) + LanResManager.getLanCommonTextWords("挑战丹数量：") + this["tz" + _loc3_] + LanResManager.getLanCommonTextWords("颗") + "<br>" + LanResManager.getLanCommonTextWords("累积增加属性：攻击") + "：" + 2000000 * this["tz" + _loc3_] + "  " + LanResManager.getLanCommonTextWords("防御：") + 2000000 * this["tz" + _loc3_] + LanResManager.getLanCommonTextWords("生命：") + 10000000 * this["tz" + _loc3_] + LanResManager.getLanCommonTextWords("战斗力：") + 20000 * this["tz" + _loc3_] + LanResManager.getLanCommonTextWords("武功：") + 10 * this["tz" + _loc3_] + "</font>";
                  }
                  else if(_loc3_ == 4)
                  {
                     _loc5_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("已使用") + getShengXiaoById(_loc3_) + LanResManager.getLanCommonTextWords("挑战丹数量：") + this["tz" + _loc3_] + LanResManager.getLanCommonTextWords("颗") + "<br>" + LanResManager.getLanCommonTextWords("累积增加属性：攻击") + "：" + 4000000 * this["tz" + _loc3_] + "  " + LanResManager.getLanCommonTextWords("防御：") + 4000000 * this["tz" + _loc3_] + LanResManager.getLanCommonTextWords("生命：") + 20000000 * this["tz" + _loc3_] + LanResManager.getLanCommonTextWords("战斗力：") + 20000 * this["tz" + _loc3_] + LanResManager.getLanCommonTextWords("武功：") + 20 * this["tz" + _loc3_] + "</font>";
                  }
                  else if(_loc3_ == 1)
                  {
                     _loc5_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("已使用") + getShengXiaoById(_loc3_) + LanResManager.getLanCommonTextWords("挑战丹数量：") + this["tz" + _loc3_] + LanResManager.getLanCommonTextWords("颗") + "<br>" + LanResManager.getLanCommonTextWords("累积增加属性：攻击") + "：" + 1000000 * this["tz" + _loc3_] + "  " + LanResManager.getLanCommonTextWords("防御：") + 1000000 * this["tz" + _loc3_] + LanResManager.getLanCommonTextWords("战斗力：") + 10000 * this["tz" + _loc3_] + "</font>";
                  }
                  else if(_loc3_ == 2)
                  {
                     _loc5_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("已使用") + getShengXiaoById(_loc3_) + LanResManager.getLanCommonTextWords("挑战丹数量：") + this["tz" + _loc3_] + LanResManager.getLanCommonTextWords("颗") + "<br>" + LanResManager.getLanCommonTextWords("累积增加属性：攻击") + "：" + 1000000 * this["tz" + _loc3_] + "  " + LanResManager.getLanCommonTextWords("防御：") + 1000000 * this["tz" + _loc3_] + LanResManager.getLanCommonTextWords("生命：") + 30000000 * this["tz" + _loc3_] + LanResManager.getLanCommonTextWords("战斗力：") + 10000 * this["tz" + _loc3_] + LanResManager.getLanCommonTextWords("武功：") + 10 * this["tz" + _loc3_] + "</font>";
                  }
                  else
                  {
                     _loc5_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("已使用") + getShengXiaoById(_loc3_) + LanResManager.getLanCommonTextWords("挑战丹数量：") + this["tz" + _loc3_] + LanResManager.getLanCommonTextWords("颗") + "<br>" + LanResManager.getLanCommonTextWords("累积增加属性：攻击") + "：" + 2000000 * this["tz" + _loc3_] + "  " + LanResManager.getLanCommonTextWords("防御：") + 2000000 * this["tz" + _loc3_] + LanResManager.getLanCommonTextWords("生命：") + 10000000 * this["tz" + _loc3_] + LanResManager.getLanCommonTextWords("战斗力：") + 20000 * this["tz" + _loc3_] + "</font>";
                  }
               }
               _loc5_ += "</textformat>";
               this.showTip(_loc5_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               _loc4_.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip1);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:DisplayObject = null;
         var _loc4_:int = 0;
         var _loc5_:Goods = null;
         var _loc6_:Goods = null;
         if(this.tarenPd)
         {
            _loc2_ = param1.currentTarget.name;
            _loc3_ = this.spr.getChildByName(_loc2_);
            _loc4_ = Number(_loc2_);
            if(this.dayCount > 0)
            {
               this.ft1.htmlText = LanResManager.getLanCommonTextWords("攻击：") + Number(this.shujuArr[_loc4_ - 1].gongji + 2000000 * this.dayCount) + "<br>" + LanResManager.getLanCommonTextWords("体力：") + this.shujuArr[_loc4_ - 1].tili;
               this.ft2.htmlText = LanResManager.getLanCommonTextWords("防御：") + Number(this.shujuArr[_loc4_ - 1].fangyu + 1000000 * this.dayCount) + "<br>" + LanResManager.getLanCommonTextWords("内力：") + this.shujuArr[_loc4_ - 1].neili;
               this.ft3.htmlText = LanResManager.getLanCommonTextWords("生命：") + Number(this.shujuArr[_loc4_ - 1].shengming + 10000000 * this.dayCount);
            }
            else
            {
               this.ft1.htmlText = LanResManager.getLanCommonTextWords("攻击：") + this.shujuArr[_loc4_ - 1].gongji + "<br>" + LanResManager.getLanCommonTextWords("体力：") + this.shujuArr[_loc4_ - 1].tili;
               this.ft2.htmlText = LanResManager.getLanCommonTextWords("防御：") + this.shujuArr[_loc4_ - 1].fangyu + "<br>" + LanResManager.getLanCommonTextWords("内力：") + this.shujuArr[_loc4_ - 1].neili;
               this.ft3.htmlText = LanResManager.getLanCommonTextWords("生命：") + this.shujuArr[_loc4_ - 1].shengming;
            }
            if(this.shujuArr[_loc4_ - 1].zhuangtai == 2)
            {
               if(this.img != null && this.img.parent != null)
               {
                  this.img.parent.removeChild(this.img);
               }
               if(this.item != null && this.item.parent != null)
               {
                  this.item.parent.removeChild(this.item);
               }
               this.jihuoBtn.visible = false;
            }
            else
            {
               if(this.img != null && this.img.parent != null)
               {
                  this.img.parent.removeChild(this.img);
               }
               this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
               addChildAt(this.img,10);
               this.img.x = 182;
               this.img.y = 130;
               _loc5_ = this.shujuArr[_loc4_ - 1].go;
               _loc6_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(_loc5_.id,true);
               if(this.item != null && this.item.parent != null)
               {
                  this.item.parent.removeChild(this.item);
               }
               this.item = new ItemFace(_loc6_);
               this.item.x = 184;
               this.item.y = 132;
               addChildAt(this.item,11);
               if(_loc6_.count < this.shujuArr[_loc4_ - 1].goodNums)
               {
                  this.item.filters = Tools.blackWhiteFilter;
               }
               this.jihuoBtn.visible = true;
            }
            this.xuanzhongSpr.x = _loc3_.x;
            this.xuanzhongSpr.y = _loc3_.y;
            this.xuanzhongSpr.visible = true;
            if(Number(_loc2_) == this.jihuoId)
            {
               if(this.shujuArr[_loc4_ - 1].zhuangtai == 1)
               {
                  this.jihuoBtn.enabled = true;
               }
               else
               {
                  this.jihuoBtn.enabled = false;
               }
            }
            else
            {
               this.jihuoBtn.enabled = false;
            }
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
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
      
      public function setInitialize(param1:Boolean, param2:Array, param3:int, param4:Number) : void
      {
         var _loc5_:String = null;
         var _loc7_:int = 0;
         var _loc10_:Goods = null;
         var _loc11_:Goods = null;
         this.jihuo(param1);
         this.isMain = param1;
         this.shujuArr = param2;
         while(this.spr.numChildren > 0)
         {
            this.spr.removeChildAt(0);
         }
         var _loc6_:Boolean = true;
         var _loc8_:int = 0;
         while(_loc8_ < param2.length)
         {
            if(param2[_loc8_].zhuangtai == 0)
            {
               _loc5_ = "ui.yuncheng.btn.0";
            }
            else if(param2[_loc8_].zhuangtai == 1)
            {
               _loc5_ = "ui.yuncheng.btn.0";
               this.jihuoId = this.shujuArr[_loc8_].id;
               if(this.dangqianMc != null && this.dangqianMc.parent != null)
               {
                  this.dangqianMc.parent.removeChild(this.dangqianMc);
               }
               this.dangqianMc = StaticValue.getMCByClassName("ui.dangqian.xuanzhuan") as MovieClip;
               this.dangqianMc.play();
               this.dangqianMc.mouseChildren = false;
               this.dangqianMc.mouseEnabled = false;
               addChildAt(this.dangqianMc,2);
            }
            else if(param2[_loc8_].zhuangtai == 2)
            {
               _loc5_ = "ui.yuncheng.btn." + (_loc8_ + 1);
               _loc7_++;
            }
            this.$class = getDefinitionByName(_loc5_) as Class;
            this.btn1 = new this.$class() as SimpleButton;
            this.spr.addChild(this.btn1);
            this.btn1.addEventListener(MouseEvent.CLICK,this.onClick);
            this.btn1.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
            this.btn1.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
            if(_loc8_ == 0)
            {
               this.btn1.x = 174;
               this.btn1.y = 6;
               this.btn1.name = "1";
            }
            else if(_loc8_ == 1)
            {
               this.btn1.x = 230 - 3 + 6;
               this.btn1.y = 20 + 2;
               this.btn1.name = "2";
            }
            else if(_loc8_ == 2)
            {
               this.btn1.x = 270 + 5;
               this.btn1.y = 60 + 3;
               this.btn1.name = "3";
            }
            else if(_loc8_ == 3)
            {
               this.btn1.x = 290 + 1 + 2;
               this.btn1.y = 115 + 5 + 1;
               this.btn1.name = "4";
            }
            else if(_loc8_ == 4)
            {
               this.btn1.x = 270 + 8;
               this.btn1.y = 165 + 16;
               this.btn1.name = "5";
            }
            else if(_loc8_ == 5)
            {
               this.btn1.x = 220 + 12;
               this.btn1.y = 215 + 10;
               this.btn1.name = "6";
            }
            else if(_loc8_ == 6)
            {
               this.btn1.x = 170 + 6;
               this.btn1.y = 230 + 11;
               this.btn1.name = "7";
            }
            else if(_loc8_ == 7)
            {
               this.btn1.x = 120 - 3;
               this.btn1.y = 215 + 12;
               this.btn1.name = "8";
            }
            else if(_loc8_ == 8)
            {
               this.btn1.x = 73;
               this.btn1.y = 165 + 19;
               this.btn1.name = "9";
            }
            else if(_loc8_ == 9)
            {
               this.btn1.x = 50 + 7;
               this.btn1.y = 115 + 9;
               this.btn1.name = "10";
            }
            else if(_loc8_ == 10)
            {
               this.btn1.x = 70 + 2;
               this.btn1.y = 60 + 6;
               this.btn1.name = "11";
            }
            else if(_loc8_ == 11)
            {
               this.btn1.x = 110 + 4;
               this.btn1.y = 20 + 2;
               this.btn1.name = "12";
            }
            _loc8_++;
         }
         if(_loc7_ == 0)
         {
            this.jihuoId = 1;
         }
         else if(_loc7_ == 12)
         {
            this.jihuoId = param2.length;
         }
         var _loc9_:DisplayObject = this.spr.getChildByName(String(this.jihuoId));
         if(this.shujuArr[this.jihuoId - 1].zhuangtai == 1)
         {
            if(this.img != null && this.img.parent != null)
            {
               this.img.parent.removeChild(this.img);
            }
            this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
            addChildAt(this.img,10);
            this.img.x = 182;
            this.img.y = 130;
            _loc10_ = this.shujuArr[this.jihuoId - 1].go;
            _loc11_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(_loc10_.id,true);
            if(this.item != null && this.item.parent != null)
            {
               this.item.parent.removeChild(this.item);
            }
            this.item = new ItemFace(_loc11_);
            this.item.x = 184;
            this.item.y = 132;
            addChildAt(this.item,11);
            if(_loc11_.count < this.shujuArr[this.jihuoId - 1].goodNums)
            {
               this.item.filters = Tools.blackWhiteFilter;
            }
            this.jihuoBtn.visible = true;
            this.jihuoBtn.enabled = true;
            if(this.dangqianMc != null)
            {
               this.dangqianMc.x = _loc9_.x - 40 + 1;
               this.dangqianMc.y = _loc9_.y - 40 - 1;
            }
            this.xuanzhongSpr.x = _loc9_.x;
            this.xuanzhongSpr.y = _loc9_.y;
            this.xuanzhongSpr.visible = true;
         }
         else if(this.shujuArr[this.jihuoId - 1].zhuangtai != 0)
         {
            if(this.shujuArr[this.jihuoId - 1].zhuangtai == 2)
            {
               this.jihuoBtn.visible = false;
               if(this.img != null && this.img.parent != null)
               {
                  this.img.parent.removeChild(this.img);
               }
               if(this.item != null && this.item.parent != null)
               {
                  this.item.parent.removeChild(this.item);
               }
               if(this.dangqianMc != null && this.dangqianMc.parent != null)
               {
                  this.dangqianMc.parent.removeChild(this.dangqianMc);
               }
               this.xuanzhongSpr.visible = false;
            }
         }
         this.dayCount = param3;
         this.tiandaoCount = param4;
         this.ft1.htmlText = LanResManager.getLanCommonTextWords("攻击：") + Number(this.shujuArr[this.jihuoId - 1].gongji + 2000000 * this.dayCount) + "<br>" + LanResManager.getLanCommonTextWords("体力：") + this.shujuArr[this.jihuoId - 1].tili;
         this.ft2.htmlText = LanResManager.getLanCommonTextWords("防御：") + Number(this.shujuArr[this.jihuoId - 1].fangyu + 1000000 * this.dayCount) + "<br>" + LanResManager.getLanCommonTextWords("内力：") + this.shujuArr[this.jihuoId - 1].neili;
         this.ft3.htmlText = LanResManager.getLanCommonTextWords("生命：") + Number(this.shujuArr[this.jihuoId - 1].shengming + 10000000 * this.dayCount);
      }
      
      public function setMc(param1:int) : void
      {
         var int1:int = param1;
         if(this.yanhuaMc != null && this.yanhuaMc.parent != null)
         {
            this.yanhuaMc.parent.removeChild(this.yanhuaMc);
         }
         if(this.yanhuaMc == null)
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               yanhuaMc = _loc2_.content as MovieClip;
               if(Boolean(yanhuaMc) && yanhuaMc.parent != null)
               {
                  yanhuaMc.parent.removeChild(yanhuaMc);
               }
               yanhuaMc.x = 200;
               yanhuaMc.y = 148;
               yanhuaMc.rotation = 360 / 12 * (int1 - 1);
               yanhuaMc.visible = true;
               addChild(yanhuaMc);
               yanhuaMc.mouseChildren = false;
               yanhuaMc.mouseEnabled = false;
            },null,false,GameConfig.fileBaseFolder + "res/data/mc/yuncheng/jihuo.swf");
         }
         else
         {
            this.yanhuaMc.x = 200;
            this.yanhuaMc.y = 148;
            this.yanhuaMc.rotation = 360 / 12 * (int1 - 1);
            this.yanhuaMc.visible = true;
            this.yanhuaMc.play();
            addChild(this.yanhuaMc);
            this.yanhuaMc.mouseEnabled = false;
            this.yanhuaMc.mouseChildren = false;
         }
      }
      
      public function loadSetMc() : void
      {
         if(this.yanhuaMc != null && this.yanhuaMc.parent != null)
         {
            this.yanhuaMc.parent.removeChild(this.yanhuaMc);
         }
         if(this.yanhuaMc == null)
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               yanhuaMc = _loc2_.content as MovieClip;
               yanhuaMc.visible = false;
               addChild(yanhuaMc);
            },null,false,GameConfig.fileBaseFolder + "res/data/mc/yuncheng/jihuo.swf");
         }
      }
      
      public function setTime(param1:int) : void
      {
         this.lineSpr.rotation = 360 / 12 * (param1 - 1);
      }
      
      public function showBowJinjie() : void
      {
         if(!this.shuomingPanel)
         {
            this.shuomingPanel = new YunchengShuomingPanel();
         }
         this.shuomingPanel.visible = true;
         GameInstance.uiInstance.uiContainer.addChild(this.shuomingPanel);
         this.shuomingPanel.x = (GameConfig.sceneWidth - this.shuomingPanel.width) / 2;
         this.shuomingPanel.y = (GameConfig.sceneHeight - this.shuomingPanel.height) / 2;
      }
      
      public function setEnabledFun() : void
      {
         this.shuoming.enabled = false;
         this.jihuoBtn.enabled = false;
         this.jihuoBtn.visible = false;
         this.tarenPd = false;
         if(this.img != null && this.img.parent != null)
         {
            this.img.parent.removeChild(this.img);
         }
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         if(this.dangqianMc != null && this.dangqianMc.parent != null)
         {
            this.dangqianMc.parent.removeChild(this.dangqianMc);
         }
         this.xuanzhongSpr.visible = false;
         var _loc1_:int = 0;
         while(_loc1_ < this.shujuArr.length)
         {
            if(this.shujuArr[_loc1_].zhuangtai == 2)
            {
               this.ft1.htmlText = LanResManager.getLanCommonTextWords("攻击：") + Number(this.shujuArr[_loc1_].gongji + 2000000 * this.dayCount) + "<br>" + LanResManager.getLanCommonTextWords("体力：") + this.shujuArr[_loc1_].tili;
               this.ft2.htmlText = LanResManager.getLanCommonTextWords("防御：") + Number(this.shujuArr[_loc1_].fangyu + 1000000 * this.dayCount) + "<br>" + LanResManager.getLanCommonTextWords("内力：") + this.shujuArr[_loc1_].neili;
               this.ft3.htmlText = LanResManager.getLanCommonTextWords("生命：") + Number(this.shujuArr[_loc1_].shengming + 10000000 * this.dayCount);
            }
            _loc1_++;
         }
         if(this.jihuoId == 1)
         {
            if(this.shujuArr[this.jihuoId - 1].zhuangtai == 1 || this.shujuArr[this.jihuoId - 1].zhuangtai == 0)
            {
               this.ft1.htmlText = LanResManager.getLanCommonTextWords("攻击：") + "<br>" + LanResManager.getLanCommonTextWords("体力：");
               this.ft2.htmlText = LanResManager.getLanCommonTextWords("防御：") + "<br>" + LanResManager.getLanCommonTextWords("内力：");
               this.ft3.htmlText = LanResManager.getLanCommonTextWords("生命：");
            }
         }
      }
      
      public function setYunchengJihuo(param1:Boolean, param2:Array) : void
      {
         var bo:Boolean = param1;
         var r:Array = param2;
         while(this.yunchengSprite.numChildren > 0)
         {
            this.yunchengSprite.removeChildAt(0);
         }
         if(bo)
         {
            this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/yuncheng/guanghuan.swf");
            this.bg.x = 107;
            this.bg.y = 58;
            this.yunchengSprite.addChild(this.bg);
            ToolTips.createToolTips(this.bg,this,function():String
            {
               var _loc1_:String = "";
               _loc1_ += "<textformat leading=\'6\'>";
               _loc1_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("逆天改命符已激活") + "<br>" + LanResManager.getLanCommonTextWords("运程系统每循环一轮，都将可以额外在增加一次属性（32888攻击、28888防御以及100000血量）") + "<br>" + "</font>";
               return _loc1_ + "</textformat>";
            });
         }
         while(this.redSprite.numChildren > 0)
         {
            this.redSprite.removeChildAt(0);
         }
         if(this.dayCount <= 0)
         {
            this.ft4.visible = false;
         }
         else
         {
            this.ft4.visible = true;
            this.redBg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/yuncheng/redbg.swf");
            this.redSprite.addChild(this.redBg);
         }
      }
      
      public function jihuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts.visible = GameState.dictMainStatus[SpecialGoodsID.YUNCHENG_TIANDAOMINGLUNMIYAO];
            this.tz1 = GameState.dictMainStatus[SpecialGoodsID.YUNCHENG_ZISHU_ID];
            this.tz2 = GameState.dictMainStatus[SpecialGoodsID.YUNCHENG_CHOUNIU_ID];
            this.tz3 = GameState.dictMainStatus[SpecialGoodsID.YUNCHENG_YINHU_ID];
            this.tz4 = GameState.dictMainStatus[SpecialGoodsID.YUNCHENG_MAOTU_ID];
            this.tz5 = GameState.dictMainStatus[SpecialGoodsID.YUNCHENG_CHENLONG_ID];
            this.tz6 = GameState.dictMainStatus[SpecialGoodsID.YUNCHENG_SHISHE_ID];
            this.tz7 = GameState.dictMainStatus[SpecialGoodsID.YUNCHENG_WUMA_ID];
            this.tz8 = GameState.dictMainStatus[SpecialGoodsID.YUNCHENG_WEIYANG_ID];
            this.tz9 = GameState.dictMainStatus[SpecialGoodsID.YUNCHENG_SHENHOU_ID];
            this.tz10 = GameState.dictMainStatus[SpecialGoodsID.YUNCHENG_YOUJI_ID];
            this.tz11 = GameState.dictMainStatus[SpecialGoodsID.YUNCHENG_XUGOU_ID];
            this.tz12 = GameState.dictMainStatus[SpecialGoodsID.YUNCHENG_HAIZHU_ID];
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.YUNCHENG_SHOUHUSHEN_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.YUNCHENG_SHENMINGSHOU_ID])
            {
               this.fts3.visible = true;
               this.checkZq1.visible = true;
               this.checkZq2.visible = true;
            }
            else
            {
               this.fts3.visible = false;
               this.checkZq1.visible = false;
               this.checkZq2.visible = false;
            }
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.YUNCHENG_POTIANMIJI_ID];
         }
         else
         {
            this.fts.visible = GameState.dictTargetStatus[SpecialGoodsID.YUNCHENG_TIANDAOMINGLUNMIYAO];
            this.tz1 = GameState.dictTargetStatus[SpecialGoodsID.YUNCHENG_ZISHU_ID];
            this.tz2 = GameState.dictTargetStatus[SpecialGoodsID.YUNCHENG_CHOUNIU_ID];
            this.tz3 = GameState.dictTargetStatus[SpecialGoodsID.YUNCHENG_YINHU_ID];
            this.tz4 = GameState.dictTargetStatus[SpecialGoodsID.YUNCHENG_MAOTU_ID];
            this.tz5 = GameState.dictTargetStatus[SpecialGoodsID.YUNCHENG_CHENLONG_ID];
            this.tz6 = GameState.dictTargetStatus[SpecialGoodsID.YUNCHENG_SHISHE_ID];
            this.tz7 = GameState.dictTargetStatus[SpecialGoodsID.YUNCHENG_WUMA_ID];
            this.tz8 = GameState.dictTargetStatus[SpecialGoodsID.YUNCHENG_WEIYANG_ID];
            this.tz9 = GameState.dictTargetStatus[SpecialGoodsID.YUNCHENG_SHENHOU_ID];
            this.tz10 = GameState.dictTargetStatus[SpecialGoodsID.YUNCHENG_YOUJI_ID];
            this.tz11 = GameState.dictTargetStatus[SpecialGoodsID.YUNCHENG_XUGOU_ID];
            this.tz12 = GameState.dictTargetStatus[SpecialGoodsID.YUNCHENG_HAIZHU_ID];
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.YUNCHENG_SHOUHUSHEN_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.YUNCHENG_SHENMINGSHOU_ID])
            {
               this.fts3.visible = true;
               this.checkZq1.visible = true;
               this.checkZq2.visible = true;
            }
            else
            {
               this.fts3.visible = false;
               this.checkZq1.visible = false;
               this.checkZq2.visible = false;
            }
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.YUNCHENG_POTIANMIJI_ID];
         }
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         if(this.isMain)
         {
            this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function set_YunCheng(param1:Array) : void
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
            if(_loc3_.res.position == ItemPositionRange.POSTION_YUNCHENG_SHENGXIAOFUBENLING)
            {
               _loc4_.x = 4 + 1;
               _loc4_.y = 4 + 1;
               this.equipContainers.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
      
      public function setYunChengZuoQi(param1:Boolean, param2:Boolean) : void
      {
         this.checkZq1.selectState = param1;
         this.checkZq2.selectState = param2;
      }
   }
}

