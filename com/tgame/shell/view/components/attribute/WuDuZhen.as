package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.PipeManager;
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
   
   public class WuDuZhen extends Sprite
   {
      
      public static const UI_TUPO_GUANBI_CLICK:String = "UI_TUPO_GUANBI_CLICK";
      
      public var maxGrade:int = 10;
      
      public var minGrade:int = 1;
      
      public var _parent:DisplayObject;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var curSelect:int;
      
      private var curGrade:int;
      
      private var dataArray:Array;
      
      private var isOther:Boolean;
      
      public var btnArray:Array;
      
      private var mingzi:FTextArea;
      
      private var lv:FTextArea;
      
      private var preBtn:FSimpleButton;
      
      private var nextBtn:FSimpleButton;
      
      private var shuxing:FTextArea;
      
      private var nameBg:F9GridBitmap;
      
      private var lvBg:F9GridBitmap;
      
      private var shuoMingBtn:SecondButton;
      
      private var shuoMingCanvas:FCanvas;
      
      private var selectMc:MovieClip;
      
      private var selectSpr:Sprite;
      
      private var tupoBtn:SecondButton;
      
      private var bgMc:MovieClip;
      
      private var btn0:MovieClip;
      
      private var btn1:MovieClip;
      
      private var btn2:MovieClip;
      
      private var btn3:MovieClip;
      
      private var btn4:MovieClip;
      
      private var url0:String;
      
      private var url1:String;
      
      private var url2:String;
      
      private var url3:String;
      
      private var url4:String;
      
      private var spr0:Sprite;
      
      private var spr1:Sprite;
      
      private var spr2:Sprite;
      
      private var spr3:Sprite;
      
      private var spr4:Sprite;
      
      private var barBar1:ColorBar;
      
      private var barBar2:ColorBar;
      
      private var barBar3:ColorBar;
      
      private var barBar4:ColorBar;
      
      private var barBar5:ColorBar;
      
      private var barBg1:Bitmap;
      
      private var barBg2:Bitmap;
      
      private var barBg3:Bitmap;
      
      private var barBg4:Bitmap;
      
      private var barBg5:Bitmap;
      
      private var zhongJiaCheng:FTextArea;
      
      private var tupoCanvas:WuDuZhenTuPoCanvas;
      
      private var bgArr:Array;
      
      public var bg:Bitmap;
      
      private var kuang:DisplayObject;
      
      private var jinengSpr:Sprite;
      
      private var item:DisplayObject;
      
      private var mianshangliang:int;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var baoyu:int = 0;
      
      private var mainSkillContainer:Sprite;
      
      private var currSkill:ItemFace;
      
      private var p:Point;
      
      private var mainSkillItemFace:ItemFace;
      
      private var mainSkill:Skill;
      
      private var kuang1:Bitmap;
      
      private var fts3:FTextArea;
      
      private var siwangfuyin:int = 0;
      
      private var fts4:FTextArea;
      
      private var tianzhu:int = 0;
      
      private var shengxie:int = 0;
      
      private var yucan:int = 0;
      
      private var fengwu:int = 0;
      
      private var lingshe:int = 0;
      
      private var fts5:FTextArea;
      
      private var check:FCheckBox;
      
      private var checkLabel:FLabel;
      
      private var fts6:FTextArea;
      
      private var checkZq:FCheckBox;
      
      private var fts7:FTextArea;
      
      private var checkSLZ:FCheckBox;
      
      private var fts8:FTextArea;
      
      private var canjuan:int = 0;
      
      private var kuaisuBtn:SecondButton;
      
      public function WuDuZhen()
      {
         var bgdown:DisplayObject;
         var i:int;
         var fa:FTextArea;
         var ft:FTextArea;
         var selectBmp:DisplayObject;
         var $mask:Sprite;
         var kuang:DisplayObject;
         var url:String = null;
         var bg:DisplayObject = null;
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
         bgdown = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wuxingzhen/bgdown.swf");
         bgdown.x = 2;
         bgdown.y = 253 + 2;
         addChild(bgdown);
         this.bgArr = new Array();
         i = 0;
         while(i < 5)
         {
            bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wuduzhen/" + i + ".swf");
            bg.x = 2;
            bg.y = 4;
            addChild(bg);
            if(i != 0)
            {
               bg.visible = false;
            }
            this.bgArr.push(bg);
            i++;
         }
         this.nameBg = Tools.get9GridBitmpByName("countBg");
         addChild(this.nameBg);
         this.nameBg.width = 56;
         this.nameBg.x = 5;
         this.nameBg.y = 280 - 5 - 20 + 5;
         this.mingzi = new FTextArea();
         this.mingzi.defaultTextFormat = StaticValue.format;
         this.mingzi.textColor = StaticValue.WHITE;
         this.mingzi.filters = StaticValue.filter;
         this.mingzi.width = 56;
         this.mingzi.height = 20;
         this.mingzi.x = 5;
         this.mingzi.y = 281 - 5 - 20 + 5;
         addChild(this.mingzi);
         this.lvBg = Tools.get9GridBitmpByName("countBg");
         addChild(this.lvBg);
         this.lvBg.width = 69;
         this.lvBg.x = 85;
         this.lvBg.y = 280 - 5 - 20 + 5;
         this.lv = new FTextArea();
         this.lv.defaultTextFormat = StaticValue.format;
         this.lv.textColor = StaticValue.WHITE;
         this.lv.filters = StaticValue.filter;
         this.lv.width = 69;
         this.lv.height = 20;
         this.lv.x = 85;
         this.lv.y = 281 - 5 - 20 + 5;
         addChild(this.lv);
         this.preBtn = new FSimpleButton();
         this.preBtn.skin = "previousButton";
         addChild(this.preBtn);
         this.preBtn.x = 65;
         this.preBtn.y = 280 - 5 - 20 + 5;
         this.preBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextBtn = new FSimpleButton();
         this.nextBtn.skin = "nextButton";
         addChild(this.nextBtn);
         this.nextBtn.x = 157 - 2;
         this.nextBtn.y = 280 - 5 - 20 + 5;
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.shuxing = new FTextArea();
         this.shuxing.autoSize = TextFieldAutoSize.LEFT;
         this.shuxing.textColor = StaticValue.YELLOW;
         this.shuxing.filters = StaticValue.filter;
         this.shuxing.x = 15;
         this.shuxing.y = 300 - 7 - 20 + 10;
         this.shuxing.htmlText = LanResManager.getLanCommonTextWords("生命") + "<br>" + LanResManager.getLanCommonTextWords("内力") + "<br>" + LanResManager.getLanCommonTextWords("体力") + "<br>" + LanResManager.getLanCommonTextWords("攻击") + "<br>" + LanResManager.getLanCommonTextWords("防御");
         addChild(this.shuxing);
         this.barBg1 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         addChild(this.barBg1);
         this.barBg1.x = 30 + 15;
         this.barBg1.y = 300 - 7 - 20 + 12 + 1;
         this.barBar1 = new ColorBar(5,123,5);
         addChild(this.barBar1);
         this.barBar1.setValue(10000,100000);
         this.barBar1.x = this.barBg1.x + 4;
         this.barBar1.y = this.barBg1.y + 3;
         this.barBg1 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         addChild(this.barBg1);
         this.barBg1.x = 30 + 15;
         this.barBg1.y = 300 - 7 + 30 - 20;
         this.barBar2 = new ColorBar(5,123,5);
         addChild(this.barBar2);
         this.barBar2.setValue(10000,100000);
         this.barBar2.x = this.barBg1.x + 4;
         this.barBar2.y = this.barBg1.y + 3;
         this.barBg1 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         addChild(this.barBg1);
         this.barBg1.x = 30 + 15;
         this.barBg1.y = 300 - 7 + 40 - 20 + 10 - 5;
         this.barBar3 = new ColorBar(5,123,5);
         addChild(this.barBar3);
         this.barBar3.setValue(10000,100000);
         this.barBar3.x = this.barBg1.x + 4;
         this.barBar3.y = this.barBg1.y + 3;
         this.barBg1 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         addChild(this.barBg1);
         this.barBg1.x = 30 + 15;
         this.barBg1.y = 300 - 7 + 60 - 20;
         this.barBar4 = new ColorBar(5,123,5);
         addChild(this.barBar4);
         this.barBar4.setValue(10000,100000);
         this.barBar4.x = this.barBg1.x + 4;
         this.barBar4.y = this.barBg1.y + 3;
         this.barBg1 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         addChild(this.barBg1);
         this.barBg1.x = 30 + 15;
         this.barBg1.y = 300 - 7 + 80 - 20 - 3;
         this.barBar5 = new ColorBar(5,123,5);
         addChild(this.barBar5);
         this.barBar5.setValue(10000,100000);
         this.barBar5.x = this.barBg1.x + 4;
         this.barBar5.y = this.barBg1.y + 3;
         fa = new FTextArea();
         fa.defaultTextFormat = StaticValue.format;
         fa.textColor = StaticValue.ORANGE;
         fa.filters = StaticValue.filter;
         fa.x = 255 - 15 + 25;
         fa.y = 275 - 20 + 10;
         addChild(fa);
         fa.text = LanResManager.getLanCommonTextWords("总的属性加成");
         this.zhongJiaCheng = new FTextArea();
         this.zhongJiaCheng.filters = StaticValue.filter;
         this.zhongJiaCheng.x = 185 + 50 + 30;
         this.zhongJiaCheng.y = 295 - 20 + 10;
         this.zhongJiaCheng.autoSize = TextFieldAutoSize.LEFT;
         addChild(this.zhongJiaCheng);
         this.shuoMingCanvas = new FCanvas();
         this.shuoMingCanvas.skin = "menuBg";
         this.shuoMingCanvas.width = 165;
         this.shuoMingCanvas.height = 250 - 110;
         ft = new FTextArea();
         ft.width = 193;
         ft.height = 20;
         ft.x = -20;
         ft.y = 5;
         ft.textColor = StaticValue.YELLOW;
         ft.filters = StaticValue.filter;
         ft.defaultTextFormat = StaticValue.format;
         ft.htmlText = "<font size=\'14\'>" + LanResManager.getLanCommonTextWords("五毒阵说明") + "</font>";
         this.shuoMingCanvas.addChild(ft);
         ft = new FTextArea();
         ft.autoSize = TextFieldAutoSize.LEFT;
         ft.x = 8;
         ft.y = 25;
         ft.textColor = StaticValue.GREEN;
         ft.filters = StaticValue.filter;
         this.shuoMingCanvas.addChild(ft);
         ft.htmlText = "<textformat leading=\'\'>" + LanResManager.getLanCommonTextWords("使用圣蝎爪、玉蟾涎、灵蛇") + "<br>" + LanResManager.getLanCommonTextWords("胆、风蜈刺、天蛛牙可提升") + "<br>" + LanResManager.getLanCommonTextWords("对应阵法的属性，以上道具") + "<br>" + LanResManager.getLanCommonTextWords("由白驼山地图中的怪物掉落") + "<br><br>" + "</textformat>";
         ft = new FTextArea();
         ft.autoSize = TextFieldAutoSize.LEFT;
         ft.x = 8;
         ft.y = 25 + 120 - 50;
         ft.textColor = StaticValue.BLUE;
         ft.filters = StaticValue.filter;
         this.shuoMingCanvas.addChild(ft);
         ft.htmlText = "<textformat leading=\'\'>" + LanResManager.getLanCommonTextWords("当阵法属性各项数值达到满") + "<br>" + LanResManager.getLanCommonTextWords("值后可进行突破进入下一层") + "<br><br>" + "</textformat>";
         this.shuoMingBtn = new SecondButton();
         this.shuoMingBtn.label = LanResManager.getLanCommonTextWords("道具掉落查询");
         this.shuoMingBtn.x = 325 - 5 - 30;
         this.shuoMingBtn.y = 245 - 20;
         this.shuoMingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.bgMc = new MovieClip();
         url = GameConfig.fileBaseFolder + "res/ui/UIditu/wuduzhen/bgmc.swf";
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != url)
            {
               return;
            }
            if(Boolean(bgMc) && bgMc.parent != null)
            {
               bgMc.stop();
               bgMc.parent.removeChild(bgMc);
            }
            bgMc = _loc2_.content as MovieClip;
            if(bgMc)
            {
               addChildAt(bgMc,6);
               bgMc.mouseEnabled = false;
               bgMc.mouseChildren = false;
               bgMc.x = 70;
               bgMc.y = 0;
            }
         },null,false,url);
         this.btnArray = new Array();
         this.initBtns();
         this.selectSpr = new Sprite();
         this.selectSpr.mouseChildren = false;
         this.selectSpr.mouseEnabled = false;
         selectBmp = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wuduzhen/select.swf");
         selectBmp.x = 5;
         selectBmp.y = 5 + 2;
         this.selectSpr.addChild(selectBmp);
         addChild(this.selectSpr);
         this.tupoBtn = new SecondButton();
         this.tupoBtn.label = LanResManager.getLanCommonTextWords("已达顶层");
         addChild(this.tupoBtn);
         this.tupoBtn.x = 180;
         this.tupoBtn.y = 258;
         this.tupoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tupoCanvas = new WuDuZhenTuPoCanvas();
         addChild(this.tupoCanvas);
         this.tupoCanvas.x = -10;
         this.tupoCanvas.y = 385;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = -10;
         $mask.y = 245;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,425,130);
            endFill();
         }
         this.tupoCanvas.mask = $mask;
         addEventListener(UI_TUPO_GUANBI_CLICK,this.onTupoClose);
         kuang = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wuduzhen/kuang.swf");
         kuang.x = 178 - 11 + 1;
         kuang.y = 108 - 9;
         addChild(kuang);
         this.jinengSpr = new Sprite();
         this.jinengSpr.x = 178 + 3 - 11 + 1 + 1;
         this.jinengSpr.y = 108 + 3 - 9 + 1;
         addChild(this.jinengSpr);
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 7;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("五毒阵顶级激活（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击10888888888 防御8888888888 血量12888888888暴击 8888闪避8888 所有武功提升 5000层") + "<br>" + LanResManager.getLanCommonTextWords("五毒噬心（特殊技能）：攻击时有几率触发令对手命中五毒噬心状态，在此状态下对手血量将无法回复到30%以上，技能效果持续10秒！");
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10 + 220;
         this.fts2.y = 7;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("五毒至尊心法（已激活）");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("已使用") + baoyu + LanResManager.getLanCommonTextWords("个暴雨梨花针") + "<br>" + LanResManager.getLanCommonTextWords("增强持续掉血时的免伤量") + 50000000 * baoyu + "<br>" + LanResManager.getLanCommonTextWords("使用100个暴雨梨花针后到达满值并激活五毒至尊心法最终属性：") + "<br>" + LanResManager.getLanCommonTextWords("攻击88888888888 防御68000000000 血量88888888888暴击 8888闪避8888 所有武功提升30000层") + "<br>" + LanResManager.getLanCommonTextWords("五毒至尊（特殊技能）：100%对所有玩家对自身造成的伤害减免80%！并且每次免伤都将以1000%的朱雀反弹效果反伤对手，造成对手重度伤害。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.kuang1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang1);
         this.kuang1.x = 25 - 8;
         this.kuang1.y = 160 + 35 + 8;
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 25 + 2 - 8;
         this.mainSkillContainer.y = 160 + 2 + 35 + 8;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp);
         this.fts3 = new FTextArea();
         this.fts3.x = 10 + 220;
         this.fts3.y = 7 + 20;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 170;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("死亡缠绕秘籍（已激活）");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("死亡缠绕：攻击12888888889000 防御10888888889000 血量13888888889000 暴击 88888闪避88888") + "<br>" + LanResManager.getLanCommonTextWords("所有武功2500000层  ") + "<br>" + LanResManager.getLanCommonTextWords("★死亡缠绕 ——激活死亡缠绕秘籍且养成满后，将可激活死亡缠绕死亡技；当自身死亡时，将从地狱深渊召唤黑白鬼差，瞬") + "<br>" + LanResManager.getLanCommonTextWords("间使自身周围五格内的所有玩家只要血量低于50%时都立即死亡；若周围的对手血量高于50%时，都将立即进入定身，持续10") + "<br>" + LanResManager.getLanCommonTextWords("秒。冷却60秒。") + "<br>" + LanResManager.getLanCommonTextWords("★死亡缠绕属性：激活死亡缠绕秘籍后，将开启死亡缠绕隐藏属性，可使用死亡符印对该隐藏属性进行养成，最多可养成200") + "<br>" + LanResManager.getLanCommonTextWords("次。每个增加：攻击1500亿，所有武功350000层。") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用") + siwangfuyin + LanResManager.getLanCommonTextWords("颗死亡符印") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + siwangfuyin * 1500 + LanResManager.getLanCommonTextWords("亿，所有武功") + siwangfuyin * 350000 + LanResManager.getLanCommonTextWords("层") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         this.fts4 = new FTextArea();
         this.fts4.x = 10 + 220;
         this.fts4.y = 7 + 20 + 20;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 170;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("五毒秘术（已激活）");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("五毒秘术：攻击时有几率触发五毒秘术，持续10秒；自身在此状态下，百毒不侵，对手的所有") + "<br>" + LanResManager.getLanCommonTextWords("技能效果打到身上，都将被五毒侵蚀免疫掉； 且自身攻击时，100%使对手同时命中五毒效") + "<br>" + LanResManager.getLanCommonTextWords("果，天蛛丝束缚对手，圣蝎毒瞬间掉血60%，玉蟾吸气禁武、灵蛇幻境混乱、风蜈毒雾双眼失") + "<br>" + LanResManager.getLanCommonTextWords("明，持续5秒。冷却60秒。") + "<br>" + LanResManager.getLanCommonTextWords("当五毒秘术天蛛阵、圣蝎阵、玉蟾阵、灵蛇阵、风蜈阵都提升至100%时，可触发开启五毒奥义，") + "<br>" + LanResManager.getLanCommonTextWords("使五毒秘术的触发几率提升至100%。") + "<br>" + LanResManager.getLanCommonTextWords("天蛛石:开启五毒秘术的玩家，可双击使用提升五毒秘术天珠阵的几率10%。（最多使用10颗）") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用") + tianzhu + LanResManager.getLanCommonTextWords("颗天蛛石") + "<br>" + LanResManager.getLanCommonTextWords("圣蝎石:开启五毒秘术的玩家，可双击使用提升五毒秘术圣蝎阵的几率10%。（最多使用10颗）") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用") + shengxie + LanResManager
            .getLanCommonTextWords("颗圣蝎石") + "<br>" + LanResManager.getLanCommonTextWords("玉蟾石:开启五毒秘术的玩家，可双击使用提升五毒秘术玉蟾阵的几率10%。（最多使用10颗）") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用") + yucan + LanResManager.getLanCommonTextWords("颗玉蟾石") + "<br>" + LanResManager.getLanCommonTextWords("灵蛇石:开启五毒秘术的玩家，可双击使用提升五毒秘术灵蛇阵的几率10%。（最多使用10颗）") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用") + lingshe + LanResManager.getLanCommonTextWords("颗灵蛇石") + "<br>" + LanResManager.getLanCommonTextWords("风蜈石:开启五毒秘术的玩家，可双击使用提升五毒秘术风蜈阵的几率10%。（最多使用10颗）") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用") + fengwu + LanResManager.getLanCommonTextWords("颗风蜈石") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         this.fts5 = new FTextArea();
         this.fts5.x = 275 + 10;
         this.fts5.y = 42 + 40 + 95;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 170;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("雄霸天下(已激活)");
         this.fts5.visible = false;
         addChild(this.fts5);
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.visible = false;
         this.check.x = 275 + 10;
         this.check.y = 28 + 35 + 40 + 95;
         this.check.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.checkLabel = new FLabel();
         this.checkLabel.visible = false;
         with(this.checkLabel)
         {
            x = check.x + 20;
            --check.y;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("自动换装");
         }
         addChild(this.checkLabel);
         this.fts6 = new FTextArea();
         this.fts6.x = 275 + 10 - 13 - 24;
         this.fts6.y = 42 + 40 + 95 - 13;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 170;
         this.fts6.height = 20;
         this.fts6.htmlText = LanResManager.getLanCommonTextWords("蜀山") + "•" + LanResManager.getLanCommonTextWords("兽剑仙秘籍");
         this.fts6.visible = false;
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击10888888889000 防御8888888889000 血量12888888889000") + "<br>" + LanResManager.getLanCommonTextWords("暴击88888闪避88888 所有武功2800000层") + "<br>" + LanResManager.getLanCommonTextWords("地界异兽：兽剑仙，一把可召唤来自己宇宙的异界生物，可自由召唤异兽。") + "<br>" + LanResManager.getLanCommonTextWords("兽剑仙：攻击时100%触发兽剑仙，持续10秒；兽剑乃万兽神器，自身在此状态下，") + "<br>" + LanResManager.getLanCommonTextWords("每次移动或者跳跃，范围5格内的所有玩家都将受到震荡眩晕原地10秒，在震荡下，") + "<br>" + LanResManager.getLanCommonTextWords("对手的所有勋章能力失效；且自身在此状态下，不受任何负而效果影响。冷却60秒。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.checkZq = new FCheckBox();
         addChild(this.checkZq);
         this.checkZq.visible = false;
         this.checkZq.x = 275 + 10 + 90;
         this.checkZq.y = 42 + 40 + 95 - 13;
         this.checkZq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts7 = new FTextArea();
         this.fts7.x = 275 + 10 - 13;
         this.fts7.y = 42 + 40 + 95 - 13 - 20;
         this.fts7.textColor = StaticValue.GREEN;
         this.fts7.width = 170;
         this.fts7.height = 20;
         this.fts7.htmlText = LanResManager.getLanCommonTextWords("紫灵") + "•" + LanResManager.getLanCommonTextWords("六芒星阵");
         this.fts7.visible = false;
         addChild(this.fts7);
         ToolTips.createToolTips(this.fts7,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("六芒圣光：激活紫灵?六芒的玩家，人物脚下将出现神喻圣光，圣光缠绕，天下无敌。") + "<br>" + LanResManager.getLanCommonTextWords("神谕惩戒：被攻击时有几率触发神谕惩戒状态，自身被神谕护体，完全无视对手所以") + "<br>" + LanResManager.getLanCommonTextWords("伤害，持续10秒。且自身在此状态下，每次受到攻击都将触发神之惩戒，对手双脚被") + "<br>" + LanResManager.getLanCommonTextWords("冻结在原地，无法动弹，持续3秒。自身每次攻击，都必定使对手双目失明，每秒掉") + "<br>" + LanResManager.getLanCommonTextWords("血30%，持续3秒。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.checkSLZ = new FCheckBox();
         addChild(this.checkSLZ);
         this.checkSLZ.visible = false;
         this.checkSLZ.x = 275 + 10 + 90;
         this.checkSLZ.y = 42 + 40 + 95 - 13 - 20;
         this.checkSLZ.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts8 = new FTextArea();
         this.fts8.x = 275 + 10 - 13;
         this.fts8.y = 42 + 40 + 95 - 13 - 20 + 50 - 70;
         this.fts8.textColor = StaticValue.GREEN;
         this.fts8.width = 170;
         this.fts8.height = 20;
         this.fts8.htmlText = LanResManager.getLanCommonTextWords("玄武真功宝典");
         this.fts8.visible = false;
         addChild(this.fts8);
         ToolTips.createToolTips(this.fts8,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击：206888亿、防御202888亿、血量200888亿、所有武功提升 880000层") + "<br>" + LanResManager.getLanCommonTextWords("战纹属性：青龙战纹提升20%，白虎战纹提升20%，朱雀战纹提升20%") + "<br>" + LanResManager.getLanCommonTextWords("宝典残卷：激活玄武真功宝典的玩家可使用宝典残卷，每使用100个可激活玄武真功宝典一个技能，") + "<br>" + LanResManager.getLanCommonTextWords("且提升人物攻击500亿，所有武功提升5000层，人物战力斗提升1亿。") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用") + canjuan + LanResManager.getLanCommonTextWords("宝典残卷") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + canjuan * 500 + LanResManager.getLanCommonTextWords("亿，所有武功") + canjuan * 5000 + LanResManager.getLanCommonTextWords("层，人物战斗力") + canjuan + LanResManager.getLanCommonTextWords("亿") + "<br></font>";
            if(canjuan >= 100)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("一刀") + "<br>" + LanResManager.getLanCommonTextWords("无二刀法：攻击时有几率触发无二刀法，持续10秒；每次攻击都可瞬间将对手同时辟刀一分为二，且定身原地，10秒。") + "<br>";
            }
            if(canjuan >= 200)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("二枪") + "<br>" + LanResManager.getLanCommonTextWords("问天枪诀：攻击时有几率触发问天枪诀，持续10秒；每次攻击可瞬间清除自身的所有负面状态。") + "<br>";
            }
            if(canjuan >= 300)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("三剑") + "<br>" + LanResManager.getLanCommonTextWords("天命剑道：攻击时有几率触发天命剑道，持续10秒；每次攻击都可穿透对手所有勋章，使其失效。") + "<br>";
            }
            if(canjuan >= 400)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("四戟") + "<br>" + LanResManager.getLanCommonTextWords("大易戟谱：被攻击时有几率触发大易戟谱，持续8秒；在此状态下，自身将免疫所有负面状态。") + "<br>";
            }
            if(canjuan >= 500)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("五棒") + "<br>" + LanResManager.getLanCommonTextWords("虎哮棒集：被攻击时有几率触发虎哮棒集，持续8秒；在此状态下，每受到一次攻击受到的伤害都将瞬间下降至为0。") + "<br>";
            }
            if(canjuan >= 600)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("六拳") + "<br>" + LanResManager.getLanCommonTextWords("山海拳经：被攻击时有几率触发山海拳经，持续8秒；在此状态下，受到的所有负面状态都将瞬间转移还给对手。") + "<br>";
            }
            if(canjuan >= 700)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("七掌") + "<br>" + LanResManager.getLanCommonTextWords("玄武神掌：被击时的几率触发玄武神掌，持续8秒；在此状态下，将100%免疫所有百分比掉血伤害。") + "<br>";
            }
            if(canjuan >= 800)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("八腿") + "<br>" + LanResManager.getLanCommonTextWords("烈强腿绝：攻击时的几率触发烈强腿绝，持续10秒；在此状态下，自身移动速度提升至极限，每移动一步犹如幻影，使对手无法看清。") + "<br>";
            }
            if(canjuan >= 900)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("九指") + "<br>" + LanResManager.getLanCommonTextWords("圆融金指：攻击时的几率触发圆融金指，持续10秒；在此状态下，所有的对手将失去对自身的锁定，自身可随意任何人攻击，且不受伤害。") + "<br>";
            }
            if(canjuan >= 1000)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("十爪") + "<br>" + LanResManager.getLanCommonTextWords("甲骨龙爪：攻击时的几率触发甲骨龙爪，持续10秒；在此状态下，自身将触发甲骨给自身形成一须能无敌。") + "<br>";
            }
            return _loc1_ + "</textformat>";
         });
         this.kuaisuBtn = new SecondButton();
         this.kuaisuBtn.label = "Dùng nhanh";
         addChild(this.kuaisuBtn);
         this.kuaisuBtn.x = 309;
         this.kuaisuBtn.y = 226;
         this.kuaisuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.check:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check.selectState,34]));
               break;
            case this.checkZq:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkZq.selectState,42]));
               break;
            case this.checkSLZ:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkSLZ.selectState,57]));
         }
      }
      
      private function initBtns() : void
      {
         this.spr0 = new Sprite();
         this.btn0 = new MovieClip();
         this.spr0.name = "0";
         this.spr0.buttonMode = true;
         this.spr0.mouseChildren = false;
         this.spr0.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         addChild(this.spr0);
         this.url0 = GameConfig.fileBaseFolder + "res/ui/UIditu/wuduzhen/shengxie.swf";
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != url0)
            {
               return;
            }
            if(Boolean(btn0) && btn0.parent != null)
            {
               btn0.stop();
               btn0.parent.removeChild(btn0);
            }
            btn0 = _loc2_.content as MovieClip;
            if(btn0)
            {
               spr0.addChild(btn0);
            }
         },null,false,this.url0);
         this.spr0.x = 165;
         this.spr0.y = 8;
         this.btnArray.push(this.spr0);
         this.spr1 = new Sprite();
         this.btn1 = new MovieClip();
         this.spr1.name = "1";
         this.spr1.buttonMode = true;
         this.spr1.mouseChildren = false;
         this.spr1.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         addChild(this.spr1);
         this.url1 = GameConfig.fileBaseFolder + "res/ui/UIditu/wuduzhen/yuchan.swf";
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != url1)
            {
               return;
            }
            if(Boolean(btn1) && btn1.parent != null)
            {
               btn1.stop();
               btn1.parent.removeChild(btn1);
            }
            btn1 = _loc2_.content as MovieClip;
            if(btn1)
            {
               spr1.addChild(btn1);
            }
         },null,false,this.url1);
         this.spr1.x = 256;
         this.spr1.y = 83;
         this.btnArray.push(this.spr1);
         this.spr2 = new Sprite();
         this.btn2 = new MovieClip();
         this.spr2.name = "2";
         this.spr2.buttonMode = true;
         this.spr2.mouseChildren = false;
         this.spr2.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         addChild(this.spr2);
         this.url2 = GameConfig.fileBaseFolder + "res/ui/UIditu/wuduzhen/lingshe.swf";
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != url2)
            {
               return;
            }
            if(Boolean(btn2) && btn2.parent != null)
            {
               btn2.stop();
               btn2.parent.removeChild(btn2);
            }
            btn2 = _loc2_.content as MovieClip;
            if(btn2)
            {
               spr2.addChild(btn2);
            }
         },null,false,this.url2);
         this.spr2.x = 223;
         this.spr2.y = 171;
         this.btnArray.push(this.spr2);
         this.spr3 = new Sprite();
         this.spr3.buttonMode = true;
         this.btn3 = new MovieClip();
         this.spr3.name = "3";
         this.spr3.mouseChildren = false;
         this.spr3.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         addChild(this.spr3);
         this.url3 = GameConfig.fileBaseFolder + "res/ui/UIditu/wuduzhen/wugong.swf";
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != url3)
            {
               return;
            }
            if(Boolean(btn3) && btn3.parent != null)
            {
               btn3.stop();
               btn3.parent.removeChild(btn3);
            }
            btn3 = _loc2_.content as MovieClip;
            if(btn3)
            {
               spr3.addChild(btn3);
            }
         },null,false,this.url3);
         this.spr3.x = 116;
         this.spr3.y = 171;
         this.btnArray.push(this.spr3);
         this.spr4 = new Sprite();
         this.btn4 = new MovieClip();
         this.spr4.name = "4";
         this.spr4.buttonMode = true;
         this.spr4.mouseChildren = false;
         this.spr4.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         addChild(this.spr4);
         this.url4 = GameConfig.fileBaseFolder + "res/ui/UIditu/wuduzhen/tianzhu.swf";
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != url4)
            {
               return;
            }
            if(Boolean(btn4) && btn4.parent != null)
            {
               btn4.stop();
               btn4.parent.removeChild(btn4);
            }
            btn4 = _loc2_.content as MovieClip;
            if(btn4)
            {
               spr4.addChild(btn4);
            }
         },null,false,this.url4);
         this.spr4.x = 80;
         this.spr4.y = 83;
         this.btnArray.push(this.spr4);
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
         this.tupoCanvas.$parent = this._parent;
         this.tupoCanvas.$parent2 = this;
      }
      
      private function onTupoClose(param1:BaseEvent) : void
      {
         this.showTupoPanel(false);
      }
      
      private function onBtnClick(param1:MouseEvent) : void
      {
         var _loc2_:Sprite = param1.target as Sprite;
         var _loc3_:int = parseInt(_loc2_.name);
         if(_loc3_ == this.curSelect)
         {
            return;
         }
         this.curSelect = _loc3_;
         this.curGrade = this.dataArray[_loc3_].lookid;
         this.showTupoPanel(false);
         switch(param1.target)
         {
            case this.spr0:
               this.setSelectData(0);
               break;
            case this.spr1:
               this.setSelectData(1);
               break;
            case this.spr2:
               this.setSelectData(2);
               break;
            case this.spr3:
               this.setSelectData(3);
               break;
            case this.spr4:
               this.setSelectData(4);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.shuoMingBtn:
               if(Boolean(this.shuoMingCanvas) && Boolean(this.shuoMingCanvas.parent))
               {
                  if(this.shuoMingCanvas.parent)
                  {
                     this.shuoMingCanvas.parent.removeChild(this.shuoMingCanvas);
                  }
               }
               else
               {
                  addChild(this.shuoMingCanvas);
                  this.shuoMingCanvas.x = 415;
                  this.shuoMingCanvas.y = 110;
               }
               break;
            case this.tupoBtn:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WUDUZHEN_TUPO_CLICK,"",[this.curSelect,this.curGrade]));
               break;
            case this.preBtn:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WUDUZHEN_PRE_NEXT_CLICK,"",[this.curSelect,this.curGrade - 1]));
               break;
            case this.nextBtn:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WUDUZHEN_PRE_NEXT_CLICK,"",[this.curSelect,this.curGrade + 1]));
               break;
            case this.kuaisuBtn:
               PipeManager.sendMsg(PipeConstants.SEND_53099,[267,this.curSelect]);
         }
      }
      
      private function resizeTeXiao(param1:int) : void
      {
         this.selectSpr.x = this.btnArray[param1].x - 4;
         this.selectSpr.y = this.btnArray[param1].y - 6;
      }
      
      private function onCheckTip(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.jinengSpr.addEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("百毒不侵") + "<br></font>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("【获得方式】") + "<br>" + LanResManager.getLanCommonTextWords("五毒阵全部阵法提升至顶级并将各属性提至满级后自动学会") + "<br>" + LanResManager.getLanCommonTextWords("【使用方式】") + "<br>" + LanResManager.getLanCommonTextWords("被动技能，无需使用") + "<br>" + LanResManager.getLanCommonTextWords("【技能效果】") + "<br>" + LanResManager.getLanCommonTextWords("降低全部持续掉血时所受到的伤害") + "<br>" + LanResManager.getLanCommonTextWords("【技能培养】") + "<br>" + LanResManager.getLanCommonTextWords("可通过使用冰魄银针来提升持续掉血时的免伤效果") + "<br>" + LanResManager.getLanCommonTextWords("【当前效果】") + "<br>" + LanResManager.getLanCommonTextWords("当前在持续掉血时获得的免伤量为") + 500000 * this.mianshangliang + "</font></textformat>";
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.jinengSpr.removeEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
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
      
      private function setPreNextBtn(param1:int) : void
      {
         if(param1 == this.minGrade)
         {
            this.preBtn.enabled = false;
            this.nextBtn.enabled = true;
         }
         if(param1 == this.maxGrade)
         {
            this.preBtn.enabled = true;
            this.nextBtn.enabled = false;
         }
         if(param1 > this.minGrade && param1 < this.maxGrade)
         {
            this.preBtn.enabled = true;
            this.nextBtn.enabled = true;
         }
      }
      
      public function setPanel(param1:Boolean, param2:int, param3:Array, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:int, param10:Boolean, param11:int, param12:Boolean, param13:Boolean, param14:Boolean) : void
      {
         this.isOther = param1;
         this.dataArray = new Array();
         this.dataArray = param3;
         this.setSelectData(param2);
         this.setZhongJiaCheng(param4,param5,param6,param7,param8);
         this.setskill(param9,param10);
         this.mianshangliang = param11;
         this.setJiHuo(param1);
         this.check.selectState = param12;
         this.checkZq.selectState = param13;
         this.checkSLZ.selectState = param14;
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.WUDUZHEN_DINGJI_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.WUDUZHEN_ZHIZHUNXINFA_ID] > 0 ? true : false;
            this.baoyu = GameState.dictTargetStatus[SpecialGoodsID.WUDUZHEN_BAOYULIHUAZHEN_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.WUDUZHEN_SIWANGXUANYAN])
            {
               this.setSkillJiHuo(200221,true);
               this.mainSkillContainer.visible = true;
               this.kuang1.visible = true;
            }
            else
            {
               this.mainSkillContainer.visible = false;
               this.kuang1.visible = false;
            }
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.WUDUZHEN_SIWANGCHANRAO_ID];
            this.siwangfuyin = GameState.dictTargetStatus[SpecialGoodsID.WUDUZHEN_SIWANGFUYIN_ID];
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.WUDUZHEN_WUDUMISHU_ID];
            this.tianzhu = GameState.dictTargetStatus[SpecialGoodsID.WUDUZHEN_TIANZHU_ID];
            this.shengxie = GameState.dictTargetStatus[SpecialGoodsID.WUDUZHEN_SHENGXIE_ID];
            this.lingshe = GameState.dictTargetStatus[SpecialGoodsID.WUDUZHEN_LINGSHE_ID];
            this.fengwu = GameState.dictTargetStatus[SpecialGoodsID.WUDUZHEN_FENGWU_ID];
            this.yucan = GameState.dictTargetStatus[SpecialGoodsID.WUDUZHEN_YUCAN_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.WUDUZHEN_XIONGBAHUANZHUANG_ID])
            {
               this.fts5.visible = true;
               this.check.visible = true;
               this.checkLabel.visible = true;
            }
            else
            {
               this.fts5.visible = false;
               this.check.visible = false;
               this.checkLabel.visible = false;
            }
            if(GameState.dictTargetStatus[SpecialGoodsID.WUDUZHEN_SHOUJIANXIAN_ID])
            {
               this.fts6.visible = true;
               this.checkZq.visible = true;
            }
            else
            {
               this.fts6.visible = false;
               this.checkZq.visible = false;
            }
            this.fts7.visible = GameState.dictTargetStatus[SpecialGoodsID.WUDUZHEN_ZILINGZHEN_ID];
            this.checkSLZ.visible = GameState.dictTargetStatus[SpecialGoodsID.WUDUZHEN_ZILINGZHEN_ID];
            this.fts8.visible = GameState.dictTargetStatus[SpecialGoodsID.WUDUZHEN_XUANWUZHENGONGBAODIAN_ID];
            this.canjuan = GameState.dictTargetStatus[SpecialGoodsID.WUDUZHEN_BAODIANCANJUAN_ID];
         }
         else
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.WUDUZHEN_DINGJI_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.WUDUZHEN_ZHIZHUNXINFA_ID] > 0 ? true : false;
            this.baoyu = GameState.dictMainStatus[SpecialGoodsID.WUDUZHEN_BAOYULIHUAZHEN_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.WUDUZHEN_SIWANGXUANYAN])
            {
               this.setSkillJiHuo(200221,true);
               this.mainSkillContainer.visible = true;
               this.kuang1.visible = true;
            }
            else
            {
               this.mainSkillContainer.visible = false;
               this.kuang1.visible = false;
            }
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.WUDUZHEN_SIWANGCHANRAO_ID];
            this.siwangfuyin = GameState.dictMainStatus[SpecialGoodsID.WUDUZHEN_SIWANGFUYIN_ID];
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.WUDUZHEN_WUDUMISHU_ID];
            this.tianzhu = GameState.dictMainStatus[SpecialGoodsID.WUDUZHEN_TIANZHU_ID];
            this.shengxie = GameState.dictMainStatus[SpecialGoodsID.WUDUZHEN_SHENGXIE_ID];
            this.lingshe = GameState.dictMainStatus[SpecialGoodsID.WUDUZHEN_LINGSHE_ID];
            this.fengwu = GameState.dictMainStatus[SpecialGoodsID.WUDUZHEN_FENGWU_ID];
            this.yucan = GameState.dictMainStatus[SpecialGoodsID.WUDUZHEN_YUCAN_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.WUDUZHEN_XIONGBAHUANZHUANG_ID])
            {
               this.fts5.visible = true;
               this.check.visible = true;
               this.checkLabel.visible = true;
            }
            else
            {
               this.fts5.visible = false;
               this.check.visible = false;
               this.checkLabel.visible = false;
            }
            if(GameState.dictMainStatus[SpecialGoodsID.WUDUZHEN_SHOUJIANXIAN_ID])
            {
               this.fts6.visible = true;
               this.checkZq.visible = true;
            }
            else
            {
               this.fts6.visible = false;
               this.checkZq.visible = false;
            }
            this.fts7.visible = GameState.dictMainStatus[SpecialGoodsID.WUDUZHEN_ZILINGZHEN_ID];
            this.checkSLZ.visible = GameState.dictMainStatus[SpecialGoodsID.WUDUZHEN_ZILINGZHEN_ID];
            this.fts8.visible = GameState.dictMainStatus[SpecialGoodsID.WUDUZHEN_XUANWUZHENGONGBAODIAN_ID];
            this.canjuan = GameState.dictMainStatus[SpecialGoodsID.WUDUZHEN_BAODIANCANJUAN_ID];
         }
      }
      
      public function setskill(param1:int, param2:Boolean) : void
      {
         while(this.jinengSpr.numChildren > 0)
         {
            this.jinengSpr.removeChildAt(0);
         }
         var _loc3_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wuduzhen/jineng.swf");
         this.jinengSpr.addChild(_loc3_);
         if(!param2)
         {
            _loc3_.filters = Tools.blackWhiteFilter;
         }
         else
         {
            _loc3_.filters = [];
         }
         this.jinengSpr.addEventListener(MouseEvent.MOUSE_OVER,this.onCheckTip);
         this.jinengSpr.addEventListener(MouseEvent.MOUSE_OUT,this.onCheckTip);
      }
      
      public function setSelectData(param1:int = 0) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < 5)
         {
            if(_loc2_ == param1)
            {
               this.bgArr[_loc2_].visible = true;
            }
            else
            {
               this.bgArr[_loc2_].visible = false;
            }
            _loc2_++;
         }
         this.resizeTeXiao(param1);
         var _loc3_:Object = this.dataArray[param1] as Object;
         this.curSelect = param1;
         this.curGrade = _loc3_.lookid;
         this.mingzi.htmlText = _loc3_.name;
         this.lv.htmlText = LanResManager.getLanCommonTextWords("等级：") + _loc3_.lookid;
         this.barBar1.setValue(_loc3_.shengming,_loc3_.maxShengming);
         this.barBar2.setValue(_loc3_.neili,_loc3_.maxNeili);
         this.barBar3.setValue(_loc3_.tili,_loc3_.maxTili);
         this.barBar4.setValue(_loc3_.gongji,_loc3_.maxGongji);
         this.barBar5.setValue(_loc3_.fangyu,_loc3_.maxFangyu);
         this.setPreNextBtn(_loc3_.lookid);
         this.setTuPoBtn(_loc3_.lookid,_loc3_.nowid,_loc3_.shengming == _loc3_.maxShengming);
         if(this.isOther)
         {
            this.setEnableFun();
         }
      }
      
      public function setZhongJiaCheng(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         var _loc6_:String = "";
         _loc6_ = "<font color=\'" + StaticValue.GREEN_HTML + "\'>";
         if(this.isOther)
         {
            if(GameState.dictTargetStatus[SpecialGoodsID.WUDUZHEN_FANBEISHI_ID] > 0 ? true : false)
            {
               if(param1 != 0)
               {
                  _loc6_ += LanResManager.getLanCommonTextWords("生命：") + "+" + param1 + " " + "X" + "2" + "<br>";
               }
               else
               {
                  _loc6_ += LanResManager.getLanCommonTextWords("生命：") + "+" + param1 + "<br>";
               }
               if(param2 != 0)
               {
                  _loc6_ += LanResManager.getLanCommonTextWords("内力：") + "+" + param2 + " " + "X" + "2" + "<br>";
               }
               else
               {
                  _loc6_ += LanResManager.getLanCommonTextWords("内力：") + "+" + param2 + "<br>";
               }
               if(param3 != 0)
               {
                  _loc6_ += LanResManager.getLanCommonTextWords("体力：") + "+" + param3 + " " + "X" + "2" + "<br>";
               }
               else
               {
                  _loc6_ += LanResManager.getLanCommonTextWords("体力：") + "+" + param3 + "<br>";
               }
               if(param4 != 0)
               {
                  _loc6_ += LanResManager.getLanCommonTextWords("攻击：") + "+" + param4 + " " + "X" + "2" + "<br>";
               }
               else
               {
                  _loc6_ += LanResManager.getLanCommonTextWords("攻击：") + "+" + param4 + "<br>";
               }
               if(param5 != 0)
               {
                  _loc6_ += LanResManager.getLanCommonTextWords("防御：") + "+" + param5 + " " + "X" + "2" + "<br>";
               }
               else
               {
                  _loc6_ += LanResManager.getLanCommonTextWords("防御：") + "+" + param5 + "<br>";
               }
            }
            else
            {
               _loc6_ += LanResManager.getLanCommonTextWords("生命：") + "+" + param1 + "<br>" + LanResManager.getLanCommonTextWords("内力：") + "+" + param2 + "<br>" + LanResManager.getLanCommonTextWords("体力：") + "+" + param3 + "<br>" + LanResManager.getLanCommonTextWords("攻击：") + "+" + param4 + "<br>" + LanResManager.getLanCommonTextWords("防御：") + "+" + param5 + "<br>" + "</font>";
            }
         }
         else if(GameState.dictMainStatus[SpecialGoodsID.WUDUZHEN_FANBEISHI_ID] > 0 ? true : false)
         {
            if(param1 != 0)
            {
               _loc6_ += LanResManager.getLanCommonTextWords("生命：") + "+" + param1 + " " + "X" + "2" + "<br>";
            }
            else
            {
               _loc6_ += LanResManager.getLanCommonTextWords("生命：") + "+" + param1 + "<br>";
            }
            if(param2 != 0)
            {
               _loc6_ += LanResManager.getLanCommonTextWords("内力：") + "+" + param2 + " " + "X" + "2" + "<br>";
            }
            else
            {
               _loc6_ += LanResManager.getLanCommonTextWords("内力：") + "+" + param2 + "<br>";
            }
            if(param3 != 0)
            {
               _loc6_ += LanResManager.getLanCommonTextWords("体力：") + "+" + param3 + " " + "X" + "2" + "<br>";
            }
            else
            {
               _loc6_ += LanResManager.getLanCommonTextWords("体力：") + "+" + param3 + "<br>";
            }
            if(param4 != 0)
            {
               _loc6_ += LanResManager.getLanCommonTextWords("攻击：") + "+" + param4 + " " + "X" + "2" + "<br>";
            }
            else
            {
               _loc6_ += LanResManager.getLanCommonTextWords("攻击：") + "+" + param4 + "<br>";
            }
            if(param5 != 0)
            {
               _loc6_ += LanResManager.getLanCommonTextWords("防御：") + "+" + param5 + " " + "X" + "2" + "<br>";
            }
            else
            {
               _loc6_ += LanResManager.getLanCommonTextWords("防御：") + "+" + param5 + "<br>";
            }
         }
         else
         {
            _loc6_ += LanResManager.getLanCommonTextWords("生命：") + "+" + param1 + "<br>" + LanResManager.getLanCommonTextWords("内力：") + "+" + param2 + "<br>" + LanResManager.getLanCommonTextWords("体力：") + "+" + param3 + "<br>" + LanResManager.getLanCommonTextWords("攻击：") + "+" + param4 + "<br>" + LanResManager.getLanCommonTextWords("防御：") + "+" + param5 + "<br>" + "</font>";
         }
         this.zhongJiaCheng.htmlText = _loc6_;
      }
      
      public function setTuPoBtn(param1:int, param2:int, param3:Boolean) : void
      {
         if(param1 < param2)
         {
            this.tupoBtn.label = LanResManager.getLanCommonTextWords("已突破");
         }
         else
         {
            this.tupoBtn.label = LanResManager.getLanCommonTextWords("突破");
         }
         if(param1 == param2 && param1 == this.maxGrade)
         {
            this.tupoBtn.label = LanResManager.getLanCommonTextWords("已达顶层");
         }
         if(param3 && param1 == param2 && param1 != this.maxGrade)
         {
            this.tupoBtn.enabled = true;
         }
         else
         {
            this.tupoBtn.enabled = false;
         }
      }
      
      public function showShuoMing(param1:Boolean) : void
      {
         if(!param1)
         {
            if(Boolean(this.shuoMingCanvas) && Boolean(this.shuoMingCanvas.parent))
            {
               this.shuoMingCanvas.parent.removeChild(this.shuoMingCanvas);
            }
         }
      }
      
      public function showTupoPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.tupoCanvas.y == 385)
            {
               TweenMax.to(this.tupoCanvas,1,{
                  "y":245,
                  "onComplete":this.onCom
               });
            }
         }
         else if(this.tupoCanvas.y == 245)
         {
            TweenMax.to(this.tupoCanvas,1,{
               "y":385,
               "onComplete":this.onCom
            });
            this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WUDUZHEN_ZIDONGTISHENG_CLICK,"",false));
         }
      }
      
      private function onCom() : void
      {
      }
      
      public function setTupoPanel(param1:int, param2:Goods, param3:int, param4:int, param5:int, param6:int, param7:int = 0) : void
      {
         this.tupoCanvas.setTupoPanel(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setTuPoPanelBtn(param1:Boolean) : void
      {
         this.tupoCanvas.setZdtsBtnLabel(param1);
      }
      
      public function isShowTupo() : Boolean
      {
         if(Boolean(this.tupoCanvas) && Boolean(this.tupoCanvas.parent != null) && this.tupoCanvas.y == 245)
         {
            return true;
         }
         return false;
      }
      
      public function setEnableFun() : void
      {
         this.tupoBtn.enabled = false;
         this.preBtn.enabled = false;
         this.nextBtn.enabled = false;
         this.shuoMingBtn.enabled = false;
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
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WUDUZHEN_SIWANGXUANYAN_SKILL_DRAG,"",this.currSkill));
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

