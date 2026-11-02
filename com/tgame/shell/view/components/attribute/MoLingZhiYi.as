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
   import com.tgame.moudels.molingzhiyi.model.info.MoLingZhiYiVO;
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
   
   public class MoLingZhiYi extends Sprite
   {
      
      public static const UI_MOLINGZHIYI_GUANBI_CLICK:String = "UI_MOLINGZHIYI_GUANBI_CLICK";
      
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
      
      private var molingzhiyiTupo:MoLingZhiYiTupoCanvas;
      
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
      
      private var TCball1:MovieClip;
      
      private var TCball2:MovieClip;
      
      private var TCball3:MovieClip;
      
      private var TCball4:MovieClip;
      
      private var TCball5:MovieClip;
      
      private var TCball6:MovieClip;
      
      private var TCball7:MovieClip;
      
      private var TCball8:MovieClip;
      
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
      
      private var molingshi:int = 0;
      
      private var fts1:FTextArea;
      
      private var moshi1:int = 0;
      
      private var moshi2:int = 0;
      
      private var moshi3:int = 0;
      
      private var moshi4:int = 0;
      
      private var moshi5:int = 0;
      
      private var moshi6:int = 0;
      
      private var moshi7:int = 0;
      
      private var moshi8:int = 0;
      
      private var dengjie1:Boolean = false;
      
      private var dengjie2:Boolean = false;
      
      private var dengjie3:Boolean = false;
      
      private var dengjie4:Boolean = false;
      
      private var dengjie5:Boolean = false;
      
      private var dengjie6:Boolean = false;
      
      private var dengjie7:Boolean = false;
      
      private var dengjie8:Boolean = false;
      
      private var fts2:FTextArea;
      
      private var fts3:FTextArea;
      
      private var checkZq:FCheckBox;
      
      private var fts4:FTextArea;
      
      private var checkCB:FCheckBox;
      
      private var fts5:FTextArea;
      
      private var mainSkillContainer:Sprite;
      
      private var currSkill:ItemFace;
      
      private var p:Point;
      
      private var mainSkillItemFace:ItemFace;
      
      private var mainSkill:Skill;
      
      private var kuang1:Bitmap;
      
      public function MoLingZhiYi()
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
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/molingzhiyi/bg.swf");
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
         this.bloodMcSpr.x = 52 + 15 - 2;
         this.bloodMcSpr.y = 60 - 25;
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
         this.bg1Spr.y = 180 - 10;
         addChild(this.bg1Spr);
         this.bg2Spr.x = 25 + 30 - 5;
         this.bg2Spr.y = 120 - 10 - 10;
         addChild(this.bg2Spr);
         this.bg3Spr.x = 88 - 16 + 15;
         this.bg3Spr.y = 88 - 52 + 12 - 10;
         addChild(this.bg3Spr);
         this.bg4Spr.x = 140;
         this.bg4Spr.y = 135 - 120 - 10;
         addChild(this.bg4Spr);
         this.bg5Spr.x = 220;
         this.bg5Spr.y = 135 - 120 - 10;
         addChild(this.bg5Spr);
         this.bg6Spr.x = 290 + 10 - 25;
         this.bg6Spr.y = 88 - 52 + 12 - 10;
         addChild(this.bg6Spr);
         this.bg7Spr.x = 340 - 25;
         this.bg7Spr.y = 120 - 10 - 10;
         addChild(this.bg7Spr);
         this.bg8Spr.x = 340;
         this.bg8Spr.y = 180 - 10;
         addChild(this.bg8Spr);
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
         this.check.x = 30 + 260 - 12 - 20;
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
         this.laiyuan.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'><a><u>" + LanResManager.getLanCommonTextWords("查看羽灵来源") + "</u></a></font>";
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
         ft3.x = 200;
         ft3.y = 260 - 25 + 25;
         addChild(ft3);
         ft3.htmlText = "<font  color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("防御暴击闪避") + "</font>";
         ft4 = new FTextArea();
         ft4.multiline = true;
         ft4.filters = StaticValue.filter;
         ft4.width = 60;
         ft4.height = 20;
         ft4.x = 125 + 58;
         ft4.y = 330 - 7;
         addChild(ft4);
         ft4.htmlText = "<font  color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("羽翼技能") + "</font>";
         i = 0;
         while(i < 3)
         {
            this.barBg1 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
            addChild(this.barBg1);
            this.barBg1.x = 50;
            this.barBg1.y = 238 + i * 16 + 25;
            i++;
         }
         i = 0;
         while(i < 3)
         {
            this.barBg1 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
            addChild(this.barBg1);
            this.barBg1.x = 50 + 185;
            this.barBg1.y = 238 + i * 16 + 25;
            i++;
         }
         this.barBar1 = new ColorBar(5,123,5);
         addChild(this.barBar1);
         this.barBar1.x = 50 + 4;
         this.barBar1.y = 238 + 3 + 25;
         this.barBar2 = new ColorBar(5,123,5);
         addChild(this.barBar2);
         this.barBar2.x = 50 + 4;
         this.barBar2.y = 238 + 3 + 16 + 25;
         this.barBar3 = new ColorBar(5,123,5);
         addChild(this.barBar3);
         this.barBar3.x = 50 + 4;
         this.barBar3.y = 238 + 3 + 32 + 25;
         this.barBar4 = new ColorBar(5,123,5);
         addChild(this.barBar4);
         this.barBar4.x = 50 + 4 + 185;
         this.barBar4.y = 238 + 3 + 25;
         this.barBar5 = new ColorBar(5,123,5);
         addChild(this.barBar5);
         this.barBar5.x = 50 + 4 + 185;
         this.barBar5.y = 238 + 3 + 16 + 25;
         this.barBar6 = new ColorBar(5,123,5);
         addChild(this.barBar6);
         this.barBar6.x = 50 + 4 + 185;
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
         this.molingzhiyiTupo = new MoLingZhiYiTupoCanvas();
         addChild(this.molingzhiyiTupo);
         this.molingzhiyiTupo.x = 138;
         this.molingzhiyiTupo.y = -10;
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
         this.molingzhiyiTupo.mask = $mask;
         this.fts = new FTextArea();
         this.fts.x = 10;
         this.fts.y = 7;
         this.fts.textColor = StaticValue.GREEN;
         this.fts.width = 170;
         this.fts.height = 20;
         this.fts.htmlText = LanResManager.getLanCommonTextWords("魔灵心法秘籍(已激活)");
         this.fts.visible = false;
         addChild(this.fts);
         ToolTips.createToolTips(this.fts,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性：攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("特殊属性：激活该秘籍后，可使用魔灵石进行养成属性，每次可增加攻击100亿，所有武功提升20000层！最多使用500个！") + "<br>" + LanResManager.getLanCommonTextWords("已养成") + molingshi + LanResManager.getLanCommonTextWords("次") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + molingshi * 100 + LanResManager.getLanCommonTextWords("亿  提升武功") + molingshi * 20000 + LanResManager.getLanCommonTextWords("层");
            return _loc1_ + "</textformat>";
         });
         addEventListener(UI_MOLINGZHIYI_GUANBI_CLICK,this.onCloseTupo);
         this.mcObj = new Array();
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 7 + 20;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 130;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("幻神之翼秘籍(已激活)");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("幻神之翼：攻击12888888889000 防御10888888889000 血量13888888889000 暴击 88888闪避88888   所有武功2100000层") + "<br>" + LanResManager.getLanCommonTextWords("★幻神之翼——   只有传说中出现过它的身影，没有人真正了解它，来无影去无踪。激活幻神之翼的玩家将100%无视所有减") + "<br>" + LanResManager.getLanCommonTextWords("体力效果，并且体力值不会低于50%，飞行状态将永久不受对手打落飞行状态的效果！") + "<br>" + LanResManager.getLanCommonTextWords("★幻神之翼特殊属性：激活该秘籍后，将开启幻神之翼特殊属性，每个魔灵可灌注对应的魔灵石。") + "<br>" + LanResManager.getLanCommonTextWords("每个增加：攻击200亿，所有武功20000层。") + "<br>";
            if(dengjie1)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("魔灵一阶已激活") + "     ";
            }
            else
            {
               _loc1_ += LanResManager.getLanCommonTextWords("魔灵一阶未激活") + "     ";
            }
            _loc1_ += LanResManager.getLanCommonTextWords("已灌注") + moshi1 + LanResManager.getLanCommonTextWords("颗") + LanResManager.getLanCommonTextWords("一阶魔灵石") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + moshi1 * 200 + LanResManager.getLanCommonTextWords("亿  提升武功") + moshi1 * 20000 + LanResManager.getLanCommonTextWords("层") + "<br>";
            if(dengjie2)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("魔灵二阶已激活") + "     ";
            }
            else
            {
               _loc1_ += LanResManager.getLanCommonTextWords("魔灵二阶未激活") + "     ";
            }
            _loc1_ += LanResManager.getLanCommonTextWords("已灌注") + moshi2 + LanResManager.getLanCommonTextWords("颗") + LanResManager.getLanCommonTextWords("二阶魔灵石") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + moshi2 * 200 + LanResManager.getLanCommonTextWords("亿  提升武功") + moshi2 * 20000 + LanResManager.getLanCommonTextWords("层") + "<br>";
            if(dengjie3)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("魔灵三阶已激活") + "     ";
            }
            else
            {
               _loc1_ += LanResManager.getLanCommonTextWords("魔灵三阶未激活") + "     ";
            }
            _loc1_ += LanResManager.getLanCommonTextWords("已灌注") + moshi3 + LanResManager.getLanCommonTextWords("颗") + LanResManager.getLanCommonTextWords("三阶魔灵石") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + moshi3 * 200 + LanResManager.getLanCommonTextWords("亿  提升武功") + moshi3 * 20000 + LanResManager.getLanCommonTextWords("层") + "<br>";
            if(dengjie4)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("魔灵四阶已激活") + "     ";
            }
            else
            {
               _loc1_ += LanResManager.getLanCommonTextWords("魔灵四阶未激活") + "     ";
            }
            _loc1_ += LanResManager.getLanCommonTextWords("已灌注") + moshi4 + LanResManager.getLanCommonTextWords("颗") + LanResManager.getLanCommonTextWords("四阶魔灵石") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + moshi4 * 200 + LanResManager.getLanCommonTextWords("亿  提升武功") + moshi4 * 20000 + LanResManager.getLanCommonTextWords("层") + "<br>";
            if(dengjie5)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("魔灵五阶已激活") + "     ";
            }
            else
            {
               _loc1_ += LanResManager.getLanCommonTextWords("魔灵五阶未激活") + "     ";
            }
            _loc1_ += LanResManager.getLanCommonTextWords("已灌注") + moshi5 + LanResManager.getLanCommonTextWords("颗") + LanResManager.getLanCommonTextWords("五阶魔灵石") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + moshi5 * 200 + LanResManager.getLanCommonTextWords("亿  提升武功") + moshi5 * 20000 + LanResManager.getLanCommonTextWords("层") + "<br>";
            if(dengjie6)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("魔灵六阶已激活") + "     ";
            }
            else
            {
               _loc1_ += LanResManager.getLanCommonTextWords("魔灵六阶未激活") + "     ";
            }
            _loc1_ += LanResManager.getLanCommonTextWords("已灌注") + moshi6 + LanResManager.getLanCommonTextWords("颗") + LanResManager.getLanCommonTextWords("六阶魔灵石") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + moshi6 * 200 + LanResManager.getLanCommonTextWords("亿  提升武功") + moshi6 * 20000 + LanResManager.getLanCommonTextWords("层") + "<br>";
            if(dengjie7)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("魔灵七阶已激活") + "     ";
            }
            else
            {
               _loc1_ += LanResManager.getLanCommonTextWords("魔灵七阶未激活") + "     ";
            }
            _loc1_ += LanResManager.getLanCommonTextWords("已灌注") + moshi7 + LanResManager.getLanCommonTextWords("颗") + LanResManager.getLanCommonTextWords("七阶魔灵石") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + moshi7 * 200 + LanResManager.getLanCommonTextWords("亿  提升武功") + moshi7 * 20000 + LanResManager.getLanCommonTextWords("层") + "<br>";
            if(dengjie8)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("魔灵八阶已激活") + "     ";
            }
            else
            {
               _loc1_ += LanResManager.getLanCommonTextWords("魔灵八阶未激活") + "     ";
            }
            _loc1_ += LanResManager.getLanCommonTextWords("已灌注") + moshi8 + LanResManager.getLanCommonTextWords("颗") + LanResManager.getLanCommonTextWords("八阶魔灵石") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + moshi8 * 200 + LanResManager.getLanCommonTextWords("亿  提升武功") + moshi8 * 20000 + LanResManager.getLanCommonTextWords("层") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10 + 255;
         this.fts2.y = 7;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("魔灵圣域秘籍(已激活)");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            return _loc1_ + ("<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性：攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 600000层") + "<br>" + LanResManager.getLanCommonTextWords("魔灵圣域（特殊技能）：飞行状态下将100%触发圣域加持状态，持续3秒。在此状态下自身将100%闪") + "<br>" + LanResManager.getLanCommonTextWords("避对手所有技能效果，不在命中任何技能。且当圣域加持状态解除后，立即清除自身所有负面状态，") + "<br>" + LanResManager.getLanCommonTextWords("且免疫所有负面状态，持续8秒，冷却60秒！"));
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10 + 255;
         this.fts3.y = 7 + 20;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 110;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("魔龙精魂（已激活）");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("魔龙精魂：可使用魔龙精魂100%将坐骑转化成灸炎幽冥魔龙") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkZq = new FCheckBox();
         addChild(this.checkZq);
         this.checkZq.x = 256 + 117;
         this.checkZq.y = 7 + 20;
         this.checkZq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts4 = new FTextArea();
         this.fts4.x = 10 + 255;
         this.fts4.y = 7 + 20 + 60;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 110;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("血色羽翼（已激活）");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("血色翅膀：吸收神、魔、人界的血气凝聚而成，可飞行。") + "<br>" + LanResManager.getLanCommonTextWords("翅膀转换：攻击时有几率触发翅膀转换，持续10秒；在此状态下，") + "<br>" + LanResManager.getLanCommonTextWords("自身在血色羽翼的守护下，无法被对手锁定，且当状态解除后，") + "<br>" + LanResManager.getLanCommonTextWords("100%随机触发天使之翼、恶魔之翼、魔灵羽翼的隐藏技能效果，") + "<br>" + LanResManager.getLanCommonTextWords("可瞬间清除自身的所有负面状态，且无敌3秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkCB = new FCheckBox();
         addChild(this.checkCB);
         this.checkCB.x = 256 + 117;
         this.checkCB.y = 7 + 20 + 60;
         this.checkCB.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts5 = new FTextArea();
         this.fts5.x = 10;
         this.fts5.y = 150;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 110;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("死亡禁武（已激活）");
         this.fts5.visible = false;
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("死亡禁武乃六大门派之禁技，天下武林梦寐以求的武学，因无冷却时间，在武林上乃PK神技。") + "<br>" + LanResManager.getLanCommonTextWords("死亡禁武：战斗状态下，每攻击对手10次，可瞬间使对手命中死亡禁武，使对手无法使用任") + "<br>" + LanResManager.getLanCommonTextWords("何技能PK，持续3秒。死亡禁武不需要内力也可施发，技能无冷却。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.kuang1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang1);
         this.kuang1.x = 8;
         this.kuang1.y = 103;
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 10;
         this.mainSkillContainer.y = 105;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.checkZq:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkZq.selectState,11]));
               break;
            case this.checkCB:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkCB.selectState,60]));
         }
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
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_MOLINGZHIYI_FEIXING_CLICK));
               break;
            case this.hechengBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_MOLINGZHIYI_HECHENG_SHOW));
               break;
            case this.jinjieBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_MOLINGZHIYI_LINGWU_SHOW,"",this.lookingId));
         }
         switch(param1.currentTarget)
         {
            case this.check:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_MOLINGZHIYI_WAIGUAN_CLICK,"",this.check.selectState));
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
         this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_MOLINGZHIYI_HUANYE_CLICK,"",int(param1.target.name)));
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
               _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("羽灵共有八种，由低到高为：恶魔羽灵一阶，恶魔羽灵二阶，恶魔羽灵三阶，恶魔羽灵四阶，恶魔羽灵五阶，恶魔羽灵六阶，恶魔羽灵七阶以及恶魔羽灵八阶。") + "<br></font>" + "<font color=\'" + StaticValue.GREEN_STRONG_HTML + "\'>" + LanResManager.getLanCommonTextWords("玩家可以从野外掉落或商城购买来获得恶魔羽灵一阶，然后通过羽灵合成功能合成恶魔羽灵二阶，以此类推最终合成至恶魔羽灵八阶。") + "<br></font>" + "<font color=\'" + StaticValue.PURPLE_HTML + "\'>" + LanResManager.getLanCommonTextWords("各阶羽灵对应羽翼的各个阶段使用增加羽翼属性。") + "<br></font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("此外，参加心魔活动击杀心魔可获得大量的恶魔羽灵一阶！") + "</font>" + "</textformat>";
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
               _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("展翅凌空将在魔灵之翼升至八阶时可使用，使用本功能后玩家将进入飞行状态，") + "<br>" + LanResManager.getLanCommonTextWords("飞行时玩家的闪避将大幅提升！飞行时将消耗一定的体力值。") + "</textformat>";
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
         this.molingzhiyiTupo._parent2 = param1;
         this.molingzhiyiTupo._parent3 = this;
      }
      
      public function setWupin(param1:String) : void
      {
         this.shiyong.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("双击使用") + param1 + LanResManager.getLanCommonTextWords("增加羽翼属性") + "</font>";
      }
      
      public function showMoLingZhiYi(param1:Boolean) : void
      {
         this.check.selectState = param1;
      }
      
      public function setInitialize(param1:MoLingZhiYiVO, param2:Boolean) : void
      {
         this.checkZq.selectState = param1.isFeiLong;
         this.checkCB.selectState = param1.isChiBang;
         this.isMainChar = param2;
         this.setWupin(param1.goodsName);
         this.setBg(param1.lookId);
         this.yuyidengji(param1.nowId,param1.lookId);
         this.setShuxingJiacheng(param1.shengMing,param1.maxShengMing,param1.tiLi,param1.maxTiLi,param1.gongJi,param1.maxGongJi,param1.fangYu,param1.maxFangYu,param1.baoJi,param1.maxBaoJi,param1.shanBi,param1.maxShanBi);
         var _loc3_:Object = param1.nameArr[param1.lookId];
         this.setZhenFaTiSheng(param1.lookId,param1.nowId);
         this.setSkill(param1.skillId,param1.isLearned,param1.skillId2,param1.isLearned2);
         this.showMoLingZhiYi(param1.isShow);
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
         this.setJiHuo(param2);
      }
      
      public function setShuxingJiacheng(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number, param11:Number, param12:Number) : void
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
         if(lookid == 8)
         {
            mcId = 2;
         }
         else
         {
            mcId = 1;
         }
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/molingzhiyi/" + mcId + ".swf";
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
      
      private function yuyidengji(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < 8)
         {
            if(this["boll" + String(_loc3_ + 1)])
            {
               if(this["boll" + String(_loc3_ + 1)].parent)
               {
                  this["boll" + String(_loc3_ + 1)].parent.removeChild(this["boll" + String(_loc3_ + 1)]);
               }
            }
            this["boll" + String(_loc3_ + 1)] = null;
            if(_loc3_ < param1)
            {
               if(_loc3_ == param2 - 1)
               {
                  this["boll" + String(_loc3_ + 1)] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/molingzhiyi/liangxuanzhong.swf");
               }
               else
               {
                  this["boll" + String(_loc3_ + 1)] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/molingzhiyi/liang.swf");
               }
            }
            else if(_loc3_ == param2 - 1)
            {
               this["boll" + String(_loc3_ + 1)] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/molingzhiyi/anxuanzhong.swf");
            }
            else
            {
               this["boll" + String(_loc3_ + 1)] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/molingzhiyi/an.swf");
            }
            this["bg" + String(_loc3_ + 1) + "Spr"].addChild(this["boll" + String(_loc3_ + 1)]);
            this["boll" + String(_loc3_ + 1)].visible = true;
            this["boll" + String(_loc3_ + 1)].name = String(_loc3_ + 1);
            this["boll" + String(_loc3_ + 1)].addEventListener(MouseEvent.CLICK,this.onClick2);
            _loc3_++;
         }
      }
      
      public function setZhenFaTiSheng(param1:int, param2:int = -1) : void
      {
         this.nowId = param2;
         this.lookingId = param1;
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
            if(this.molingzhiyiTupo.x == 138)
            {
               TweenMax.to(this.molingzhiyiTupo,1,{"x":410});
               this.tupoBo = true;
               this.jinjieBtn.enabled = false;
               this.closejinjie();
               this.hechengBtn.enabled = false;
            }
         }
         else
         {
            if(this.molingzhiyiTupo.x == 410)
            {
               TweenMax.to(this.molingzhiyiTupo,1,{"x":138});
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_MOLINGZHIYI_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.jinjieBtn.enabled = true;
            this.hechengBtn.enabled = true;
         }
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.molingzhiyiTupo.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setTupoInit(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.molingzhiyiTupo.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.molingzhiyiTupo.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.molingzhiyiTupo.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.molingzhiyiTupo.setTuPoBtn(param1);
      }
      
      public function setEnableFun() : void
      {
         this.feixingBtn.enabled = false;
         this.hechengBtn.enabled = false;
         this.jinjieBtn.enabled = false;
         this.closejinjie();
         this.check.enabled = false;
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
            this.fts.visible = GameState.dictMainStatus[SpecialGoodsID.MOLINGZHIYI_MOLINGXINFA_ID];
            this.molingshi = GameState.dictMainStatus[SpecialGoodsID.MOLINGZHIYI_MOLINGZHI_ID];
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.MOLINGZHIYI_HUANSHEN_ID];
            this.moshi1 = GameState.dictMainStatus[SpecialGoodsID.MOLINGZHIYI_MOLINGSHI1_ID];
            this.moshi2 = GameState.dictMainStatus[SpecialGoodsID.MOLINGZHIYI_MOLINGSHI2_ID];
            this.moshi3 = GameState.dictMainStatus[SpecialGoodsID.MOLINGZHIYI_MOLINGSHI3_ID];
            this.moshi4 = GameState.dictMainStatus[SpecialGoodsID.MOLINGZHIYI_MOLINGSHI4_ID];
            this.moshi5 = GameState.dictMainStatus[SpecialGoodsID.MOLINGZHIYI_MOLINGSHI5_ID];
            this.moshi6 = GameState.dictMainStatus[SpecialGoodsID.MOLINGZHIYI_MOLINGSHI6_ID];
            this.moshi7 = GameState.dictMainStatus[SpecialGoodsID.MOLINGZHIYI_MOLINGSHI7_ID];
            this.moshi8 = GameState.dictMainStatus[SpecialGoodsID.MOLINGZHIYI_MOLINGSHI8_ID];
            this.dengjie1 = GameState.dictMainStatus[SpecialGoodsID.MOLINGZHIYI_DENGJIE1_ID];
            this.dengjie2 = GameState.dictMainStatus[SpecialGoodsID.MOLINGZHIYI_DENGJIE2_ID];
            this.dengjie3 = GameState.dictMainStatus[SpecialGoodsID.MOLINGZHIYI_DENGJIE3_ID];
            this.dengjie4 = GameState.dictMainStatus[SpecialGoodsID.MOLINGZHIYI_DENGJIE4_ID];
            this.dengjie5 = GameState.dictMainStatus[SpecialGoodsID.MOLINGZHIYI_DENGJIE5_ID];
            this.dengjie6 = GameState.dictMainStatus[SpecialGoodsID.MOLINGZHIYI_DENGJIE6_ID];
            this.dengjie7 = GameState.dictMainStatus[SpecialGoodsID.MOLINGZHIYI_DENGJIE7_ID];
            this.dengjie8 = GameState.dictMainStatus[SpecialGoodsID.MOLINGZHIYI_DENGJIE8_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.MOLINGZHIYI_SHENGYU_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.MOLINGZHIYI_MOLONGJINGPO_ID])
            {
               this.fts3.visible = true;
               this.checkZq.visible = true;
            }
            else
            {
               this.fts3.visible = false;
               this.checkZq.visible = false;
            }
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.MOLINGZHIYI_XUESEYUYI_ID];
            this.checkCB.visible = GameState.dictMainStatus[SpecialGoodsID.MOLINGZHIYI_XUESEYUYI_ID];
            this.fts5.visible = GameState.dictMainStatus[SpecialGoodsID.MOLINGZHIYI_SIWANGJINWU_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.MOLINGZHIYI_SIWANGJINWU_ID])
            {
               this.setSkillJiHuo(200360,true);
               this.mainSkillContainer.visible = true;
               this.kuang1.visible = true;
            }
            else
            {
               this.mainSkillContainer.visible = false;
               this.kuang1.visible = false;
            }
         }
         else
         {
            this.fts.visible = GameState.dictTargetStatus[SpecialGoodsID.MOLINGZHIYI_MOLINGXINFA_ID];
            this.molingshi = GameState.dictTargetStatus[SpecialGoodsID.MOLINGZHIYI_MOLINGZHI_ID];
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.MOLINGZHIYI_HUANSHEN_ID];
            this.moshi1 = GameState.dictTargetStatus[SpecialGoodsID.MOLINGZHIYI_MOLINGSHI1_ID];
            this.moshi2 = GameState.dictTargetStatus[SpecialGoodsID.MOLINGZHIYI_MOLINGSHI2_ID];
            this.moshi3 = GameState.dictTargetStatus[SpecialGoodsID.MOLINGZHIYI_MOLINGSHI3_ID];
            this.moshi4 = GameState.dictTargetStatus[SpecialGoodsID.MOLINGZHIYI_MOLINGSHI4_ID];
            this.moshi5 = GameState.dictTargetStatus[SpecialGoodsID.MOLINGZHIYI_MOLINGSHI5_ID];
            this.moshi6 = GameState.dictTargetStatus[SpecialGoodsID.MOLINGZHIYI_MOLINGSHI6_ID];
            this.moshi7 = GameState.dictTargetStatus[SpecialGoodsID.MOLINGZHIYI_MOLINGSHI7_ID];
            this.moshi8 = GameState.dictTargetStatus[SpecialGoodsID.MOLINGZHIYI_MOLINGSHI8_ID];
            this.dengjie1 = GameState.dictTargetStatus[SpecialGoodsID.MOLINGZHIYI_DENGJIE1_ID];
            this.dengjie2 = GameState.dictTargetStatus[SpecialGoodsID.MOLINGZHIYI_DENGJIE2_ID];
            this.dengjie3 = GameState.dictTargetStatus[SpecialGoodsID.MOLINGZHIYI_DENGJIE3_ID];
            this.dengjie4 = GameState.dictTargetStatus[SpecialGoodsID.MOLINGZHIYI_DENGJIE4_ID];
            this.dengjie5 = GameState.dictTargetStatus[SpecialGoodsID.MOLINGZHIYI_DENGJIE5_ID];
            this.dengjie6 = GameState.dictTargetStatus[SpecialGoodsID.MOLINGZHIYI_DENGJIE6_ID];
            this.dengjie7 = GameState.dictTargetStatus[SpecialGoodsID.MOLINGZHIYI_DENGJIE7_ID];
            this.dengjie8 = GameState.dictTargetStatus[SpecialGoodsID.MOLINGZHIYI_DENGJIE8_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.MOLINGZHIYI_SHENGYU_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.MOLINGZHIYI_MOLONGJINGPO_ID])
            {
               this.fts3.visible = true;
               this.check.visible = true;
            }
            else
            {
               this.fts3.visible = false;
               this.check.visible = false;
            }
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.MOLINGZHIYI_XUESEYUYI_ID];
            this.checkCB.visible = GameState.dictTargetStatus[SpecialGoodsID.MOLINGZHIYI_XUESEYUYI_ID];
            this.fts5.visible = GameState.dictTargetStatus[SpecialGoodsID.MOLINGZHIYI_SIWANGJINWU_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.MOLINGZHIYI_SIWANGJINWU_ID])
            {
               this.setSkillJiHuo(200360,true);
               this.mainSkillContainer.visible = true;
               this.kuang1.visible = true;
            }
            else
            {
               this.mainSkillContainer.visible = false;
               this.kuang1.visible = false;
            }
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

