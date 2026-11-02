package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.zhenwuqijiezhen.model.info.ZhenWuQiJieZhenVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   import gs.TweenMax;
   
   public class ZhenWuQiJieZhen extends Sprite
   {
      
      public static const UI_ZHENWUQIJIEZHEN_GUANBI_CLICK:String = "UI_ZHENWUQIJIEZHEN_GUANBI_CLICK";
      
      private var bgSpr:Sprite;
      
      private var bg:DisplayObject;
      
      private var fc1:FCanvas;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      private var cengshu:FTextArea;
      
      private var lingWuBtn:SmallButton;
      
      private var zhenwuqijiezhenTupo:ZhenWuQiJieZhenTupoCanvas;
      
      public var $parent:DisplayObject;
      
      private var ZHENFA_MAX:int = 7;
      
      private var dqId:int;
      
      private var miaoshu:FTextArea;
      
      private var shuxing:FTextArea;
      
      private var wugong:FTextArea;
      
      private var isDoubleFT:FTextArea;
      
      private var nowId:int;
      
      private var lookingId:int;
      
      private var tupoBo:Boolean = false;
      
      private var p:Point;
      
      private var kuang:Bitmap;
      
      private var mainSkill:Skill;
      
      private var mainSkillItemFace:ItemFace;
      
      private var mainSkillContainer:Sprite;
      
      private var currSkill:ItemFace;
      
      private var zhenwuMC:MovieClip;
      
      private var mcObj:Array;
      
      private var bloodMcSpr:Sprite;
      
      private var bg1Spr:Sprite;
      
      private var bg2Spr:Sprite;
      
      private var bg3Spr:Sprite;
      
      private var bg4Spr:Sprite;
      
      private var bg5Spr:Sprite;
      
      private var bg6Spr:Sprite;
      
      private var bg7Spr:Sprite;
      
      private var boll1:DisplayObject;
      
      private var boll2:DisplayObject;
      
      private var boll3:DisplayObject;
      
      private var boll4:DisplayObject;
      
      private var boll5:DisplayObject;
      
      private var boll6:DisplayObject;
      
      private var boll7:DisplayObject;
      
      private var bb:int = 0;
      
      private var doubleText:FTextArea;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var riyue:int = 0;
      
      private var mowen:int = 0;
      
      private var sheshen:int = 0;
      
      private var tianpu:int = 0;
      
      private var jingxing:int = 0;
      
      private var qinggan:int = 0;
      
      private var youlong:int = 0;
      
      private var fts3:FTextArea;
      
      private var checkZq:FCheckBox;
      
      private var equipContainers:Sprite;
      
      private var kuangHD:Bitmap;
      
      private var isMain:Boolean;
      
      private var fts4:FTextArea;
      
      private var checkWq:FCheckBox;
      
      private var fts5:FTextArea;
      
      private var checkWq2:FCheckBox;
      
      private var fts6:FTextArea;
      
      private var checkZq2:FCheckBox;
      
      private var fts7:FTextArea;
      
      public function ZhenWuQiJieZhen()
      {
         var zhenwu:FTextArea;
         var fujia:FTextArea;
         var fujiajineng:FTextArea;
         var $mask:Sprite;
         super();
         this.bgSpr = new Sprite();
         addChild(this.bgSpr);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/zhenwuqijiezhen/bg.swf");
         this.bg.visible = true;
         this.bg.x = -1;
         this.bg.y = 1;
         this.bgSpr.addChild(this.bg);
         this.fc1 = new FCanvas();
         this.fc1.x = 0;
         this.fc1.y = 1;
         this.fc1.width = 403;
         this.fc1.height = 366;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.fc1 = new FCanvas();
         this.fc1.x = 0 + 2;
         this.fc1.y = 1 + 2;
         this.fc1.width = 403 - 4;
         this.fc1.height = 275 - 50 + 23;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.fc1 = new FCanvas();
         this.fc1.x = 0 + 2;
         this.fc1.y = 282 - 5 - 50 + 23;
         this.fc1.width = 403 - 4;
         this.fc1.height = 80 + 5 + 2 + 50 - 23;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 0;
         this.bloodMcSpr.y = 0;
         addChild(this.bloodMcSpr);
         this.bg1Spr = new Sprite();
         this.bg1Spr.x = 256 + 1 - 16 + 5;
         this.bg1Spr.y = 127 + 45 - 15 + 2;
         addChild(this.bg1Spr);
         this.bg2Spr = new Sprite();
         this.bg2Spr.x = 288 + 1 - 16 + 5;
         this.bg2Spr.y = 100 - 15 + 2;
         addChild(this.bg2Spr);
         this.bg3Spr = new Sprite();
         this.bg3Spr.x = 240 + 1 - 16 + 5;
         this.bg3Spr.y = 10 + 3 - 15 + 2;
         addChild(this.bg3Spr);
         this.bg4Spr = new Sprite();
         this.bg4Spr.x = 130 - 2 - 16 + 5;
         this.bg4Spr.y = 15 - 2 - 15 + 2;
         addChild(this.bg4Spr);
         this.bg5Spr = new Sprite();
         this.bg5Spr.x = 95 + 3 - 16 + 5;
         this.bg5Spr.y = 100 - 1 - 15 + 2;
         addChild(this.bg5Spr);
         this.bg6Spr = new Sprite();
         this.bg6Spr.x = 172 + 1 - 16 + 5;
         this.bg6Spr.y = 172 - 15 + 2;
         addChild(this.bg6Spr);
         this.bg7Spr = new Sprite();
         this.bg7Spr.x = 190 + 4 - 16 + 5;
         this.bg7Spr.y = 90 + 10 - 15 + 2;
         addChild(this.bg7Spr);
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "previousButton";
         addChild(this.previousButton);
         this.previousButton.x = 140 + 5 - 5 - 5;
         this.previousButton.y = 195 - 5 + 10 + 23;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cengshu = new FTextArea();
         addChild(this.cengshu);
         this.cengshu.multiline = true;
         this.cengshu.autoSize = TextFieldAutoSize.CENTER;
         this.cengshu.wordWrap = true;
         this.cengshu.width = 60;
         this.cengshu.height = 30;
         this.cengshu.x = 150 + 26;
         this.cengshu.y = 200 + 23;
         this.cengshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("第一层") + "</font>";
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "nextButton";
         addChild(this.nextButton);
         this.nextButton.x = 235 - 5 - 5;
         this.nextButton.y = 195 - 5 + 10 + 23;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lingWuBtn = new SmallButton();
         this.lingWuBtn.label = LanResManager.getLanCommonTextWords("阵法提升");
         addChild(this.lingWuBtn);
         this.lingWuBtn.x = 335 - 23;
         this.lingWuBtn.y = 195 - 1 - 5 + 10 + 23;
         this.lingWuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         zhenwu = new FTextArea();
         addChild(zhenwu);
         zhenwu.multiline = true;
         zhenwu.autoSize = TextFieldAutoSize.CENTER;
         zhenwu.wordWrap = true;
         zhenwu.width = 150;
         zhenwu.height = 30;
         zhenwu.x = 25 + 33;
         zhenwu.y = 265 - 20 + 12;
         zhenwu.htmlText = "<font size = \'14\' color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("真武七截阵") + "</font>";
         this.miaoshu = new FTextArea();
         addChild(this.miaoshu);
         this.miaoshu.multiline = true;
         this.miaoshu.autoSize = TextFieldAutoSize.CENTER;
         this.miaoshu.wordWrap = true;
         this.miaoshu.width = 160;
         this.miaoshu.height = 120;
         this.miaoshu.x = 25 - 12;
         this.miaoshu.y = 280;
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("由真武大帝搞出来的") + "</font>";
         fujia = new FTextArea();
         addChild(fujia);
         fujia.multiline = true;
         fujia.autoSize = TextFieldAutoSize.CENTER;
         fujia.wordWrap = true;
         fujia.width = 150;
         fujia.height = 30;
         fujia.x = 210 - 18;
         fujia.y = 265 - 20 + 12;
         fujia.htmlText = "<font size = \'14\' color=\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("附加属性") + "</font>";
         this.shuxing = new FTextArea();
         addChild(this.shuxing);
         this.shuxing.multiline = true;
         this.shuxing.autoSize = TextFieldAutoSize.CENTER;
         this.shuxing.wordWrap = true;
         this.shuxing.width = 190;
         this.shuxing.height = 130;
         this.shuxing.x = 210 - 18;
         this.shuxing.y = 265 + 12;
         this.shuxing.htmlText = "<textformat leading=\'1\'><font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：") + "<br>" + LanResManager.getLanCommonTextWords("防御：") + "<br>" + LanResManager.getLanCommonTextWords("生命：") + "<br>" + LanResManager.getLanCommonTextWords("暴击：") + "<br>" + LanResManager.getLanCommonTextWords("闪避：") + "</font>";
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 303 + 20 - 4 + 20 - 3;
         this.kuang.y = 298 - 39 + 3;
         fujiajineng = new FTextArea();
         addChild(fujiajineng);
         fujiajineng.multiline = true;
         fujiajineng.autoSize = TextFieldAutoSize.CENTER;
         fujiajineng.wordWrap = true;
         fujiajineng.width = 150;
         fujiajineng.height = 30;
         fujiajineng.x = 303 + 25;
         fujiajineng.y = 320 - 8;
         fujiajineng.htmlText = "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("附加技能") + "</font>";
         this.wugong = new FTextArea();
         addChild(this.wugong);
         this.wugong.multiline = true;
         this.wugong.autoSize = TextFieldAutoSize.CENTER;
         this.wugong.wordWrap = true;
         this.wugong.width = 150;
         this.wugong.height = 30;
         this.wugong.x = 210 - 10 + 88;
         this.wugong.y = 260 + 70 + 6;
         this.wugong.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("所有武功增加") + "</font>";
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 303 + 20 - 4 + 20 + 2 - 3;
         this.mainSkillContainer.y = 298 - 39 + 2 + 3;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp);
         this.zhenwuqijiezhenTupo = new ZhenWuQiJieZhenTupoCanvas();
         addChild(this.zhenwuqijiezhenTupo);
         this.zhenwuqijiezhenTupo.x = 138;
         this.zhenwuqijiezhenTupo.y = -10;
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
         this.zhenwuqijiezhenTupo.mask = $mask;
         addEventListener(UI_ZHENWUQIJIEZHEN_GUANBI_CLICK,this.aa1);
         this.mcObj = new Array();
         this.doubleText = new FTextArea();
         with(this.doubleText)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 5;
            y = 14;
            textColor = StaticValue.RED;
            htmlText = LanResManager.getLanCommonTextWords("武当真人附体已激活");
         }
         this.doubleText.visible = false;
         addChild(this.doubleText);
         ToolTips.createToolTips(this.doubleText,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("武当真人附体特殊属性加成：") + "<br>" + LanResManager.getLanCommonTextWords("攻击：4888888、防御：1688888、生命：16888888、暴击：2000、闪避：2000") + "<br>" + LanResManager.getLanCommonTextWords("武当真人附体额外属性加成：") + "<br>" + LanResManager.getLanCommonTextWords("将100%抵抗七截阵诀技能，使对手的无视防御并且攻击7次的特殊技能效果无效，且所有武功提升12层。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts1 = new FTextArea();
         this.fts1.x = 5;
         this.fts1.y = 14 + 20;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("真武破敌合击术（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击5688888888888 防御4288888888888 血量6088888888888暴击 88888闪避88888") + "<br>" + LanResManager.getLanCommonTextWords("青龙战纹5%、朱雀战纹4%、白虎战纹5% 所有武功1000000层") + "<br>" + LanResManager.getLanCommonTextWords("真武破敌 —— 被攻击时100%触发真武破敌，在此状态下可100%破除对手的无敌状态，对对手造成攻击") + "<br>" + LanResManager.getLanCommonTextWords("伤害和技能效果，真武破敌效果持续30秒，冷却时间180秒！");
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 5;
         this.fts2.y = 14 + 20 + 20;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("七剑下天山秘籍（已激活）");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("七剑下天山：攻击12888888889000 防御10888888889000 血量13888888889000 暴击88888 闪避88888") + "<br>" + LanResManager.getLanCommonTextWords("★七剑下天山特殊属性：激活该秘籍后，将开启真武七截阵隐藏属性，可使用相应的碎片（日月剑") + "<br>" + LanResManager.getLanCommonTextWords("碎片 、莫问剑碎片、 舍神剑碎片、 天瀑剑碎片 、竞星剑碎片、 青干剑碎片、 由龙剑碎片）对该隐") + "<br>" + LanResManager.getLanCommonTextWords("藏属性进行养成，每个碎片最多可养成200个。") + "<br>" + LanResManager.getLanCommonTextWords("每个增加：攻击200亿，所有武功20000层。") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用日月剑碎片") + " " + riyue + " " + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用莫问剑碎片") + " " + mowen + " " + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用舍神剑碎片") + " " + sheshen + " " + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用天瀑剑碎片") + " " + tianpu + " " + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager
            .getLanCommonTextWords("当前已使用竟星剑碎片") + " " + jingxing + " " + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用青干剑碎片") + " " + qinggan + " " + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用由龙剑碎片") + " " + youlong + " " + LanResManager.getLanCommonTextWords("个") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 5;
         this.fts3.y = 14 + 20 + 20 + 20;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 110;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("蜀山") + "•" + LanResManager.getLanCommonTextWords("神剑仙秘籍");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击12888888889000 防御10888888889000 血量13888888889000") + "<br>" + LanResManager.getLanCommonTextWords("暴击 88888闪避 88888所有武功3000000层") + "<br>" + LanResManager.getLanCommonTextWords("神剑召唤：蜀山神剑拥有召唤金角兽之力，人物可自己召唤。") + "<br>" + LanResManager.getLanCommonTextWords("神剑仙：攻击时100%触发神剑仙，持续10秒；在此状态下，自身将金光普照，所有对") + "<br>" + LanResManager.getLanCommonTextWords("将无法对自身发起攻击操作；且金光状态下，所有对手将被视为异物，每次产生一个金") + "<br>" + LanResManager.getLanCommonTextWords("四射，范围5格内的所有玩家都将瞬间被反噬倒退，且瞬间掉血80%。冷却60秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkZq = new FCheckBox();
         addChild(this.checkZq);
         this.checkZq.x = 256 + 117 - 280 + 15 + 10;
         this.checkZq.y = 14 + 20 + 20 + 20;
         this.checkZq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.equipContainers = new Sprite();
         this.equipContainers.x = 343 + 8;
         this.equipContainers.y = 12 + 30 + 135;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick00,false,30);
         addChild(this.equipContainers);
         this.fts4 = new FTextArea();
         this.fts4.x = 5;
         this.fts4.y = 14 + 20 + 20 + 20 + 20;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 110;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("邪皇魔刀");
         this.fts4.visible = false;
         addChild(this.fts4);
         this.checkWq = new FCheckBox();
         addChild(this.checkWq);
         this.checkWq.visible = false;
         this.checkWq.x = 256 + 117 - 280 + 15 - 50;
         this.checkWq.y = 14 + 20 + 20 + 20 + 20;
         this.checkWq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts5 = new FTextArea();
         this.fts5.x = 5;
         this.fts5.y = 14 + 20 + 20 + 20 + 20 + 25;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 110;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("巨龙之击");
         this.fts5.visible = false;
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击 68888亿、防御60888亿、血量80888亿、所有武功提升 880000层") + "<br>" + LanResManager.getLanCommonTextWords("巨龙之击：由巨龙脊柱所造，赋有神力，每次挥舞都带来地动山摇，如同巨龙的巨力一击。") + "<br>" + LanResManager.getLanCommonTextWords("巨龙重击：攻击时有几率触发巨龙重击，持续10秒；在此状态下，自身将得到巨龙的力量，") + "<br>" + LanResManager.getLanCommonTextWords("对手每受到一次攻击，都将掉血50%，并造成眩晕，持续10秒；眩晕状态解除后，对手在") + "<br>" + LanResManager.getLanCommonTextWords("巨龙的强到气场下，失去行动能力，防御降为0，持续5秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkWq2 = new FCheckBox();
         addChild(this.checkWq2);
         this.checkWq2.visible = false;
         this.checkWq2.x = 256 + 117 - 280 + 15 - 50;
         this.checkWq2.y = 14 + 20 + 20 + 20 + 20 + 25;
         this.checkWq2.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts6 = new FTextArea();
         this.fts6.x = 5;
         this.fts6.y = 14 + 20 + 20 + 20 + 20 + 25 + 25;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 110;
         this.fts6.height = 20;
         this.fts6.htmlText = LanResManager.getLanCommonTextWords("獬豸");
         this.fts6.visible = false;
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击 68888亿、防御60888亿、血量80888亿、所有武功提升 880000层") + "<br>" + LanResManager.getLanCommonTextWords("獬豸：古代汉族神话传说中的瑞兽") + "<br>" + LanResManager.getLanCommonTextWords("特殊效果：攻击时有几率触獬豸威慑，持续10秒；在此状态下，自身不管移动到哪，") + "<br>" + LanResManager.getLanCommonTextWords("每秒都将使自身范围5格内的所有对手产生威慑力，可瞬间震晕5格内的所有对手；") + "<br>" + LanResManager.getLanCommonTextWords("且对手在此状态下，若5秒内无法脱逃可瞬间在造成流失血量80%，且所有勋章失效") + "<br>" + LanResManager.getLanCommonTextWords("作用，持续5秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkZq2 = new FCheckBox();
         addChild(this.checkZq2);
         this.checkZq2.x = 256 + 117 - 280 + 15 - 50;
         this.checkZq2.y = 14 + 20 + 20 + 20 + 20 + 25 + 25;
         this.checkZq2.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts7 = new FTextArea();
         this.fts7.x = 5;
         this.fts7.y = 14 + 20 + 20 + 20 + 20 + 25 + 25 + 20;
         this.fts7.textColor = StaticValue.GREEN;
         this.fts7.width = 110 + 20;
         this.fts7.height = 20;
         this.fts7.htmlText = LanResManager.getLanCommonTextWords("天地盾秘籍（已激活）");
         this.fts7.visible = false;
         addChild(this.fts7);
         ToolTips.createToolTips(this.fts7,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击：206888亿、防御202888亿、血量200888亿、所有武功提升 880000层") + "<br>" + LanResManager.getLanCommonTextWords("特殊技能：被攻击时有几率触发天地盾，持续10秒；在此状态下，不管对手触发") + "<br>" + LanResManager.getLanCommonTextWords("攻击触发任何效果，自身都将不会被命中，即使是不可清除的BUFF，且在此状态") + "<br>" + LanResManager.getLanCommonTextWords("下，只要对手攻击，可立即复制对手的所有效果叠加自身。") + "<br>";
            return _loc1_ + "</textformat>";
         });
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.checkZq:
               this.checkZq2.selectState = false;
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkZq.selectState,40]));
               break;
            case this.checkWq:
               this.checkWq2.selectState = false;
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkWq.selectState,78]));
               break;
            case this.checkZq2:
               this.checkZq.selectState = false;
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkZq2.selectState,105]));
               break;
            case this.checkWq2:
               this.checkWq.selectState = false;
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkWq2.selectState,104]));
         }
      }
      
      private function aa1(param1:BaseEvent) : void
      {
         this.showTuPoPanel(false);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.previousButton:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ZHENWUQIJIEZHEN_SHANGYIYE_CLICK));
               break;
            case this.nextButton:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ZHENWUQIJIEZHEN_XIAYIYE_CLICK));
               break;
            case this.lingWuBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ZHENWUQIJIEZHEN_LINGWU_SHOW));
               this.showTuPoPanel(true);
         }
      }
      
      private function onSkillMouseDown(param1:MouseEvent) : void
      {
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currSkill = param1.target as ItemFace;
      }
      
      private function onSkillMouseMove(param1:MouseEvent) : void
      {
         if(this.currSkill != param1.target)
         {
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            if((this.currSkill.getBaseItem() as Skill).res.useway == 1 && (this.currSkill.getBaseItem() as Skill).isLearn == 1)
            {
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ZHENWUQIJIEZHEN_SKILL_DRAG,"",this.currSkill));
            }
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         }
      }
      
      private function onSkillMouseUp(param1:MouseEvent) : void
      {
         this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this.$parent = param1;
         this.zhenwuqijiezhenTupo._parent2 = param1;
         this.zhenwuqijiezhenTupo._parent3 = this;
      }
      
      public function setInitialize(param1:Boolean, param2:ZhenWuQiJieZhenVO) : void
      {
         this.isMain = param1;
         this.checkZq.selectState = param2.isZuoQi;
         this.checkWq.selectState = param2.isWuQi;
         this.checkZq2.selectState = param2.isZuoQi2;
         this.checkWq2.selectState = param2.isWuQi2;
         this.setBg(param2.nowLookingID);
         this.setShuxingJiacheng(param2.isZhenwuZonggang,param2.act,param2.actNum,param2.def,param2.defNum,param2.hp,param2.hpNum,param2.bj,param2.bjNum,param2.sb,param2.sbNum,param2.miaoshu,param2.wugongStr);
         this.setZhenFaTiSheng(param2.nowLookingName,param2.nowLookingID,param2.nowID);
         this.setSkill(param2.skill,param2.isLearn);
         this.setZhenrenFutiJihuo(param2.isZhenwuFuti);
         this.setJiHuo(param1);
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.ZHENWUQIJIEZHEN_ZHENWUPODI_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.ZHENWU_QIJIANMIJI_ID];
            this.riyue = GameState.dictMainStatus[SpecialGoodsID.ZHENWU_RIYUEJIAN_ID];
            this.mowen = GameState.dictMainStatus[SpecialGoodsID.ZHENWU_MOWENJIAN_ID];
            this.sheshen = GameState.dictMainStatus[SpecialGoodsID.ZHENWU_SHESHENJIAN_ID];
            this.tianpu = GameState.dictMainStatus[SpecialGoodsID.ZHENWU_TIANPUJIAN_ID];
            this.qinggan = GameState.dictMainStatus[SpecialGoodsID.ZHENWU_QINGGANJIAN_ID];
            this.youlong = GameState.dictMainStatus[SpecialGoodsID.ZHENWU_YOULONGJIAN_ID];
            this.jingxing = GameState.dictMainStatus[SpecialGoodsID.ZHENWU_JINGXINGJIAN_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.ZHENWUQIJIEZHEN_SHENJIANXIAN_ID])
            {
               this.fts3.visible = true;
               this.checkZq.visible = true;
            }
            else
            {
               this.fts3.visible = false;
               this.checkZq.visible = false;
            }
            this.fts7.visible = GameState.dictMainStatus[SpecialGoodsID.ZHENWUQIJIEZHEN_TIANDIDUN_ID];
            this.fts6.visible = GameState.dictMainStatus[SpecialGoodsID.ZHENWUQIJIEZHEN_XIEZHI_ID];
            this.checkZq2.visible = GameState.dictMainStatus[SpecialGoodsID.ZHENWUQIJIEZHEN_XIEZHI_ID];
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.ZHENWUQIJIEZHEN_ZHENWUPODI_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.ZHENWU_QIJIANMIJI_ID];
            this.riyue = GameState.dictTargetStatus[SpecialGoodsID.ZHENWU_RIYUEJIAN_ID];
            this.mowen = GameState.dictTargetStatus[SpecialGoodsID.ZHENWU_MOWENJIAN_ID];
            this.sheshen = GameState.dictTargetStatus[SpecialGoodsID.ZHENWU_SHESHENJIAN_ID];
            this.tianpu = GameState.dictTargetStatus[SpecialGoodsID.ZHENWU_TIANPUJIAN_ID];
            this.qinggan = GameState.dictTargetStatus[SpecialGoodsID.ZHENWU_QINGGANJIAN_ID];
            this.youlong = GameState.dictTargetStatus[SpecialGoodsID.ZHENWU_YOULONGJIAN_ID];
            this.jingxing = GameState.dictTargetStatus[SpecialGoodsID.ZHENWU_JINGXINGJIAN_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.ZHENWUQIJIEZHEN_SHENJIANXIAN_ID])
            {
               this.fts3.visible = true;
               this.checkZq.visible = true;
            }
            else
            {
               this.fts3.visible = false;
               this.checkZq.visible = false;
            }
            this.fts7.visible = GameState.dictTargetStatus[SpecialGoodsID.ZHENWUQIJIEZHEN_TIANDIDUN_ID];
            this.fts6.visible = GameState.dictTargetStatus[SpecialGoodsID.ZHENWUQIJIEZHEN_XIEZHI_ID];
            this.checkZq2.visible = GameState.dictTargetStatus[SpecialGoodsID.ZHENWUQIJIEZHEN_XIEZHI_ID];
         }
      }
      
      private function setBg(param1:int) : void
      {
         var i:int;
         var loadUrl:String = null;
         var lookid:int = param1;
         if(this.zhenwuMC != null)
         {
            if(this.zhenwuMC.parent != null)
            {
               this.zhenwuMC.parent.removeChild(this.zhenwuMC);
            }
            addChildAt(this.zhenwuMC,2);
            this.zhenwuMC.x = -1;
            this.zhenwuMC.y = 1;
            this.zhenwuMC.gotoAndStop(lookid);
         }
         else
         {
            loadUrl = GameConfig.fileBaseFolder + "res/data/mc/zhenwuqijiezhen/line.swf";
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               zhenwuMC = _loc2_.content as MovieClip;
               if(zhenwuMC)
               {
                  zhenwuMC.gotoAndStop(lookid);
                  zhenwuMC.x = -1;
                  zhenwuMC.y = 1;
                  zhenwuMC.visible = true;
                  addChildAt(zhenwuMC,2);
               }
            },null,false,loadUrl);
         }
         i = 0;
         while(i < 7)
         {
            if(this["boll" + String(i + 1)])
            {
               if(this["boll" + String(i + 1)].parent)
               {
                  this["boll" + String(i + 1)].parent.removeChild(this["boll" + String(i + 1)]);
               }
            }
            this["boll" + String(i + 1)] = null;
            if(i < lookid)
            {
               this["boll" + String(i + 1)] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/zhenwuqijiezhen/xuanzhong.swf");
            }
            else
            {
               this["boll" + String(i + 1)] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/zhenwuqijiezhen/weijihuo.swf");
            }
            this["boll" + String(i + 1)].visible = true;
            this["bg" + String(i + 1) + "Spr"].addChild(this["boll" + String(i + 1)]);
            i++;
         }
      }
      
      public function setShuxingJiacheng(param1:Boolean, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:String, param13:String) : void
      {
         var _loc14_:String = "";
         _loc14_ = _loc14_ + "<textformat leading=\'1\'>";
         if(param3 == 1)
         {
            if(param1)
            {
               _loc14_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：") + param2 + "×2" + "</font><br>";
            }
            else
            {
               _loc14_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：") + param2 + "</font><br>";
            }
         }
         else if(param1)
         {
            _loc14_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：") + param2 + "×" + param3 + "×2" + "</font><br>";
         }
         else
         {
            _loc14_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：") + param2 + "×" + param3 + "</font><br>";
         }
         if(param5 == 1)
         {
            if(param1)
            {
               _loc14_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("防御：") + param4 + "×2" + "</font><br>";
            }
            else
            {
               _loc14_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("防御：") + param4 + "</font><br>";
            }
         }
         else if(param1)
         {
            _loc14_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("防御：") + param4 + "×" + param5 + "×2" + "</font><br>";
         }
         else
         {
            _loc14_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("防御：") + param4 + "×" + param5 + "</font><br>";
         }
         if(param7 == 1)
         {
            if(param1)
            {
               _loc14_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("生命：") + param6 + "×2" + "</font><br>";
            }
            else
            {
               _loc14_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("生命：") + param6 + "</font><br>";
            }
         }
         else if(param1)
         {
            _loc14_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("生命：") + param6 + "×" + param7 + "×2" + "</font><br>";
         }
         else
         {
            _loc14_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("生命：") + param6 + "×" + param7 + "</font><br>";
         }
         if(param9 == 1)
         {
            if(param1)
            {
               _loc14_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("暴击：") + param8 + "×2" + "</font><br>";
            }
            else
            {
               _loc14_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("暴击：") + param8 + "</font><br>";
            }
         }
         else if(param1)
         {
            _loc14_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("暴击：") + param8 + "×" + param9 + "×2" + "</font><br>";
         }
         else
         {
            _loc14_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("暴击：") + param8 + "×" + param9 + "</font><br>";
         }
         if(param11 == 1)
         {
            if(param1)
            {
               _loc14_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("闪避：") + param10 + "×2" + "</font><br>";
            }
            else
            {
               _loc14_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("闪避：") + param10 + "</font><br>";
            }
         }
         else if(param1)
         {
            _loc14_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("闪避：") + param10 + "×" + param11 + "×2" + "</font><br>";
         }
         else
         {
            _loc14_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("闪避：") + param10 + "×" + param11 + "</font><br>";
         }
         _loc14_ += "</textformat>";
         this.shuxing.htmlText = _loc14_;
         if(param1)
         {
            this.wugong.htmlText = "<font color=\'" + StaticValue.GOLD_HTML + "\'>" + param13 + "×2" + "</font>";
         }
         else
         {
            this.wugong.htmlText = "<font color=\'" + StaticValue.GOLD_HTML + "\'>" + param13 + "</font>";
         }
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + param12 + "</font>";
      }
      
      public function setZhenFaTiSheng(param1:String, param2:int, param3:int = -1) : void
      {
         this.cengshu.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "</font>";
         this.nowId = param3;
         this.lookingId = param2;
         if(this.tupoBo)
         {
            this.previousButton.enabled = false;
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("阵法提升");
            this.lingWuBtn.enabled = false;
            this.nextButton.enabled = false;
         }
         else
         {
            if(param2 <= 1)
            {
               this.previousButton.enabled = false;
            }
            else
            {
               this.previousButton.enabled = true;
            }
            if(param2 >= this.ZHENFA_MAX)
            {
               this.nextButton.enabled = false;
            }
            else
            {
               this.nextButton.enabled = true;
            }
            if(param2 < param3 + 1)
            {
               this.lingWuBtn.label = LanResManager.getLanCommonTextWords("已领悟");
               this.lingWuBtn.enabled = false;
            }
            else if(param2 == param3 + 1)
            {
               this.lingWuBtn.label = LanResManager.getLanCommonTextWords("阵法提升");
               this.lingWuBtn.enabled = true;
            }
            else if(param2 > param3 + 1)
            {
               this.lingWuBtn.label = LanResManager.getLanCommonTextWords("不可领悟");
               this.lingWuBtn.enabled = false;
            }
         }
      }
      
      public function setSkill(param1:Skill, param2:Boolean) : void
      {
         while(this.mainSkillContainer.numChildren > 0)
         {
            this.mainSkillContainer.removeChildAt(0);
         }
         if(this.mainSkillItemFace)
         {
            if(this.mainSkillItemFace.parent)
            {
               this.mainSkillItemFace.parent.removeChild(this.mainSkillItemFace);
            }
         }
         this.mainSkill = param1;
         if(param2)
         {
            this.mainSkill.isLearn = 1;
         }
         else
         {
            this.mainSkill.isLearn = 0;
         }
         this.mainSkillItemFace = new ItemFace(this.mainSkill);
         this.mainSkillItemFace.showKungFuTag();
         this.mainSkillItemFace.setShowCount(false);
         this.mainSkillContainer.addChild(this.mainSkillItemFace);
      }
      
      public function showTuPoPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.zhenwuqijiezhenTupo.x == 138)
            {
               TweenMax.to(this.zhenwuqijiezhenTupo,1,{"x":410});
               this.tupoBo = true;
               this.bb = 1;
               this.previousButton.enabled = false;
               this.nextButton.enabled = false;
               this.lingWuBtn.enabled = false;
            }
         }
         else
         {
            if(this.zhenwuqijiezhenTupo.x == 410)
            {
               TweenMax.to(this.zhenwuqijiezhenTupo,1,{"x":138});
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ZHENWUQIJIEZHEN_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.bb = 0;
            this.previousButton.enabled = true;
            this.nextButton.enabled = true;
            this.lingWuBtn.enabled = true;
            if(this.lookingId == 1)
            {
               this.previousButton.enabled = false;
            }
            if(this.lookingId >= this.ZHENFA_MAX)
            {
               this.nextButton.enabled = false;
            }
         }
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.zhenwuqijiezhenTupo.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setTupoInit(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.zhenwuqijiezhenTupo.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.zhenwuqijiezhenTupo.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.zhenwuqijiezhenTupo.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.zhenwuqijiezhenTupo.setTuPoBtn(param1);
      }
      
      public function setEnableFun() : void
      {
         this.previousButton.enabled = false;
         this.nextButton.enabled = false;
         this.lingWuBtn.enabled = false;
      }
      
      public function setZhenrenFutiJihuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.doubleText.visible = true;
         }
         else
         {
            this.doubleText.visible = false;
         }
      }
      
      private function onItemClick00(param1:MouseEvent) : void
      {
         if(this.isMain)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function set_ZhenWuQiJieZhen(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.equipContainers.numChildren > 0)
         {
            this.equipContainers.removeChildAt(0);
         }
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuangHD.x = -32;
         this.kuangHD.y = -170;
         this.equipContainers.addChild(this.kuangHD);
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuangHD.x = 9;
         this.kuangHD.y = -170;
         this.equipContainers.addChild(this.kuangHD);
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuangHD.x = 9;
         this.kuangHD.y = -130;
         this.equipContainers.addChild(this.kuangHD);
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuangHD.x = 9;
         this.kuangHD.y = -90;
         this.equipContainers.addChild(this.kuangHD);
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuangHD.x = -32;
         this.kuangHD.y = -130;
         this.equipContainers.addChild(this.kuangHD);
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuangHD.x = 9;
         this.kuangHD.y = -50;
         this.equipContainers.addChild(this.kuangHD);
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuangHD.x = -32;
         this.kuangHD.y = -50;
         this.equipContainers.addChild(this.kuangHD);
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            if(_loc3_.res.position == ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_MODAO)
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.equipContainers.addChild(this.kuangHD);
               this.kuangHD.x = 0;
               this.kuangHD.y = 0;
               _loc4_.x = 2;
               _loc4_.y = 2;
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
            else if(_loc3_.res.position == ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_JULONGZHIJI)
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.equipContainers.addChild(this.kuangHD);
               this.kuangHD.x = -40;
               this.kuangHD.y = 0;
               _loc4_.x = 2 - 40;
               _loc4_.y = 2;
               this.equipContainers.addChild(_loc4_);
               if(_loc4_ != null)
               {
                  this.checkWq2.visible = true;
                  this.fts5.visible = true;
               }
               else
               {
                  this.checkWq2.visible = false;
                  this.fts5.visible = false;
               }
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_CHANGHONGJIANZHU)
            {
               _loc4_.x = -32 + 2;
               _loc4_.y = -170 + 2;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_BINGPOJIANZHU)
            {
               _loc4_.x = 9 + 2;
               _loc4_.y = -170 + 2;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_ZIYUNJIANZHU)
            {
               _loc4_.x = 9 + 2;
               _loc4_.y = -130 + 2;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_YUHUAJIANZHU)
            {
               _loc4_.x = 9 + 2;
               _loc4_.y = -90 + 2;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_BENLEIJIANZHU)
            {
               _loc4_.x = -32 + 2;
               _loc4_.y = -130 + 2;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_QINGGUANGJIANZHU)
            {
               _loc4_.x = 9 + 2;
               _loc4_.y = -50 + 2;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_QUANFENGJIANZHU)
            {
               _loc4_.x = -32 + 2;
               _loc4_.y = -50 + 2;
               this.equipContainers.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
   }
}

