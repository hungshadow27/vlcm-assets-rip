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
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.chiBang.model.info.ChiBangVo;
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
   import flash.text.TextFieldAutoSize;
   import gs.TweenMax;
   
   public class ChiBang extends Sprite
   {
      
      public static const UI_CHIBANG_GUANBI_CLICK:String = "UI_CHIBANG_GUANBI_CLICK";
      
      public var _$parent:DisplayObject;
      
      private var feixingBtn:FSimpleButton;
      
      private var hechengBtn:SmallButton;
      
      private var jinjieBtn:SmallButton;
      
      private var jinjieBo:Boolean;
      
      private var check:FCheckBox;
      
      private var checkLabel:FLabel;
      
      private var shiyong:FTextArea;
      
      private var laiyuan:FTextArea;
      
      private var kuang:Bitmap;
      
      private var jinengSpr:Sprite;
      
      private var nengli:FTextArea;
      
      private var isMainChar:Boolean;
      
      private var chibangTupo:ChiBangTupoCanvas;
      
      private var nowId:int;
      
      private var lookingId:int;
      
      private var tupoBo:Boolean = false;
      
      private var bg1Spr:Sprite;
      
      private var bg2Spr:Sprite;
      
      private var bg3Spr:Sprite;
      
      private var bg4Spr:Sprite;
      
      private var bg5Spr:Sprite;
      
      private var bg6Spr:Sprite;
      
      private var bg7Spr:Sprite;
      
      private var bg8Spr:Sprite;
      
      private var boll1:DisplayObject;
      
      private var boll2:DisplayObject;
      
      private var boll3:DisplayObject;
      
      private var boll4:DisplayObject;
      
      private var boll5:DisplayObject;
      
      private var boll6:DisplayObject;
      
      private var boll7:DisplayObject;
      
      private var boll8:DisplayObject;
      
      private var boll:DisplayObject;
      
      private var barBg1:Bitmap;
      
      private var barBar1:ColorBar;
      
      private var barBar2:ColorBar;
      
      private var barBar3:ColorBar;
      
      private var barBar4:ColorBar;
      
      private var barBar5:ColorBar;
      
      private var barBar6:ColorBar;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var bloodMc:MovieClip;
      
      private var mcObj:Array;
      
      private var bloodMcSpr:Sprite;
      
      private var fc1:FCanvas;
      
      private var YulingHecheng:YuLingHeChengPanel;
      
      private var bgSpr:Sprite;
      
      private var bg:DisplayObject;
      
      private var yanhuaMc:MovieClip;
      
      private var jinjieMc:MovieClip;
      
      private var fts:FTextArea;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var fts3:FTextArea;
      
      private var suipian:int = 0;
      
      private var mainSkillContainer:Sprite;
      
      private var currSkill:ItemFace;
      
      private var p:Point;
      
      private var mainSkillItemFace:ItemFace;
      
      private var mainSkill:Skill;
      
      private var kuang1:Bitmap;
      
      private var fts4:FTextArea;
      
      private var huadie1:int = 0;
      
      private var huadie2:int = 0;
      
      private var huadie3:int = 0;
      
      private var huadie4:int = 0;
      
      private var check1:FCheckBox;
      
      private var checkLabel1:FLabel;
      
      private var fts5:FTextArea;
      
      private var fts6:FTextArea;
      
      private var fts7:FTextArea;
      
      private var check7:FCheckBox;
      
      private var fts8:FTextArea;
      
      private var check8:FCheckBox;
      
      private var fts9:FTextArea;
      
      private var check9:FCheckBox;
      
      private var fts10:FTextArea;
      
      private var check10:FCheckBox;
      
      public function ChiBang()
      {
         var ft1:FTextArea;
         var ft2:FTextArea;
         var ft3:FTextArea;
         var ft4:FTextArea;
         var $mask:Sprite;
         var i:int = 0;
         super();
         this.bgSpr = new Sprite();
         addChild(this.bgSpr);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/yuyi/bg.swf");
         this.bg.visible = true;
         this.bg.x = -1 + 4 - 1 - 1;
         this.bg.y = 1 + 4 - 2;
         this.bgSpr.addChild(this.bg);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         this.tip.x = 2;
         this.tip.y = 2;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.textColor = StaticValue.WHITE;
         this.tip.filters = StaticValue.filter;
         this.tipCanvas.addChild(this.tip);
         this.fc1 = new FCanvas();
         this.fc1.x = 0;
         this.fc1.y = 1;
         this.fc1.width = 403;
         this.fc1.height = 366;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 52 + 15;
         this.bloodMcSpr.y = 60;
         addChild(this.bloodMcSpr);
         this.bg1Spr = new Sprite();
         this.bg2Spr = new Sprite();
         this.bg3Spr = new Sprite();
         this.bg4Spr = new Sprite();
         this.bg5Spr = new Sprite();
         this.bg6Spr = new Sprite();
         this.bg7Spr = new Sprite();
         this.bg8Spr = new Sprite();
         this.bg1Spr.x = 30;
         this.bg1Spr.y = 180;
         addChild(this.bg1Spr);
         this.bg2Spr.x = 25 + 30 - 5;
         this.bg2Spr.y = 120 - 10;
         addChild(this.bg2Spr);
         this.bg3Spr.x = 88 - 16 + 15;
         this.bg3Spr.y = 88 - 52 + 12;
         addChild(this.bg3Spr);
         this.bg4Spr.x = 140;
         this.bg4Spr.y = 135 - 120;
         addChild(this.bg4Spr);
         this.bg5Spr.x = 220;
         this.bg5Spr.y = 135 - 120;
         addChild(this.bg5Spr);
         this.bg6Spr.x = 290 + 10 - 25;
         this.bg6Spr.y = 88 - 52 + 12;
         addChild(this.bg6Spr);
         this.bg7Spr.x = 340 - 25;
         this.bg7Spr.y = 120 - 10;
         addChild(this.bg7Spr);
         this.bg8Spr.x = 340;
         this.bg8Spr.y = 180;
         addChild(this.bg8Spr);
         this.boll = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/yuyi/xuanzhong.swf");
         this.boll.visible = true;
         this.boll.addEventListener(MouseEvent.CLICK,this.onClick2);
         this.feixingBtn = new FSimpleButton();
         addChild(this.feixingBtn);
         this.feixingBtn.x = 35 + 108 + 5;
         this.feixingBtn.y = 160 + 35;
         this.feixingBtn.skin = "feixingBtn";
         this.feixingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.feixingBtn.addEventListener(MouseEvent.MOUSE_OVER,this.onFeixingTip);
         this.feixingBtn.addEventListener(MouseEvent.MOUSE_OUT,this.onFeixingTip);
         this.hechengBtn = new SmallButton();
         this.hechengBtn.label = LanResManager.getLanCommonTextWords("羽灵合成");
         addChild(this.hechengBtn);
         this.hechengBtn.x = 150 + 150 + 30;
         this.hechengBtn.y = 190 + 140 + 5;
         this.hechengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.jinjieBtn = new SmallButton();
         this.jinjieBtn.label = LanResManager.getLanCommonTextWords("羽翼进阶");
         addChild(this.jinjieBtn);
         this.jinjieBtn.x = 270 + 30 + 30;
         this.jinjieBtn.y = 190 + 100 + 15 + 3 + 3;
         this.jinjieBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.x = 30 + 260 - 12;
         this.check.y = 190 + 10 + 17;
         this.check.enabled = true;
         this.check.addEventListener(MouseEvent.CLICK,this.onClick);
         this.checkLabel = new FLabel();
         with(this.checkLabel)
         {
            x = check.x + 20;
            --check.y;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("显示外观");
         }
         addChild(this.checkLabel);
         ft1 = new FTextArea();
         ft1.multiline = true;
         ft1.filters = StaticValue.filter;
         ft1.width = 100;
         ft1.height = 110;
         ft1.x = 15;
         ft1.y = 240 - 25 + 25 + 3;
         addChild(ft1);
         ft1.htmlText = "<font  color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("羽翼属性") + "</font>";
         this.shiyong = new FTextArea();
         this.shiyong.multiline = true;
         this.shiyong.filters = StaticValue.filter;
         this.shiyong.width = 160;
         this.shiyong.height = 50;
         this.shiyong.wordWrap = true;
         this.shiyong.x = 30 + 100 - 40 - 70;
         this.shiyong.y = 240 - 24 + 85 + 20 - 9;
         addChild(this.shiyong);
         this.laiyuan = new FTextArea();
         this.laiyuan.multiline = true;
         this.laiyuan.filters = StaticValue.filter;
         this.laiyuan.width = 100;
         this.laiyuan.height = 25;
         this.laiyuan.x = 30 + 200 + 40 - 250;
         this.laiyuan.y = 240 - 24 + 100 + 20 + 9;
         addChild(this.laiyuan);
         this.laiyuan.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'><a><u>" + LanResManager.getLanCommonTextWords("查看羽灵来源") + "</u></a></font>";
         this.laiyuan.addEventListener(MouseEvent.MOUSE_OVER,this.onFt2Tip);
         this.laiyuan.addEventListener(MouseEvent.MOUSE_OUT,this.onFt2Tip);
         ft2 = new FTextArea();
         ft2.multiline = true;
         ft2.filters = StaticValue.filter;
         ft2.width = 100;
         ft2.height = 60;
         ft2.x = 15;
         ft2.y = 260 - 25 + 25;
         addChild(ft2);
         ft2.htmlText = "<font  color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("生命体力攻击") + "</font>";
         ft3 = new FTextArea();
         ft3.multiline = true;
         ft3.filters = StaticValue.filter;
         ft3.width = 100;
         ft3.height = 60;
         ft3.x = 200 + 10;
         ft3.y = 260 - 25 + 25;
         addChild(ft3);
         ft3.htmlText = "<font  color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("防御暴击闪避") + "</font>";
         ft4 = new FTextArea();
         ft4.multiline = true;
         ft4.filters = StaticValue.filter;
         ft4.width = 60;
         ft4.height = 20;
         ft4.x = 125 + 58 - 15 + 3;
         ft4.y = 330 - 7;
         addChild(ft4);
         ft4.htmlText = "<font  color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("羽翼技能") + "</font>";
         i = 0;
         while(i < 3)
         {
            this.barBg1 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
            addChild(this.barBg1);
            this.barBg1.x = 50 + 12;
            this.barBg1.y = 238 + i * 16 + 25;
            i++;
         }
         i = 0;
         while(i < 3)
         {
            this.barBg1 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
            addChild(this.barBg1);
            this.barBg1.x = 50 + 185 + 20 + 10;
            this.barBg1.y = 238 + i * 16 + 25;
            i++;
         }
         this.barBar1 = new ColorBar(5,123,5);
         addChild(this.barBar1);
         this.barBar1.x = 50 + 4 + 12;
         this.barBar1.y = 238 + 3 + 25;
         this.barBar2 = new ColorBar(5,123,5);
         addChild(this.barBar2);
         this.barBar2.x = 50 + 4 + 12;
         this.barBar2.y = 238 + 3 + 16 + 25;
         this.barBar3 = new ColorBar(5,123,5);
         addChild(this.barBar3);
         this.barBar3.x = 50 + 4 + 12;
         this.barBar3.y = 238 + 3 + 32 + 25;
         this.barBar4 = new ColorBar(5,123,5);
         addChild(this.barBar4);
         this.barBar4.x = 50 + 4 + 185 + 30;
         this.barBar4.y = 238 + 3 + 25;
         this.barBar5 = new ColorBar(5,123,5);
         addChild(this.barBar5);
         this.barBar5.x = 50 + 4 + 185 + 30;
         this.barBar5.y = 238 + 3 + 16 + 25;
         this.barBar6 = new ColorBar(5,123,5);
         addChild(this.barBar6);
         this.barBar6.x = 50 + 4 + 185 + 30;
         this.barBar6.y = 238 + 3 + 32 + 25;
         i = 0;
         while(i < 2)
         {
            this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
            this.kuang.x = 25 + 45 * i + 180 + 33;
            this.kuang.y = 310 + 4;
            addChild(this.kuang);
            i++;
         }
         this.jinengSpr = new Sprite();
         this.jinengSpr.x = 25 + 2 + 180 + 33;
         this.jinengSpr.y = 310 + 2 + 4;
         addChild(this.jinengSpr);
         this.chibangTupo = new ChiBangTupoCanvas();
         addChild(this.chibangTupo);
         this.chibangTupo.x = 138;
         this.chibangTupo.y = -10;
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
         this.chibangTupo.mask = $mask;
         this.fts = new FTextArea();
         this.fts.x = 15 + 60 + 10;
         this.fts.y = 240 - 25 + 25 + 3;
         this.fts.textColor = StaticValue.RED;
         this.fts.width = 260;
         this.fts.height = 20;
         this.fts.htmlText = LanResManager.getLanCommonTextWords("天使圣光属性(未激活)");
         addChild(this.fts);
         ToolTips.createToolTips(this.fts,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击8888888、防御5888888、血量12888888、所有武功提升三层！") + "<br>" + LanResManager.getLanCommonTextWords("天使圣光（特殊技能）：攻击时有几率触发天使圣光技能，命中对手后将造成对手体力内力全失，并瞬间降低的血量，冷却时间分钟") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 7;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("真善无极技能书（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击588888888 防御488888888 暴击888 闪避888 血量1088888888、所有武功提升588层") + "<br>" + LanResManager.getLanCommonTextWords("真善无极：被攻击将有几率触发真善无极技能，可每秒恢复10%的血量，技能持续时间20秒，") + "<br>" + LanResManager.getLanCommonTextWords("当天使之翼等级达到最高级（8阶）时，技能触发技能将大幅度提升（翻倍）。");
            return _loc1_ + "</font></textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10 + 245;
         this.fts2.y = 7;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("神圣光辉净化（已激活）");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("神圣光辉净化：攻击888888888888 防御688000000000 血量988888888888暴击 88888闪避88888") + "<br>" + LanResManager.getLanCommonTextWords("神圣光辉特殊属性：青龙战纹5%、朱雀战纹4%、白虎战纹5% 所有武功提升88888层") + "<br>" + LanResManager.getLanCommonTextWords("神圣光辉 —— 激活神圣光辉净化秘籍的玩家，只需开启飞行模式后，即可清除自身当前所有负面状") + "<br>" + LanResManager.getLanCommonTextWords("态，且在飞行过程中必定触发5秒无敌效果，冷却时间30秒！");
            return _loc1_ + "</font></textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 7 + 20;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 170;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("天使之翼觉醒秘籍（已激活）");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("双击使用后，可激活天使之翼的觉醒属性，每次可使用天使觉醒之翼碎片×1进行加成，每次增加20亿攻击，武功2000层，每把上限500次。") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用") + suipian + LanResManager.getLanCommonTextWords("个天使觉醒之翼碎片");
            return _loc1_ + "</font></textformat>";
         });
         addEventListener(UI_CHIBANG_GUANBI_CLICK,this.onCloseTupo);
         this.mcObj = new Array();
         this.kuang1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang1);
         this.kuang1.x = 25 + 324 - 340;
         this.kuang1.y = 160 + 35 - 186 + 37;
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 25 + 2 + 324 - 340;
         this.mainSkillContainer.y = 160 + 2 + 35 - 186 + 37;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp);
         this.fts4 = new FTextArea();
         this.fts4.x = 10 + 245;
         this.fts4.y = 7 + 20;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 170;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("化蝶激活石（已激活）");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("化蝶：攻击12888888889000 防御10888888889000 血量13888888889000 暴击 88888闪避88888   所有武功2100000层") + "<br>" + LanResManager.getLanCommonTextWords("★化蝶 ——激活蓝色恋尘翅膀的玩家，每次受到伤害，都将有50%的几率免疫本次伤害，并对对手反弹一次50%的血量伤害，无冷却时间！") + "<br>" + LanResManager.getLanCommonTextWords("★化蝶特殊属性：激活该化蝶后，将开启化蝶隐藏属性，可使用相应的碎片（蝶恋一阶 、蝶恋二阶、蝶恋三阶、蝶恋四阶、）对该隐藏") + "<br>" + LanResManager.getLanCommonTextWords("属性进行养成，每种最多可养成200个。每个增加：攻击400亿，所有武功80000层。") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用") + huadie1 + LanResManager.getLanCommonTextWords("个蝶恋一阶") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击：") + huadie1 * 400 + LanResManager.getLanCommonTextWords("亿，所有武功:") + huadie1 * 80000 + LanResManager.getLanCommonTextWords("层") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用") + huadie2 + LanResManager.getLanCommonTextWords("个蝶恋二阶") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击：") + huadie2 * 400 + LanResManager.getLanCommonTextWords("亿，所有武功:") + huadie2 * 80000 + LanResManager
            .getLanCommonTextWords("层") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用") + huadie3 + LanResManager.getLanCommonTextWords("个蝶恋三阶") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击：") + huadie3 * 400 + LanResManager.getLanCommonTextWords("亿，所有武功:") + huadie3 * 80000 + LanResManager.getLanCommonTextWords("层") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用") + huadie4 + LanResManager.getLanCommonTextWords("个蝶恋四阶") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击：") + huadie4 * 400 + LanResManager.getLanCommonTextWords("亿，所有武功:") + huadie4 * 80000 + LanResManager.getLanCommonTextWords("层") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         this.check1 = new FCheckBox();
         addChild(this.check1);
         this.check1.x = 30 + 260 - 12 + 80;
         this.check1.y = 190 + 10 + 17 - 160 + 24;
         this.check1.enabled = true;
         this.check1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.checkLabel1 = new FLabel();
         with(this.checkLabel1)
         {
            x = 30 + 260 - 12 + 20 + 20;
            y = 190 + 10 + 17 - 160;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("显示化蝶之翼");
         }
         addChild(this.checkLabel1);
         this.fts5 = new FTextArea();
         this.fts5.x = 10;
         this.fts5.y = 7 + 20 + 20 + 174;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 170;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("翅膀进化石（已激活）");
         this.fts5.visible = false;
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击：50888亿、防御40888亿、血量60888亿、所有武功提升 408888层") + "<br>" + LanResManager.getLanCommonTextWords("大天使翅膀仙技：终极翅膀可继承天使之翼所有隐藏技能，即使人物没有飞行状态一样可以触发神") + "<br>" + LanResManager.getLanCommonTextWords("圣光辉技能效果，且可清除自身当前所有负面状态，状态清除后自身必定触发5秒无敌效果，冷却") + "<br>" + LanResManager.getLanCommonTextWords("时间30秒！") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         this.fts6 = new FTextArea();
         this.fts6.x = 10;
         this.fts6.y = 7 + 20 + 20 + 174 - 130;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 170;
         this.fts6.height = 20;
         this.fts6.htmlText = LanResManager.getLanCommonTextWords("比翼双飞秘籍（已激活）");
         this.fts6.visible = false;
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("激活比翼双飞的玩家，可每天在永久活动里领取双飞翼.") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         this.fts7 = new FTextArea();
         this.fts7.x = 10;
         this.fts7.y = 140;
         this.fts7.textColor = StaticValue.GREEN;
         this.fts7.width = 150;
         this.fts7.height = 20;
         this.fts7.htmlText = "Quang Thiên Dịch";
         addChild(this.fts7);
         this.check7 = new FCheckBox();
         addChild(this.check7);
         this.check7.x = 150;
         this.check7.y = 140;
         this.check7.enabled = true;
         this.check7.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fts8 = new FTextArea();
         this.fts8.x = 10;
         this.fts8.y = 160;
         this.fts8.textColor = StaticValue.GREEN;
         this.fts8.width = 150;
         this.fts8.height = 20;
         this.fts8.htmlText = "Cánh Long Kiếm";
         addChild(this.fts8);
         this.check8 = new FCheckBox();
         addChild(this.check8);
         this.check8.x = 150;
         this.check8.y = 160;
         this.check8.enabled = true;
         this.check8.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fts9 = new FTextArea();
         this.fts9.x = 260;
         this.fts9.y = 140;
         this.fts9.textColor = StaticValue.GREEN;
         this.fts9.width = 150;
         this.fts9.height = 20;
         this.fts9.htmlText = "Cánh Xúc Thủ";
         addChild(this.fts9);
         this.check9 = new FCheckBox();
         addChild(this.check9);
         this.check9.x = 380;
         this.check9.y = 140;
         this.check9.enabled = true;
         this.check9.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fts10 = new FTextArea();
         this.fts10.x = 260;
         this.fts10.y = 160;
         this.fts10.textColor = StaticValue.GREEN;
         this.fts10.width = 150;
         this.fts10.height = 20;
         this.fts10.htmlText = "Thất Tịch Thần Vũ 2024";
         addChild(this.fts10);
         this.check10 = new FCheckBox();
         addChild(this.check10);
         this.check10.x = 380;
         this.check10.y = 160;
         this.check10.enabled = true;
         this.check10.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onCloseTupo(param1:BaseEvent) : void
      {
         this.showTuPoPanel(false);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.feixingBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHIBANG_FEIXING_CLICK));
               break;
            case this.hechengBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHIBANG_HECHENG_SHOW));
               break;
            case this.jinjieBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHIBANG_LINGWU_SHOW,"",this.lookingId));
         }
         switch(param1.currentTarget)
         {
            case this.check:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHIBANG_WAIGUAN_CLICK,"",this.check.selectState));
               break;
            case this.check1:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHIBANG_HUADIE_CLICK,"",this.check1.selectState));
               break;
            case this.check7:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check7.selectState,735834]));
               break;
            case this.check8:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check8.selectState,735954]));
               break;
            case this.check9:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check9.selectState,7500075]));
               break;
            case this.check10:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check10.selectState,738704]));
         }
      }
      
      private function onClick2(param1:MouseEvent) : void
      {
         if(!this.isMainChar)
         {
            return;
         }
         if(this.lookingId == int(param1.target.name))
         {
            return;
         }
         this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHIBANG_HUANYE_CLICK,"",int(param1.target.name)));
         this.showTuPoPanel(false);
      }
      
      private function onFt2Tip(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.laiyuan.addEventListener(MouseEvent.MOUSE_MOVE,this.onFt2Tip);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("羽灵共有八种，由低到高为：天使羽灵一阶，天使羽灵二阶，天使羽灵三阶，天使羽灵四阶，天使羽灵五阶，天使羽灵六阶，天使羽灵七阶以及天使羽灵八阶。") + "<br></font>" + "<font color=\'" + StaticValue.GREEN_STRONG_HTML + "\'>" + LanResManager.getLanCommonTextWords("玩家可以从野外掉落或商城购买来获得天使羽灵一阶，然后通过羽灵合成功能合成天使羽灵二阶，以此类推最终合成至天使羽灵八阶。") + "<br></font>" + "<font color=\'" + StaticValue.PURPLE_HTML + "\'>" + LanResManager.getLanCommonTextWords("各阶羽灵对应羽翼的各个阶段使用增加羽翼属性。") + "<br></font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("此外，参加心魔活动击杀心魔可获得大量的天使羽灵一阶！") + "</font>" + "</textformat>";
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.laiyuan.removeEventListener(MouseEvent.MOUSE_MOVE,this.onFt2Tip);
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 5;
         this.tipCanvas.y = mouseY + 5;
      }
      
      private function onFeixingTip(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.feixingBtn.addEventListener(MouseEvent.MOUSE_MOVE,this.onFeixingTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("展翅凌空将在天使之翼升至八阶时可使用，使用本功能后玩家将进入飞行状态，") + "<br>" + LanResManager.getLanCommonTextWords("飞行时玩家的闪避将大幅提升！飞行时将消耗一定的体力值。") + "</textformat>";
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.feixingBtn.removeEventListener(MouseEvent.MOUSE_MOVE,this.onFeixingTip);
         }
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
         this.chibangTupo._parent2 = param1;
         this.chibangTupo._parent3 = this;
      }
      
      public function setWupin(param1:String) : void
      {
         this.shiyong.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("双击使用") + param1 + LanResManager.getLanCommonTextWords("增加羽翼属性") + "</font>";
      }
      
      public function showChiBang(param1:int) : void
      {
         if(param1 == 0)
         {
            this.check.selectState = false;
            this.check1.selectState = false;
         }
         else if(param1 == 1)
         {
            this.check.selectState = true;
            this.check1.selectState = false;
         }
         else if(param1 == 2)
         {
            this.check.selectState = false;
            this.check1.selectState = true;
         }
      }
      
      public function setInitialize(param1:ChiBangVo, param2:Boolean) : void
      {
         this.setJiHuoTianshi(param2);
         this.isMainChar = param2;
         this.setWupin(param1.goodsName);
         this.setBg(param1.lookId);
         this.yuyidengji(param1.nowId);
         this.setShuxingJiacheng(param1.shengMing,param1.maxShengMing,param1.tiLi,param1.maxTiLi,param1.gongJi,param1.maxGongJi,param1.fangYu,param1.maxFangYu,param1.baoJi,param1.maxBaoJi,param1.shanBi,param1.maxShanBi);
         var _loc3_:Object = param1.nameArr[param1.lookId];
         this.setZhenFaTiSheng(param1.lookId,param1.nowId);
         this.setSkill(param1.skillId,param1.isLearned,param1.skillId2,param1.isLearned2);
         if(param1.isShow)
         {
            this.showChiBang(1);
         }
         if(param1.nowId == 8 && this.isMainChar)
         {
            this.feixingBtn.filters = [];
            this.feixingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         }
         else
         {
            this.feixingBtn.filters = Tools.blackWhiteFilter;
            if(this.feixingBtn.hasEventListener(MouseEvent.CLICK))
            {
               this.feixingBtn.removeEventListener(MouseEvent.CLICK,this.onClick);
            }
         }
      }
      
      public function setJiHuoTianshi(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.TIANSHIZHIYI_ZHENSHANWUJI_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.TIANSHIZHIYI_SHENSHENGGUANGHUI_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.TIANSHIZHIYI_JUEXINGMIJI_ID];
            this.suipian = GameState.dictMainStatus[SpecialGoodsID.TIANSHIZHIYI_JUEXINGSUIPIAN_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.TIANSHIZHIYI_HUANYINGFENSHEN_ID])
            {
               this.setSkillJiHuo(200236,true);
               this.mainSkillContainer.visible = true;
               this.kuang1.visible = true;
            }
            else
            {
               this.mainSkillContainer.visible = false;
               this.kuang1.visible = false;
            }
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.TIANSHIZHIYI_HUADIE_ID];
            this.check1.visible = GameState.dictMainStatus[SpecialGoodsID.TIANSHIZHIYI_HUADIE_ID];
            this.checkLabel1.visible = GameState.dictMainStatus[SpecialGoodsID.TIANSHIZHIYI_HUADIE_ID];
            this.huadie1 = GameState.dictMainStatus[SpecialGoodsID.TIANSHIZHIYI_HUADIE1_ID];
            this.huadie2 = GameState.dictMainStatus[SpecialGoodsID.TIANSHIZHIYI_HUADIE2_ID];
            this.huadie3 = GameState.dictMainStatus[SpecialGoodsID.TIANSHIZHIYI_HUADIE3_ID];
            this.huadie4 = GameState.dictMainStatus[SpecialGoodsID.TIANSHIZHIYI_HUADIE4_ID];
            this.fts5.visible = GameState.dictMainStatus[SpecialGoodsID.CHIBANG_JINHUASHI_ID];
            this.fts6.visible = GameState.dictMainStatus[SpecialGoodsID.CHIBANG_BIYISHUANGFEI_ID];
            this.fts7.visible = GameState.dictMainStatus[735834];
            this.check7.visible = this.fts7.visible;
            this.fts8.visible = GameState.dictMainStatus[735954];
            this.check8.visible = this.fts8.visible;
            this.fts9.visible = GameState.dictMainStatus[7500075];
            this.check9.visible = this.fts9.visible;
            this.fts10.visible = GameState.dictMainStatus[738704];
            this.check10.visible = this.fts10.visible;
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.TIANSHIZHIYI_ZHENSHANWUJI_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.TIANSHIZHIYI_SHENSHENGGUANGHUI_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.TIANSHIZHIYI_JUEXINGMIJI_ID];
            this.suipian = GameState.dictTargetStatus[SpecialGoodsID.TIANSHIZHIYI_JUEXINGSUIPIAN_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.TIANSHIZHIYI_HUANYINGFENSHEN_ID])
            {
               this.setSkillJiHuo(200236,true);
               this.mainSkillContainer.visible = true;
               this.kuang1.visible = true;
            }
            else
            {
               this.mainSkillContainer.visible = false;
               this.kuang1.visible = false;
            }
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.TIANSHIZHIYI_HUADIE_ID];
            this.check1.visible = GameState.dictTargetStatus[SpecialGoodsID.TIANSHIZHIYI_HUADIE_ID];
            this.checkLabel1.visible = GameState.dictTargetStatus[SpecialGoodsID.TIANSHIZHIYI_HUADIE_ID];
            this.huadie1 = GameState.dictTargetStatus[SpecialGoodsID.TIANSHIZHIYI_HUADIE1_ID];
            this.huadie2 = GameState.dictTargetStatus[SpecialGoodsID.TIANSHIZHIYI_HUADIE2_ID];
            this.huadie3 = GameState.dictTargetStatus[SpecialGoodsID.TIANSHIZHIYI_HUADIE3_ID];
            this.huadie4 = GameState.dictTargetStatus[SpecialGoodsID.TIANSHIZHIYI_HUADIE4_ID];
            this.fts5.visible = GameState.dictTargetStatus[SpecialGoodsID.CHIBANG_JINHUASHI_ID];
            this.fts6.visible = GameState.dictTargetStatus[SpecialGoodsID.CHIBANG_BIYISHUANGFEI_ID];
            this.fts7.visible = GameState.dictTargetStatus[735834];
            this.check7.visible = false;
            this.fts8.visible = GameState.dictTargetStatus[735954];
            this.check8.visible = false;
            this.fts9.visible = GameState.dictTargetStatus[7500075];
            this.check9.visible = false;
            this.fts10.visible = GameState.dictTargetStatus[738704];
            this.check10.visible = false;
         }
      }
      
      public function setShuxingJiacheng(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:int) : void
      {
         this.barBar1.setValue(param1 > param2 ? param2 : param1,param2);
         this.barBar2.setValue(param3 > param4 ? param4 : param3,param4);
         this.barBar3.setValue(param5 > param6 ? param6 : param5,param6);
         this.barBar4.setValue(param7 > param8 ? param8 : param7,param8);
         this.barBar5.setValue(param9 > param10 ? param10 : param9,param10);
         this.barBar6.setValue(param11 > param12 ? param12 : param11,param12);
         if(param1 >= param2)
         {
            this.jinjieBo = true;
         }
         else
         {
            this.jinjieBo = false;
         }
      }
      
      private function setBg(param1:int) : void
      {
         var mcId:int = 0;
         var loadUrl:String = null;
         var lookid:int = param1;
         mcId = 0;
         if(lookid == 1 || lookid == 2)
         {
            mcId = 1;
         }
         else if(lookid == 3)
         {
            mcId = 2;
         }
         else if(lookid == 4 || lookid == 5)
         {
            mcId = 3;
         }
         else if(lookid == 6)
         {
            mcId = 4;
         }
         else if(lookid == 7)
         {
            mcId = 5;
         }
         else if(lookid == 8)
         {
            mcId = 6;
         }
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/yuyi/" + mcId + ".swf";
         if(Boolean(this.bloodMc) && this.bloodMc.parent != null)
         {
            this.bloodMc.stop();
            this.bloodMc.parent.removeChild(this.bloodMc);
         }
         while(this.bloodMcSpr.numChildren > 0)
         {
            this.bloodMcSpr.removeChildAt(0);
         }
         if(this.mcObj[mcId] != null)
         {
            this.bloodMc = this.mcObj[mcId];
            this.bloodMc.play();
            this.bloodMcSpr.addChild(this.bloodMc);
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
               if(Boolean(bloodMc) && bloodMc.parent != null)
               {
                  bloodMc.stop();
                  bloodMc.parent.removeChild(bloodMc);
               }
               while(bloodMcSpr.numChildren > 0)
               {
                  bloodMcSpr.removeChildAt(0);
               }
               bloodMc = _loc2_.content as MovieClip;
               mcObj[mcId] = bloodMc;
               if(bloodMc)
               {
                  bloodMcSpr.addChild(bloodMc);
               }
            },null,false,loadUrl);
         }
      }
      
      private function yuyidengji(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < 8)
         {
            if(this["boll" + String(_loc2_ + 1)])
            {
               if(this["boll" + String(_loc2_ + 1)].parent)
               {
                  this["boll" + String(_loc2_ + 1)].parent.removeChild(this["boll" + String(_loc2_ + 1)]);
               }
            }
            this["boll" + String(_loc2_ + 1)] = null;
            if(_loc2_ < 4)
            {
               if(_loc2_ < param1)
               {
                  this["boll" + String(_loc2_ + 1)] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/yuyi/zuoliang.swf");
               }
               else
               {
                  this["boll" + String(_loc2_ + 1)] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/yuyi/zuoan.swf");
               }
            }
            else if(_loc2_ < param1)
            {
               this["boll" + String(_loc2_ + 1)] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/yuyi/youliang.swf");
            }
            else
            {
               this["boll" + String(_loc2_ + 1)] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/yuyi/youan.swf");
            }
            this["bg" + String(_loc2_ + 1) + "Spr"].addChild(this["boll" + String(_loc2_ + 1)]);
            this["boll" + String(_loc2_ + 1)].visible = true;
            this["boll" + String(_loc2_ + 1)].name = String(_loc2_ + 1);
            this["boll" + String(_loc2_ + 1)].addEventListener(MouseEvent.CLICK,this.onClick2);
            _loc2_++;
         }
      }
      
      public function setZhenFaTiSheng(param1:int, param2:int = -1) : void
      {
         this.nowId = param2;
         this.lookingId = param1;
         this.boll.visible = true;
         this.boll.name = String(this.lookingId);
         this.boll.x = -21 + 7 - 2 - 1;
         this.boll.y = -21 + 8 - 2;
         this["bg" + String(this.lookingId) + "Spr"].addChild(this.boll);
         if(this.tupoBo)
         {
            this.jinjieBtn.label = LanResManager.getLanCommonTextWords("羽翼进阶");
            this.jinjieBtn.enabled = false;
            this.closejinjie();
            this.hechengBtn.enabled = false;
         }
         else if(param1 < param2)
         {
            this.jinjieBtn.label = LanResManager.getLanCommonTextWords("已进阶");
            this.jinjieBtn.enabled = false;
            this.closejinjie();
         }
         else if(param1 == param2)
         {
            if(param2 == 8)
            {
               this.jinjieBtn.label = LanResManager.getLanCommonTextWords("已进阶");
               this.jinjieBo = false;
            }
            else
            {
               this.jinjieBtn.label = LanResManager.getLanCommonTextWords("羽翼进阶");
            }
            if(this.jinjieBo)
            {
               this.jinjieBtn.enabled = true;
               this.showjinjie();
            }
            else
            {
               this.jinjieBtn.enabled = false;
               this.closejinjie();
            }
         }
         else if(param1 > param2)
         {
            this.jinjieBtn.label = LanResManager.getLanCommonTextWords("不可进阶");
            this.jinjieBtn.enabled = false;
            this.closejinjie();
         }
      }
      
      public function setSkill(param1:int, param2:Boolean, param3:int, param4:Boolean) : void
      {
         var _loc5_:ItemFace = null;
         var _loc7_:ItemFace = null;
         while(this.jinengSpr.numChildren > 0)
         {
            this.jinengSpr.removeChildAt(0);
         }
         var _loc6_:Skill = new Skill(param1);
         _loc6_.isLearn = param2 == true ? 1 : 0;
         _loc5_ = new ItemFace(_loc6_);
         _loc5_.showKungFuTag();
         _loc5_.setShowCount(false);
         this.jinengSpr.addChild(_loc5_);
         var _loc8_:Skill = new Skill(param3);
         _loc8_.isLearn = param4 == true ? 1 : 0;
         _loc7_ = new ItemFace(_loc8_);
         _loc7_.showKungFuTag();
         _loc7_.setShowCount(false);
         _loc7_.x = 45;
         this.jinengSpr.addChild(_loc7_);
      }
      
      public function showTuPoPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.chibangTupo.x == 138)
            {
               TweenMax.to(this.chibangTupo,1,{"x":410});
               this.tupoBo = true;
               this.jinjieBtn.enabled = false;
               this.closejinjie();
               this.hechengBtn.enabled = false;
            }
         }
         else
         {
            if(this.chibangTupo.x == 410)
            {
               TweenMax.to(this.chibangTupo,1,{"x":138});
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHIBANG_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.jinjieBtn.enabled = true;
            this.hechengBtn.enabled = true;
         }
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.chibangTupo.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setTupoInit(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.chibangTupo.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.chibangTupo.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.chibangTupo.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.chibangTupo.setTuPoBtn(param1);
      }
      
      public function setEnableFun() : void
      {
         this.feixingBtn.enabled = false;
         this.hechengBtn.enabled = false;
         this.jinjieBtn.enabled = false;
         this.closejinjie();
         this.check.enabled = false;
         this.check1.enabled = false;
      }
      
      public function showlihua() : void
      {
         if(this.lookingId == 7)
         {
            if(Boolean(this.yanhuaMc) && this.yanhuaMc.parent != null)
            {
               this.yanhuaMc.parent.removeChild(this.yanhuaMc);
            }
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               yanhuaMc = _loc2_.content as MovieClip;
               yanhuaMc.x = 52 + 15 - 124;
               yanhuaMc.y = 60 - 182 - 6;
               addChild(yanhuaMc);
            },null,false,GameConfig.fileBaseFolder + "res/ui/UIditu/yuyi/shengji.swf");
         }
      }
      
      public function showjinjie() : void
      {
         if(Boolean(this.jinjieMc) && this.jinjieMc.parent != null)
         {
            this.jinjieMc.parent.removeChild(this.jinjieMc);
         }
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            jinjieMc = _loc2_.content as MovieClip;
            jinjieMc.x = 52 + 15 - 124 + 367 + 6 - 1;
            jinjieMc.y = 60 - 182 - 6 + 434 - 4 - 1;
            addChild(jinjieMc);
         },null,false,GameConfig.fileBaseFolder + "res/ui/UIditu/yuyi/jinjie.swf");
      }
      
      public function closejinjie() : void
      {
         if(Boolean(this.jinjieMc) && this.jinjieMc.parent != null)
         {
            this.jinjieMc.parent.removeChild(this.jinjieMc);
         }
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts.textColor = StaticValue.GREEN;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("天使圣光属性(已激活)");
         }
         else
         {
            this.fts.textColor = StaticValue.RED;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("天使圣光属性(未激活)");
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
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DINGCHANJUE_SKILL_DRAG,"",this.currSkill));
            }
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         }
      }
      
      private function onSkillMouseUp(param1:MouseEvent) : void
      {
         this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
      }
      
      public function setSkillJiHuo(param1:int, param2:Boolean) : void
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
         var _loc3_:Skill = new Skill(param1);
         this.mainSkill = _loc3_;
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
   }
}

