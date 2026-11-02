package com.tgame.shell.view.components.attribute
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.CharAttribute;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   import gs.TweenLite;
   import gs.easing.Quad;
   
   public class TianFu extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var line:DisplayObject;
      
      private var lineSpr:Sprite;
      
      private var tuiMingFta:FTextArea;
      
      private var shuaXinFta:FTextArea;
      
      private var shuXingFta:FTextArea;
      
      private var colFta1:FTextArea;
      
      private var colFta2:FTextArea;
      
      private var colFta3:FTextArea;
      
      private var shuaXinBtn:SmallButton;
      
      private var xiangQianBtn:SmallButton;
      
      private var tuiMingBtn:SmallButton;
      
      private var lingQuBtn:SmallButton;
      
      private var curIndex:int = 0;
      
      private var tuiMingNum:int;
      
      private var shuaXinNum:int;
      
      private var goodsContainer:Sprite;
      
      private var itemContainer:Sprite;
      
      private var goodsArr:Array;
      
      private var fts1:FTextArea;
      
      public var isMainChar:Boolean;
      
      public var goodId:int;
      
      public var item:ItemFace;
      
      private var zuiQiangFta:FTextArea;
      
      private var zuiQiangCount:int = 0;
      
      private var isLevel1:Boolean = false;
      
      private var isLevel2:Boolean = false;
      
      private var fts2:FTextArea;
      
      private var isLevel3:Boolean = false;
      
      private var fts3:FTextArea;
      
      private var fts4:FTextArea;
      
      private var check:FCheckBox;
      
      private var fts5:FTextArea;
      
      private var fts6:FTextArea;
      
      private var canjuan:int = 0;
      
      private var fts7:FTextArea;
      
      public function TianFu()
      {
         var bg:DisplayObject;
         super();
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         this.tip.x = 2;
         this.tip.y = 2;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.textColor = StaticValue.WHITE;
         this.tip.filters = StaticValue.filter;
         this.tipCanvas.addChild(this.tip);
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tianfu/bg.swf");
         bg.x = 0;
         bg.y = 1;
         addChild(bg);
         this.tuiMingFta = new FTextArea();
         with(this.tuiMingFta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 110;
            height = 20;
            x = 250 + 50;
            y = 30 - 20;
            textColor = StaticValue.GREEN;
         }
         addChild(this.tuiMingFta);
         this.zuiQiangFta = new FTextArea();
         with(this.zuiQiangFta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 110;
            height = 20;
            x = 250 + 50;
            y = 30 - 20 + 20;
            textColor = StaticValue.GREEN;
            htmlText = LanResManager.getLanCommonTextWords("最强天赋属性");
            visible = false;
         }
         ToolTips.createToolTips(this.zuiQiangFta,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("装备集齐满任意一页最强天赋后，都将获得天赋异禀初始技能。装备集齐满所有最强天赋后，都将开启天赋异禀终极奥义") + "</font><br>";
            if(!isLevel3)
            {
               _loc1_ += "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("每镶嵌一颗最强天赋增加武功2000层。最强天赋武功加成:") + 2 * zuiQiangCount + "</font><br>";
            }
            _loc1_ += "<font color=\'" + (isLevel1 ? StaticValue.GREEN_HTML : StaticValue.HUISE_HTML) + "\'>" + LanResManager.getLanCommonTextWords("天赋异禀初始技能：攻击时有几率触发技能，可使对手攻击速度、移动速度每秒降低15%，技能触发5秒后，对手将必定") + "<br>    " + LanResManager.getLanCommonTextWords("遭受定身（移动速度降低至0）、且无法攻击任何对手（攻击速度降低至0），定身以及无法攻击时效果持续5秒。") + "</font><br>" + "<font color=\'" + (isLevel2 ? StaticValue.GREEN_HTML : StaticValue.HUISE_HTML) + "\'>" + LanResManager.getLanCommonTextWords("天赋异禀终极奥义：100%将无视任何对手所有战纹效果，技能冷却时间30秒。") + "</font><br>" + "<font color=\'" + (isLevel3 ? StaticValue.GREEN_HTML : StaticValue.HUISE_HTML) + "\'>" + LanResManager.getLanCommonTextWords("天赋隐藏奥义—攻击时有几率触发在接下来的30秒内将无视对手勋章技能造成的伤害") + "<br></font>";
            if(isLevel3)
            {
               _loc1_ += "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("所有武功增加200000层") + "</font><br>";
            }
            return _loc1_ + "</textformat>";
         });
         this.shuaXinFta = new FTextArea();
         with(this.shuaXinFta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 110;
            height = 20;
            x = 10;
            y = 275;
            textColor = StaticValue.GREEN;
         }
         addChild(this.shuaXinFta);
         this.shuXingFta = new FTextArea();
         with(this.shuXingFta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 110;
            height = 20;
            x = 140;
            y = 302;
            textColor = StaticValue.GREEN;
            htmlText = LanResManager.getLanCommonTextWords("天赋属性");
         }
         addChild(this.shuXingFta);
         this.colFta1 = new FTextArea();
         with(this.colFta1)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 110;
            height = 10;
            x = 10;
            y = 315;
            textColor = StaticValue.ORANGE;
         }
         addChild(this.colFta1);
         this.colFta2 = new FTextArea();
         with(this.colFta2)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 110;
            height = 10;
            x = 20 + 100 + 10;
            y = 315;
            textColor = StaticValue.ORANGE;
         }
         addChild(this.colFta2);
         this.colFta3 = new FTextArea();
         with(this.colFta3)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 110;
            height = 10;
            x = 20 + 200 + 10 + 20;
            y = 315;
            textColor = StaticValue.ORANGE;
         }
         addChild(this.colFta3);
         this.shuaXinBtn = new SmallButton();
         this.shuaXinBtn.label = LanResManager.getLanCommonTextWords("刷新");
         this.shuaXinBtn.toolTip = "<font color=\'" + StaticValue.RED_HTML + "\'/>" + LanResManager.getLanCommonTextWords("每天免费刷新3次，免费次数用完后将消耗2元宝，免费次数0点刷新") + "</font>";
         addChild(this.shuaXinBtn);
         this.shuaXinBtn.x = 100;
         this.shuaXinBtn.y = 274;
         this.shuaXinBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tuiMingBtn = new SmallButton();
         this.tuiMingBtn.label = LanResManager.getLanCommonTextWords("推命");
         this.tuiMingBtn.toolTip = "<font color=\'" + StaticValue.ORANGE_HTML + "\'/>" + LanResManager.getLanCommonTextWords("免费推命次数和包裹内可以使用的【逆鳞光芒】数量优先使用免费推命次数每天可以获得3次免费推命，0点刷新，不累计") + "</font></textformat>";
         addChild(this.tuiMingBtn);
         this.tuiMingBtn.x = 300 + 35;
         this.tuiMingBtn.y = 272;
         this.tuiMingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lingQuBtn = new SmallButton();
         this.lingQuBtn.label = LanResManager.getLanCommonTextWords("领取");
         addChild(this.lingQuBtn);
         this.lingQuBtn.visible = false;
         this.lingQuBtn.x = 300 + 50;
         this.lingQuBtn.y = 272;
         this.lingQuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.itemContainer = new Sprite();
         this.itemContainer.x = 300 + 50;
         this.itemContainer.y = 230;
         addChild(this.itemContainer);
         this.xiangQianBtn = new SmallButton();
         this.xiangQianBtn.label = LanResManager.getLanCommonTextWords("镶嵌天赋");
         addChild(this.xiangQianBtn);
         this.xiangQianBtn.x = 275 + 35 + 15 + 13;
         this.xiangQianBtn.y = 250 + 75 + 10;
         this.xiangQianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.goodsContainer = new Sprite();
         this.goodsContainer.x = 0;
         this.goodsContainer.y = 0;
         addChild(this.goodsContainer);
         this.lineSpr = new Sprite();
         addChild(this.lineSpr);
         this.lineSpr.mouseChildren = false;
         this.lineSpr.mouseEnabled = false;
         this.lineSpr.x = 202 + 2;
         this.lineSpr.y = 150;
         this.line = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tianfu/shaozi.swf");
         this.line.y = -66 - 50 + 2 + 5 - 10 + 5;
         this.line.x = -22 - 2 - 10 + 3;
         this.lineSpr.addChild(this.line);
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 7;
         this.fts1.textColor = StaticValue.RED;
         this.fts1.width = 170;
         this.fts1.height = 20;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击12888888、防御6888888、血量18888888、暴击888、闪避888、所有武功提升12层") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 7 + 20 - 5;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 200;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("天赋禁锢秘籍（已激活）");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("天赋禁锢秘籍：攻击10888888889000 防御8888888889000 血量12888888889000 暴击 88888闪避88888   所有武功1800000层") + "<br>" + LanResManager.getLanCommonTextWords("★  天赋禁锢 ——  攻击时100%触发禁锢之神状态，在此状态下，可使对手10秒将无法触发清除自身负面状态的勋章效果，冷却时间60秒！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 7 + 20 - 5 + 20;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 200;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("紫郢秘籍（已激活）");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击：80888亿、防御60888亿、血量80888亿、 所有武功提升 5600000层 ") + "<br>" + LanResManager.getLanCommonTextWords("攻速+288和施发速度2% ") + "<br>" + LanResManager.getLanCommonTextWords("紫郢秘籍可继承紫郢紫郢所有兵符技能。") + "<br>" + LanResManager.getLanCommonTextWords("紫郢剑气：攻击时100%触发紫郢剑气，持续10秒；剑气将直接对对手的筋骨造成伤害，") + "<br>" + LanResManager.getLanCommonTextWords("使对手瞬间失去跳跃能力无法再进行跳跃操作，且当对手命中紫郢剑气时，自身将无法") + "<br>" + LanResManager.getLanCommonTextWords("触发任何状态清除。") + "<br>" + LanResManager.getLanCommonTextWords("紫郢剑阵：佩戴紫郢剑的玩家，攻击时或是被攻击时100%触发紫郢剑阵，都可使对手命") + "<br>" + LanResManager.getLanCommonTextWords("中紫郢剑阵效果，攻击速度和移动速度瞬间下降至剩50%，持续10秒。紫郢剑阵无冷却时间。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts4 = new FTextArea();
         this.fts4.x = 10;
         this.fts4.y = 10 + 20 + 20 - 5 + 20;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 170;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("迦楼罗（战神）");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("战神附体：迦楼罗乃西方上古神，拥有阴暗的躯体，霸气的武器。人物可自") + "<br>" + LanResManager.getLanCommonTextWords("由附身在自己身上。灵魂附魔：攻击时有几率触发灵魂附魔，持续10秒，对") + "<br>" + LanResManager.getLanCommonTextWords("手在此状态下，全身将被迦楼罗附体束缚，双眼呆滞在原地不敢移动，迦楼") + "<br>" + LanResManager.getLanCommonTextWords("罗附体状态下，对手将无法触发任何效果抵抗；且对手在此状态下，只要进") + "<br>" + LanResManager.getLanCommonTextWords("行一次操作，都将被迦楼罗瞬间吞噬全身血液掉血60%。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.selectState = false;
         this.check.x = 10 + 82;
         this.check.y = 10 + 20 + 20 - 5 + 20;
         this.check.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts5 = new FTextArea();
         this.fts5.x = 10;
         this.fts5.y = 10 + 20 + 20 - 5 + 20 + 20;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 170;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("神魔之秘籍");
         this.fts5.visible = false;
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击时100%触发神之秘籍，持续10秒；自身在此状态下，将触发神之BUFF，可免疫所") + "<br>" + LanResManager.getLanCommonTextWords("技能；且每攻击对手一次，对手将命中魔之BUFF，使所有勋章失效，持续10秒。神之") + "<br>" + LanResManager.getLanCommonTextWords("BUFF和魔之BUFF不可清除。冷却120秒。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts6 = new FTextArea();
         this.fts6.x = 10;
         this.fts6.y = 10 + 20 + 20 - 5 + 20 + 20 + 20;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 170;
         this.fts6.height = 20;
         this.fts6.htmlText = LanResManager.getLanCommonTextWords("断情七绝");
         this.fts6.visible = false;
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击：106888亿、防御102888亿、血量100888亿、所有武功提升 880000层") + "<br>" + LanResManager.getLanCommonTextWords("刀落情断：攻击时有几率触发刀落情断，可瞬间使对手分裂一分为二定身原地10秒。") + "<br>" + LanResManager.getLanCommonTextWords("情尽于此：被攻击时有几率触发情尽于此，可瞬间反噬所有攻击自身的对手，四肢尽断，10秒，人无法使用任何武学。") + "<br>" + LanResManager.getLanCommonTextWords("怒斩情丝：攻击时有几率触发怒斩情丝，可瞬间斩碎对手的所有勋章效果，使其被封无法使用，持续10秒。") + "<br>" + LanResManager.getLanCommonTextWords("情心一横：被攻击时有几率触发情心一横，自身可瞬间产生内力护盾，10秒内不受任何效果及伤害的影响。") + "<br>" + LanResManager.getLanCommonTextWords("天地无情：攻击时有几率触发天地无情，可无视对手的所有抵抗，及不可清除BUFF，瞬间破除，使对手受到的伤害达到完全的100%数值，持续10秒。") + "<br>" + LanResManager.getLanCommonTextWords("杀心成焚：被攻击时有几率触发杀心成焚，在此状态下，自身将抵抗所有对手的技能，及效果，使自身完全达到无敌的效果，持续10秒。") + "<br>" + LanResManager.getLanCommonTextWords("刀断情终：可永久获得刀断情终之术，使断情七绝的技能技能降低至0秒，无冷却。") + "<br>" + LanResManager.getLanCommonTextWords("断情七绝残卷：激活断情七绝的玩家，可双击使用断情七绝残卷开启断情七绝神技，且提升人物攻击1000亿，所有武功提升10000层，人物战力斗提升2亿（最多可使用500次）") + "<br>" + LanResManager
            .getLanCommonTextWords("当前已使用") + canjuan + LanResManager.getLanCommonTextWords("断情七绝残卷") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + canjuan * 1000 + LanResManager.getLanCommonTextWords("亿，所有武功") + canjuan * 10000 + LanResManager.getLanCommonTextWords("层，战斗力") + canjuan * 2 + LanResManager.getLanCommonTextWords("亿") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts7 = new FTextArea();
         this.fts7.x = 10;
         this.fts7.y = 10 + 20 + 20 - 5 + 20 + 20 + 40;
         this.fts7.textColor = StaticValue.GREEN;
         this.fts7.width = 170;
         this.fts7.height = 20;
         this.fts7.htmlText = LanResManager.getLanCommonTextWords("三幻合一秘术");
         this.fts7.visible = false;
         addChild(this.fts7);
         ToolTips.createToolTips(this.fts7,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("三幻魔：同时拥有烈焰炎魔、水晶冰龙、雪魄冰魂可双击使用三幻合一秘术；") + "<br>" + LanResManager.getLanCommonTextWords("攻击时有几率触发三幻魔，持续20秒；在此状态下，可瞬间使对手命中三幻") + "<br>" + LanResManager.getLanCommonTextWords("合一，使对手在10秒内无法触发任何清除负面状态的效果， 且在此状态下，") + "<br>" + LanResManager.getLanCommonTextWords("烈焰炎魔、水晶冰龙、雪魄冰魂的效果触发几率翻倍，使对手命中的负面状") + "<br>" + LanResManager.getLanCommonTextWords("态持续时间翻倍。") + "</font>";
            return _loc1_ + "</textformat>";
         });
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check.selectState,52]));
      }
      
      public function setData(param1:Boolean, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:Number, param8:Number, param9:int, param10:Boolean, param11:Boolean, param12:Boolean = false, param13:int = 0) : void
      {
         this.goodId = 0;
         this.isMainChar = param1;
         if(param1)
         {
            this.setWeiLingQu(param12,param13);
         }
         else
         {
            this.setButton();
         }
         this.setShuXing(param2,param3,param4,param5,param6,param7,param8);
         this.zuiQiangCount = param9;
         this.isLevel1 = param10;
         this.isLevel2 = this.zuiQiangCount == 40;
         if(param9 > 0)
         {
            this.zuiQiangFta.visible = true;
         }
         else
         {
            this.zuiQiangFta.visible = false;
         }
         this.isLevel3 = param11;
         if(param11)
         {
            param10 = true;
            this.isLevel2 = true;
            this.zuiQiangFta.visible = true;
         }
         this.setTianFuJiHuo(param1);
      }
      
      public function setTianFuJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.TIANFU_TIANFUJINGU_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.TIANFU_ZIYINGMIJI_ID];
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.TIANFU_JIALOULUO_ID];
            this.check.visible = GameState.dictMainStatus[SpecialGoodsID.TIANFU_JIALOULUO_ID];
            this.fts5.visible = GameState.dictMainStatus[SpecialGoodsID.TIANFU_SHENMOMIJI_ID];
            this.fts6.visible = GameState.dictMainStatus[SpecialGoodsID.TIANFU_DUANQINGQIJUE_ID];
            this.canjuan = GameState.dictMainStatus[SpecialGoodsID.TIANFU_DUANQINGCANJUAN_ID];
            this.fts7.visible = GameState.dictMainStatus[SpecialGoodsID.TIANFU_SANHUANHEYI_ID];
         }
         else
         {
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.TIANFU_TIANFUJINGU_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.TIANFU_ZIYINGMIJI_ID];
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.TIANFU_JIALOULUO_ID];
            this.check.visible = GameState.dictTargetStatus[SpecialGoodsID.TIANFU_JIALOULUO_ID];
            this.fts5.visible = GameState.dictTargetStatus[SpecialGoodsID.TIANFU_SHENMOMIJI_ID];
            this.fts6.visible = GameState.dictTargetStatus[SpecialGoodsID.TIANFU_DUANQINGQIJUE_ID];
            this.canjuan = GameState.dictTargetStatus[SpecialGoodsID.TIANFU_DUANQINGCANJUAN_ID];
            this.fts7.visible = GameState.dictTargetStatus[SpecialGoodsID.TIANFU_SANHUANHEYI_ID];
         }
      }
      
      public function setWeiLingQu(param1:Boolean, param2:int) : void
      {
         var _loc3_:Bitmap = null;
         var _loc4_:ItemFace = null;
         while(this.itemContainer.numChildren > 0)
         {
            this.itemContainer.removeChildAt(0);
         }
         this.goodId = param2;
         if(param1)
         {
            _loc3_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            _loc3_.x = -2;
            _loc3_.y = -2;
            this.itemContainer.addChild(_loc3_);
            _loc4_ = new ItemFace(new Goods(param2));
            _loc4_.name = "weilingqu";
            this.itemContainer.addChild(_loc4_);
            this.lingQuBtn.visible = true;
            this.tuiMingBtn.visible = false;
         }
         else
         {
            this.lingQuBtn.visible = false;
            this.tuiMingBtn.visible = true;
         }
      }
      
      public function setGoods(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         this.goodsArr = new Array();
         this.goodsArr = param1;
         if(this.goodsArr == null)
         {
            return;
         }
         while(this.goodsContainer.numChildren > 0)
         {
            this.goodsContainer.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = new Goods(param1[_loc2_].goodId);
            if(param1[_loc2_].texiao == 1)
            {
               _loc3_.quality = 4;
            }
            _loc4_ = new ItemFace(_loc3_);
            _loc4_.name = param1[_loc2_].id;
            switch(param1[_loc2_].id)
            {
               case 0:
                  _loc4_.x = 186;
                  _loc4_.y = 16;
                  break;
               case 1:
                  _loc4_.x = 256;
                  _loc4_.y = 38;
                  break;
               case 2:
                  _loc4_.x = 298;
                  _loc4_.y = 96;
                  break;
               case 3:
                  _loc4_.x = 298;
                  _loc4_.y = 165;
                  break;
               case 4:
                  _loc4_.x = 256;
                  _loc4_.y = 226;
                  break;
               case 5:
                  _loc4_.x = 186;
                  _loc4_.y = 247;
                  break;
               case 6:
                  _loc4_.x = 116;
                  _loc4_.y = 226;
                  break;
               case 7:
                  _loc4_.x = 74;
                  _loc4_.y = 165;
                  break;
               case 8:
                  _loc4_.x = 74;
                  _loc4_.y = 96;
                  break;
               case 9:
                  _loc4_.x = 116;
                  _loc4_.y = 38;
            }
            this.goodsContainer.addChild(_loc4_);
            _loc2_++;
         }
      }
      
      public function setTuiMingNum(param1:int) : void
      {
         this.tuiMingNum = param1;
         this.tuiMingFta.htmlText = LanResManager.getLanCommonTextWords("推命次数:") + param1;
      }
      
      public function setShuaXinNum(param1:int) : void
      {
         this.shuaXinNum = param1;
         this.shuaXinFta.htmlText = LanResManager.getLanCommonTextWords("免费刷新次数:") + param1;
         if(this.shuaXinNum == 0)
         {
            this.shuaXinBtn.label = LanResManager.getLanCommonTextWords("2元宝刷新");
         }
         else
         {
            this.shuaXinBtn.label = LanResManager.getLanCommonTextWords("刷新");
         }
      }
      
      public function setShuXing(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number) : void
      {
         this.colFta1.htmlText = LanResManager.getLanCommonTextWords("生命：") + param1 + "<br>" + LanResManager.getLanCommonTextWords("内力：") + param4 + "<br>" + LanResManager.getLanCommonTextWords("体力：") + param7;
         this.colFta2.htmlText = LanResManager.getLanCommonTextWords("攻击：") + param2 + "<br>" + LanResManager.getLanCommonTextWords("暴击：") + param5;
         this.colFta3.htmlText = LanResManager.getLanCommonTextWords("防御：") + param3 + "<br>" + LanResManager.getLanCommonTextWords("闪避：") + param6;
      }
      
      public function setTurn(param1:int = 0, param2:int = 0, param3:int = 5, param4:int = 1440) : void
      {
         this.shuaXinBtn.enabled = false;
         this.tuiMingBtn.enabled = false;
         var _loc5_:int = param4 + param1 * 36;
         this.curIndex = param1;
         this.goodId = param2;
         TweenLite.to(this.lineSpr,param3,{
            "rotation":_loc5_,
            "onComplete":this.onTurnOver,
            "ease":Quad.easeInOut
         });
      }
      
      public function lingQuGoods() : void
      {
         var backpackBtn:DisplayObject;
         var toPixelP:Point;
         var dis:Number;
         var dur:Number;
         var $itemFace:ItemFace = null;
         var onComplete:Function = null;
         onComplete = function():void
         {
            if($itemFace.parent != null)
            {
               $itemFace.parent.removeChild($itemFace);
               $itemFace.destroy();
            }
         };
         var goods:Goods = new Goods(this.goodId);
         $itemFace = new ItemFace(goods);
         var p:Point = this.localToGlobal(new Point(370,230));
         $itemFace.x = p.x;
         $itemFace.y = p.y;
         backpackBtn = GameInstance.uiInstance.mainUI.functionContainer.backpackBtn;
         toPixelP = backpackBtn.localToGlobal(new Point(backpackBtn.width / 2 - 15,backpackBtn.height / 2 - 20));
         dis = Point.distance(p,toPixelP);
         dur = dis * 0.003;
         GameInstance.stage.addChild($itemFace);
         TweenLite.to($itemFace,dur,{
            "x":toPixelP.x,
            "y":toPixelP.y,
            "alpha":0.35,
            "onComplete":onComplete
         });
      }
      
      public function setButton() : void
      {
         if(this.isMainChar)
         {
            this.shuaXinBtn.visible = true;
            this.tuiMingBtn.visible = true;
            this.shuaXinFta.visible = true;
            this.tuiMingFta.visible = true;
         }
         else
         {
            this.shuaXinBtn.visible = false;
            this.tuiMingBtn.visible = false;
            this.shuaXinFta.visible = false;
            this.tuiMingFta.visible = false;
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.shuaXinBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.TIANFU_SHUAXIN_CLICK));
               break;
            case this.tuiMingBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.TIANFU_TUIMING_CLICK));
               break;
            case this.xiangQianBtn:
               if(this.isMainChar)
               {
                  this.$parent.dispatchEvent(new BaseEvent(CharAttribute.TIANFU_XIANGQIAN_CLICK));
               }
               else
               {
                  this.$parent.dispatchEvent(new BaseEvent(TargetAttribute.TIANFU_XIANGQIAN_CLICK));
               }
               break;
            case this.lingQuBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.TIANFU_LINGQU_CLICK));
         }
      }
      
      public function onTurnOver() : void
      {
         this.shuaXinBtn.enabled = true;
         this.tuiMingBtn.enabled = true;
         this.setWeiLingQu(true,this.goodId);
      }
      
      public function tianfu_huanzhuang(param1:Boolean) : void
      {
         this.check.selectState = param1;
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.textColor = StaticValue.GREEN;
            this.fts1.htmlText = LanResManager.getLanCommonTextWords("绝世高手天赋隐藏属性(已激活)");
         }
         else
         {
            this.fts1.textColor = StaticValue.RED;
            this.fts1.htmlText = LanResManager.getLanCommonTextWords("绝世高手天赋隐藏属性(未激活)");
         }
      }
   }
}

