package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.lianQi.model.info.LianQiVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import gs.TweenMax;
   
   public class LianQi extends Sprite
   {
      
      public static const UI_LIANQI_GUANBI_CLICK:String = "UI_LIANQI_GUANBI_CLICK";
      
      private var fc1:FCanvas;
      
      private var shangyiyeButton:FSimpleButton;
      
      private var xiayiyeButton:FSimpleButton;
      
      private var cengshu:FTextArea;
      
      private var tishengBtn:SecondButton;
      
      public const LIANQI_MAX:int = 15;
      
      private var nowId:int;
      
      private var lookingId:int;
      
      private var tupoBo:Boolean = false;
      
      private var bloodMc:MovieClip;
      
      private var mcObj:Array;
      
      private var bloodMcSpr:Sprite;
      
      private var _avatar:Bitmap;
      
      private var lianqiTupo:LianQiTupoCanvas;
      
      private var lianqihuoqu:LianQiHuoQuPanel;
      
      private var barBg1:Bitmap;
      
      private var barBg2:Bitmap;
      
      private var barBg3:Bitmap;
      
      private var barBg4:Bitmap;
      
      private var barBg5:Bitmap;
      
      private var barBg6:Bitmap;
      
      private var barBar1:ColorBar;
      
      private var barBar2:ColorBar;
      
      private var barBar3:ColorBar;
      
      private var barBar4:ColorBar;
      
      private var barBar5:ColorBar;
      
      private var barBar6:ColorBar;
      
      private var barBar7:ColorBar;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var duihuan:FTextArea;
      
      private var huoqu:FTextArea;
      
      public var $parent:DisplayObject;
      
      private var ft7:FTextArea;
      
      private var ft9:FTextArea;
      
      private var tubiao:DisplayObject;
      
      private var jingyanbar:DisplayObject;
      
      private var tf:TextFormat;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var fts3:FTextArea;
      
      private var fts4:FTextArea;
      
      private var equipContainers:Sprite;
      
      private var isMain:Boolean;
      
      private var kuangHD:Bitmap;
      
      private var kuangSpr:Sprite;
      
      private var fts5:FTextArea;
      
      private var check:FCheckBox;
      
      private var checkLabel:FLabel;
      
      private var gooditem:ItemFace;
      
      private var fts6:FTextArea;
      
      private var suipian:int = 0;
      
      private var mainSkillContainer:Sprite;
      
      private var mainSkillItemFace:ItemFace;
      
      private var kuang1:Bitmap;
      
      private var p:Point;
      
      private var currSkill:ItemFace;
      
      private var fts7:FTextArea;
      
      private var checkHz:FCheckBox;
      
      private var fts8:FTextArea;
      
      private var checkHz2:FCheckBox;
      
      private var fts9:FTextArea;
      
      private var checkDt:FCheckBox;
      
      public function LianQi()
      {
         var ft3:FTextArea;
         var ft6:FTextArea;
         var ft4:FTextArea;
         var ft8:FTextArea;
         var ft5:FTextArea;
         var $mask:Sprite;
         var i:int;
         var ft1:FTextArea = null;
         var ft2:FTextArea = null;
         super();
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.fc1 = new FCanvas();
         this.fc1.x = 0;
         this.fc1.y = 1;
         this.fc1.width = 403;
         this.fc1.height = 366;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.fc1 = new FCanvas();
         this.fc1.x = 0 + 2;
         this.fc1.y = 282 - 5 - 50 + 23 + 9 + 2 - 70;
         this.fc1.width = 403 - 4;
         this.fc1.height = 80 + 5 + 2 + 50 - 23 - 9 - 2 + 70;
         this.fc1.skin = "box_transparence";
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         this.tip.x = 2;
         this.tip.y = 2;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.textColor = StaticValue.WHITE;
         this.tip.filters = StaticValue.filter;
         this.tipCanvas.addChild(this.tip);
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 1 + 1;
         this.bloodMcSpr.y = 1;
         addChildAt(this.bloodMcSpr,0);
         this._avatar = new Bitmap();
         addChild(this._avatar);
         this.shangyiyeButton = new FSimpleButton();
         this.shangyiyeButton.skin = "previousButton";
         addChild(this.shangyiyeButton);
         this.shangyiyeButton.x = 240 + 50 - 45 - 16 - 116 + 25 + 10 + 5;
         this.shangyiyeButton.y = 205 - 30 + 10;
         this.shangyiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cengshu = new FTextArea();
         this.cengshu.autoSize;
         addChild(this.cengshu);
         this.cengshu.defaultTextFormat = this.tf;
         this.cengshu.background = true;
         this.cengshu.backgroundColor = 1186072;
         this.cengshu.width = 60;
         this.cengshu.height = 20;
         this.cengshu.x = 180 - 50 + 13 + 15 + 10 + 5;
         this.cengshu.y = 205 - 30 + 10;
         this.xiayiyeButton = new FSimpleButton();
         this.xiayiyeButton.skin = "nextButton";
         addChild(this.xiayiyeButton);
         this.xiayiyeButton.x = 240 + 50 - 45 - 16 + 5;
         this.xiayiyeButton.y = 205 - 30 + 10;
         this.xiayiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.jingyanbar = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/lianqi/barbg.swf");
         this.jingyanbar.x = 30 - 27;
         this.jingyanbar.y = 335;
         addChild(this.jingyanbar);
         this.tishengBtn = new SecondButton();
         addChild(this.tishengBtn);
         this.tishengBtn.x = 240 + 50 + 30 + 33 - 24;
         this.tishengBtn.y = 205 + 130 + 2 + 2 + 1;
         this.tishengBtn.label = LanResManager.getLanCommonTextWords("突破");
         this.tishengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         ft1 = new FTextArea();
         ft1.multiline = true;
         ft1.filters = StaticValue.filter;
         ft1.width = 100;
         ft1.height = 110;
         ft1.x = 15;
         ft1.y = 210 + 7 + 6;
         ft1.textColor = StaticValue.ORANGE;
         ft1.htmlText = "<textformat leading=\'50\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("炼气属性：") + "</font></textformat>";
         addChild(ft1);
         ft2 = new FTextArea();
         ft2.multiline = true;
         ft2.filters = StaticValue.filter;
         ft2.width = 200;
         ft2.height = 110;
         ft2.x = 30 + 100;
         ft2.y = 210 + 7 + 6;
         ft2.textColor = StaticValue.ORANGE;
         ft2.htmlText = "<textformat leading=\'50\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("通过获取炼气值增加角色属性") + "</font></textformat>";
         addChild(ft2);
         ft3 = new FTextArea();
         ft3.multiline = true;
         ft3.filters = StaticValue.filter;
         ft3.width = 100;
         ft3.height = 60;
         ft3.x = 15;
         ft3.y = 260 - 25 + 6;
         addChild(ft3);
         ft3.htmlText = "<font  color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("生命") + "</font>";
         ft6 = new FTextArea();
         ft6.multiline = true;
         ft6.filters = StaticValue.filter;
         ft6.width = 100;
         ft6.height = 60;
         ft6.x = 15;
         ft6.y = 260 - 25 + 16 + 6;
         addChild(ft6);
         ft6.htmlText = "<font  color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击") + "</font>";
         this.ft7 = new FTextArea();
         this.ft7.multiline = true;
         this.ft7.filters = StaticValue.filter;
         this.ft7.width = 100;
         this.ft7.height = 60;
         this.ft7.x = 15;
         this.ft7.y = 260 - 25 + 16 + 16 + 6;
         addChild(this.ft7);
         this.ft7.htmlText = "<font  color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("暴击") + "</font>";
         ft4 = new FTextArea();
         ft4.multiline = true;
         ft4.filters = StaticValue.filter;
         ft4.width = 100;
         ft4.height = 60;
         ft4.x = 200;
         ft4.y = 260 - 25 + 6;
         addChild(ft4);
         ft4.htmlText = "<font  color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("内力") + "</font>";
         ft8 = new FTextArea();
         ft8.multiline = true;
         ft8.filters = StaticValue.filter;
         ft8.width = 100;
         ft8.height = 60;
         ft8.x = 200;
         ft8.y = 260 - 25 + 16 + 6;
         addChild(ft8);
         ft8.htmlText = "<font  color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("防御") + "</font>";
         this.ft9 = new FTextArea();
         this.ft9.multiline = true;
         this.ft9.filters = StaticValue.filter;
         this.ft9.width = 100;
         this.ft9.height = 60;
         this.ft9.x = 200;
         this.ft9.y = 260 - 25 + 16 + 16 + 6;
         addChild(this.ft9);
         this.ft9.htmlText = "<font  color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("闪避") + "</font>";
         this.barBg1 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         addChild(this.barBg1);
         this.barBg1.x = 50;
         this.barBg1.y = 238 + 6;
         this.barBg2 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         addChild(this.barBg2);
         this.barBg2.x = 50;
         this.barBg2.y = 238 + 16 + 6;
         this.barBg3 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         addChild(this.barBg3);
         this.barBg3.x = 50;
         this.barBg3.y = 238 + 32 + 6;
         this.barBg4 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         addChild(this.barBg4);
         this.barBg4.x = 50 + 185;
         this.barBg4.y = 238 + 6;
         this.barBg5 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         addChild(this.barBg5);
         this.barBg5.x = 50 + 185;
         this.barBg5.y = 238 + 16 + 6;
         this.barBg6 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         addChild(this.barBg6);
         this.barBg6.x = 50 + 185;
         this.barBg6.y = 238 + 32 + 6;
         this.barBar1 = new ColorBar(5,123,5);
         addChild(this.barBar1);
         this.barBar1.x = 50 + 4;
         this.barBar1.y = 238 + 3 + 6;
         this.barBar2 = new ColorBar(5,123,5);
         addChild(this.barBar2);
         this.barBar2.x = 50 + 4;
         this.barBar2.y = 238 + 3 + 16 + 6;
         this.barBar3 = new ColorBar(5,123,5);
         addChild(this.barBar3);
         this.barBar3.x = 50 + 4;
         this.barBar3.y = 238 + 3 + 32 + 6;
         this.barBar4 = new ColorBar(5,123,5);
         addChild(this.barBar4);
         this.barBar4.x = 50 + 4 + 185;
         this.barBar4.y = 238 + 3 + 6;
         this.barBar5 = new ColorBar(5,123,5);
         addChild(this.barBar5);
         this.barBar5.x = 50 + 4 + 185;
         this.barBar5.y = 238 + 3 + 16 + 6;
         this.barBar6 = new ColorBar(5,123,5);
         addChild(this.barBar6);
         this.barBar6.x = 50 + 4 + 185;
         this.barBar6.y = 238 + 3 + 32 + 6;
         ft5 = new FTextArea();
         ft5.multiline = true;
         ft5.filters = StaticValue.filter;
         ft5.width = 100;
         ft5.height = 110;
         ft5.x = 15;
         ft5.y = 240 - 24 + 85 - 9 - 5 + 6;
         ft5.textColor = StaticValue.ORANGE;
         ft5.htmlText = "<textformat leading=\'50\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("炼气值：") + "</font></textformat>";
         addChild(ft5);
         this.huoqu = new FTextArea();
         this.huoqu.multiline = true;
         this.huoqu.filters = StaticValue.filter;
         this.huoqu.width = 280;
         this.huoqu.height = 50;
         this.huoqu.wordWrap = true;
         this.huoqu.x = 60;
         this.huoqu.y = 240 - 24 + 85 - 9 - 5 + 6;
         addChild(this.huoqu);
         this.barBar7 = new ColorBar(5,292,7);
         addChild(this.barBar7);
         this.barBar7.x = 30 + 4 - 27 + 7 + 7;
         this.barBar7.y = 335 + 3 + 6 + 4 - 1;
         this.barBg1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.barBg1.x = 325;
         this.barBg1.y = 150;
         this.tubiao = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/lianqi/kuang.swf");
         this.tubiao.x = 325;
         this.tubiao.y = 150;
         this.tubiao.addEventListener(MouseEvent.MOUSE_OVER,this.onCheckTip);
         this.tubiao.addEventListener(MouseEvent.MOUSE_OUT,this.onCheckTip);
         this.duihuan = new FTextArea();
         this.duihuan.multiline = true;
         this.duihuan.filters = StaticValue.filter;
         this.duihuan.width = 100;
         this.duihuan.height = 25;
         this.duihuan.x = 30 + 200 + 40 - 250 + 176 + 40 + 29;
         this.duihuan.y = 240 - 24 + 100 + 20 + 9 - 25 - 15 - 2 + 6;
         addChild(this.duihuan);
         this.duihuan.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'><a><u>" + LanResManager.getLanCommonTextWords("快速获取炼气") + "</u></a></font>";
         this.duihuan.addEventListener(MouseEvent.MOUSE_OVER,this.onCheckTip);
         this.duihuan.addEventListener(MouseEvent.MOUSE_OUT,this.onCheckTip);
         this.duihuan.addEventListener(MouseEvent.CLICK,this.onClick2);
         this.lianqiTupo = new LianQiTupoCanvas();
         addChild(this.lianqiTupo);
         this.lianqiTupo.x = -10;
         this.lianqiTupo.y = 380;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = -10;
         $mask.y = 270;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,425 + 50 + 60,110 - 2);
            endFill();
         }
         this.lianqiTupo.mask = $mask;
         addEventListener(UI_LIANQI_GUANBI_CLICK,this.onCloseTupo);
         this.mcObj = new Array();
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 7;
         this.fts1.textColor = StaticValue.RED;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = "";
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("炼气翻倍：") + "<br>" + LanResManager.getLanCommonTextWords("炼气系统所有属性翻倍。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 28;
         this.fts2.textColor = StaticValue.RED;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.htmlText = "";
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("炼气顶级神功：") + "<br>" + LanResManager.getLanCommonTextWords("攻击28888888、防御16888888、血量488888888、暴击888、闪避888、所有武功提升12层、人物攻击属性提升30%") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10 + 260;
         this.fts3.y = 7;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 170;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("罡气纵横(已激活)");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("罡气纵横：人物攻击增加20%") + "<br>" + LanResManager.getLanCommonTextWords("罡气纵横技能：永久性的对所有玩家都100%必定暴击造成超高攻击伤害！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts4 = new FTextArea();
         this.fts4.x = 10 + 260;
         this.fts4.y = 28;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 170;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("不朽神王炼气决(已激活)");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击：4888亿、防御3888亿、血量8888亿、所有武功提升 80000层") + "<br>" + LanResManager.getLanCommonTextWords("不朽神王（特殊能力）：激活后，永久减少自身所受到的伤害50%，且永久抵抗 耀阳圣尊、星炎大帝、暗月冥神三大勋章的特殊技能不朽神力。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.kuangSpr = new Sprite();
         addChild(this.kuangSpr);
         this.equipContainers = new Sprite();
         this.equipContainers.x = 295 - 288;
         this.equipContainers.y = 322 - 73 + 1 - 40 - 45;
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
         this.kuangHD.y = 266 - 2 - 1 - 10 - 40 - 45;
         this.fts5 = new FTextArea();
         this.fts5.x = 10;
         this.fts5.y = 28 + 20;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 170;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("凤凰精魄");
         this.fts5.visible = false;
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性：攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("凤凰涅槃：凤凰中国古老传说中的圣兽，也称不死火鸟，每500年自焚为烬，再从灰烬中重生，循环不已，") + "<br>" + LanResManager.getLanCommonTextWords("成为永生。当召唤凤凰时，攻击时或被攻击时有几率触发凤凰涅槃的状态，在此状态每次攻击对手都将灼") + "<br>" + LanResManager.getLanCommonTextWords("烧对手瞬间掉血80%，且自身所受到的对手伤害都将由凤凰来承受，且不管对手触发任何技能效果都将被凤") + "<br>" + LanResManager.getLanCommonTextWords("凰免疫掉，持续10秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.x = 10;
         this.check.y = 28 + 20 + 20;
         this.check.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.checkLabel = new FLabel();
         with(this.checkLabel)
         {
            x = check.x + 20;
            --check.y;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("自动换装");
         }
         addChild(this.checkLabel);
         i = 0;
         while(i < 4)
         {
            this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
            this.kuangSpr.addChild(this.kuangHD);
            this.kuangHD.x = 10 + 40 * i;
            this.kuangHD.y = 266 - 2 - 1 - 10 - 40 - 90;
            i++;
         }
         this.fts6 = new FTextArea();
         this.fts6.x = 10 + 315;
         this.fts6.y = 28 + 20 + 20 + 110;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 170;
         this.fts6.height = 20;
         this.fts6.htmlText = LanResManager.getLanCommonTextWords("电牢之术");
         this.fts6.visible = false;
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击12888888889000 防御10888888889000 血量13888888889000暴击 88888闪避88888   所有武功2500000层") + "<br>" + LanResManager.getLanCommonTextWords("电牢——激活电牢之术的玩家可获得主动技能，电牢之术；电牢，由4根雷电形成的牢狱，天界用于困锁世间最大妖") + "<br>" + LanResManager.getLanCommonTextWords("魔鬼怪。可锁定任意一个玩家施发电牢之术，可牢牢使对手锁天电牢内无法进行任何移动、跳跃、攻击操作；且电") + "<br>" + LanResManager.getLanCommonTextWords("牢内对手将施发电击，瞬间击中对手瞬间掉血40%，持续10秒。电牢之术冷却60秒。") + "<br>" + LanResManager.getLanCommonTextWords("电牢之术属性：激活电牢之术后，将开启电牢之术隐藏属性，可使用雷电碎片对该隐藏属性进行养成，最多可养成") + "<br>" + LanResManager.getLanCommonTextWords("200次。每个增加：攻击1500亿，所有武功350000层。") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用") + suipian + LanResManager.getLanCommonTextWords("颗雷电碎片") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + 1500 * suipian + LanResManager.getLanCommonTextWords("亿，所有武功") + 350000 * suipian + LanResManager.getLanCommonTextWords("层");
            return _loc1_ + "</textformat>";
         });
         this.kuang1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang1);
         this.kuang1.x = 25 + 324 + 2 - 58 - 30;
         this.kuang1.y = 160 + 35 - 186 + 156;
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 25 + 324 - 58 - 30 + 4;
         this.mainSkillContainer.y = 160 + 2 + 35 - 186 + 156;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp);
         this.fts7 = new FTextArea();
         this.fts7.x = 10;
         this.fts7.y = 28 + 20 + 40;
         this.fts7.textColor = StaticValue.GREEN;
         this.fts7.width = 110;
         this.fts7.height = 20;
         this.fts7.htmlText = LanResManager.getLanCommonTextWords("白面书生");
         this.fts7.visible = false;
         addChild(this.fts7);
         ToolTips.createToolTips(this.fts7,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("白面书生：一身白色装扮，手持白色折扇，乃仙人转化而成，玩家可自己转化。") + "<br>" + LanResManager.getLanCommonTextWords("蝶舞幻影：攻击时有几率触发蝶舞幻影，持续10秒；在此状态下，自身将提升凌") + "<br>" + LanResManager.getLanCommonTextWords("波微步之极至，每次跳跃都可瞬间清除所有负面状态，每次攻击都可使对手失去") + "<br>" + LanResManager.getLanCommonTextWords("对自身的锁定且BUFF期间内无法在被锁定；当状态解除时，可施发白面气场，可") + "<br>" + LanResManager.getLanCommonTextWords("震晕自身范围5格内的所有对手，持续10秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkHz = new FCheckBox();
         addChild(this.checkHz);
         this.checkHz.x = 10 + 80;
         this.checkHz.y = 28 + 20 + 40;
         this.checkHz.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts8 = new FTextArea();
         this.fts8.x = 60;
         this.fts8.y = 165 + 25;
         this.fts8.textColor = StaticValue.GREEN;
         this.fts8.width = 110;
         this.fts8.height = 20;
         this.fts8.htmlText = LanResManager.getLanCommonTextWords("红莲仙子");
         this.fts8.visible = false;
         addChild(this.fts8);
         ToolTips.createToolTips(this.fts8,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("红莲仙子：莲花诞生而成的仙子，全身通红，转在仙人，人物可自己切换。") + "<br>" + LanResManager.getLanCommonTextWords("红莲无情：攻击时有几率触发红莲无情，持续20秒；在此状态下，每次攻击都会发出冰魄银针，") + "<br>" + LanResManager.getLanCommonTextWords("是对手受到额外50%自身血量伤害；且受到冰魄银针伤害后，内力全失，丧失攻击能力，在此状") + "<br>" + LanResManager.getLanCommonTextWords("态下若无法保持血量高于50%，有几率毒发身亡瞬间死亡。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkHz2 = new FCheckBox();
         addChild(this.checkHz2);
         this.checkHz2.x = 60 + 80 - 25;
         this.checkHz2.y = 165 + 25;
         this.checkHz2.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts9 = new FTextArea();
         this.fts9.x = 60;
         this.fts9.y = 165;
         this.fts9.textColor = StaticValue.GREEN;
         this.fts9.width = 110;
         this.fts9.height = 20;
         this.fts9.htmlText = LanResManager.getLanCommonTextWords("巨龙之牙");
         this.fts9.visible = false;
         addChild(this.fts9);
         ToolTips.createToolTips(this.fts9,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("毒刺：拥有坚硬的外壳，外面裹着剧毒，人物可自己召唤巨龙之牙。") + "<br>" + LanResManager.getLanCommonTextWords("巨龙毒刺：攻击时有几率触发巨龙毒刺，持续10秒；在此状态下，每次受到对手的攻击时，") + "<br>" + LanResManager.getLanCommonTextWords("无视对手伤害，且反噬对手巨龙毒，对手在此状态下，所有属性下降至1%；所有勋章触发") + "<br>" + LanResManager.getLanCommonTextWords("几率降低至0，持续10秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkDt = new FCheckBox();
         addChild(this.checkDt);
         this.checkDt.x = 60 + 80 - 25;
         this.checkDt.y = 165;
         this.checkDt.addEventListener(MouseEvent.CLICK,this.onCheckClick);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.check:
               this.checkDt.selectState = false;
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check.selectState,8]));
               break;
            case this.checkHz:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkHz.selectState,96]));
               break;
            case this.checkHz2:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkHz2.selectState,106]));
               break;
            case this.checkDt:
               this.check.selectState = false;
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkDt.selectState,107]));
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
            case this.shangyiyeButton:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_LIANQI_PREVIOUS_CLICK,"",this.lookingId - 1));
               break;
            case this.xiayiyeButton:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_LIANQI_NEXT_CLICK,"",this.lookingId + 1));
               break;
            case this.tishengBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_LIANQI_LINGWU_SHOW,"",this.lookingId));
               this.showTuPoPanel(true);
         }
      }
      
      private function onClick2(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_LIANQI_QINGQIU_CLICK));
      }
      
      private function onCheckTip(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.duihuan.addEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
               this.tubiao.addEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               if(param1.target == this.duihuan)
               {
                  _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("可使用金锭快速获取炼") + "<br>" + LanResManager.getLanCommonTextWords("气值，点击本链接打开") + "<br>" + LanResManager.getLanCommonTextWords("炼气获取界面") + "</font></textformat>";
                  this.showTip(_loc2_);
               }
               else
               {
                  _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("神秘技能，") + "<br>" + LanResManager.getLanCommonTextWords("暂不开放。") + "</font></textformat>";
                  this.showTip(_loc2_);
               }
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.duihuan.removeEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
               this.tubiao.removeEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
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
      
      public function set setParent(param1:DisplayObject) : void
      {
         this.$parent = param1;
         this.lianqiTupo._parent2 = param1;
         this.lianqiTupo._parent3 = this;
      }
      
      public function setInitialize(param1:LianQiVO, param2:Boolean) : void
      {
         this.setBg(param1.lookID);
         this.setHuoQu(param1.mapName,param1.monsterName,param1.monsterNum);
         this.setShuxingJiacheng(param1.hp,param1.maxHp,param1.sb,param1.maxSb,param1.act,param1.maxAct,param1.def,param1.maxDef,param1.bj,param1.maxBj,param1.mp,param1.maxMp);
         this.setZhaoShiMsg(param1.lianQiNum,param1.lookName,param1.lookID,param1.nowID);
         this.setJihuo(param2);
         this.check.selectState = param1.fenghuangdouxuan;
         this.checkHz.selectState = param1.isHuanZhuang;
         this.checkHz2.selectState = param1.isHuanZhuang2;
         this.checkDt.selectState = param1.isDanTian;
      }
      
      public function set avatar(param1:BitmapData) : void
      {
         this._avatar.bitmapData = param1;
         if(!param1)
         {
            return;
         }
         this._avatar.x = 100 - this._avatar.width / 2 + 35 + 8 - 6 + 65 - 3;
         this._avatar.y = 110 - this._avatar.height + 40 + 13 + 21 + 7 - 20;
      }
      
      private function setBg(param1:int) : void
      {
         var mcId:int = 0;
         var loadUrl:String = null;
         var id:int = param1;
         mcId = id;
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/lianqi/" + mcId + ".swf";
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
      
      public function removeMc() : void
      {
         if(Boolean(this.bloodMc) && this.bloodMc.parent != null)
         {
            this.bloodMc.stop();
            this.bloodMc.parent.removeChild(this.bloodMc);
         }
      }
      
      public function setHuoQu(param1:String, param2:String, param3:int) : void
      {
         this.huoqu.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前需要击杀") + "</font>" + "<font color=\'" + StaticValue.PURPLE_HTML + "\'>" + param1 + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param2 + "</font>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("以获取炼气值每击杀") + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param2 + "</font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + param3 + LanResManager.getLanCommonTextWords("名") + "</font>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("增加炼气1%") + "</font>";
      }
      
      public function setShuxingJiacheng(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:int) : void
      {
         this.barBar1.setValue(param1 > param2 ? param2 : param1,param2);
         this.barBar2.setValue(param5 > param6 ? param6 : param5,param6);
         this.barBar3.setValue(param9 > param10 ? param10 : param9,param10);
         this.barBar4.setValue(param11 > param12 ? param12 : param11,param12);
         this.barBar5.setValue(param7 > param8 ? param8 : param7,param8);
         this.barBar6.setValue(param3 > param4 ? param4 : param3,param4);
         if(param10 == 0)
         {
            this.barBar3.visible = false;
            this.barBg3.visible = false;
            this.ft7.visible = false;
         }
         else
         {
            this.barBar3.visible = true;
            this.barBg3.visible = true;
            this.ft7.visible = true;
         }
         if(param4 == 0)
         {
            this.barBar6.visible = false;
            this.barBg6.visible = false;
            this.ft9.visible = false;
         }
         else
         {
            this.barBar6.visible = true;
            this.barBg6.visible = true;
            this.ft9.visible = true;
         }
      }
      
      public function setZhaoShiMsg(param1:int, param2:String, param3:int, param4:int = -1) : void
      {
         if(param1 == 100 && this.isShowDuiHuan())
         {
            this.closeDuiHuan();
         }
         this.cengshu.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param2 + "</font>";
         this.barBar7.setValue(param1,100);
         this.nowId = param4;
         this.lookingId = param3;
         if(this.tupoBo)
         {
            this.shangyiyeButton.enabled = false;
            this.tishengBtn.label = LanResManager.getLanCommonTextWords("突破");
            this.tishengBtn.enabled = false;
            this.xiayiyeButton.enabled = false;
         }
         else
         {
            if(param3 <= 1)
            {
               this.shangyiyeButton.enabled = false;
            }
            else
            {
               this.shangyiyeButton.enabled = true;
            }
            if(param3 >= this.LIANQI_MAX)
            {
               this.xiayiyeButton.enabled = false;
            }
            else
            {
               this.xiayiyeButton.enabled = true;
            }
            if(param3 < param4)
            {
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("已突破");
               this.tishengBtn.enabled = false;
            }
            else if(param3 == param4)
            {
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("突破");
               if(param1 == 100)
               {
                  this.tishengBtn.enabled = true;
               }
               else
               {
                  this.tishengBtn.enabled = false;
               }
            }
            else if(param3 > param4)
            {
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("不可突破");
               this.tishengBtn.enabled = false;
            }
            if(param4 == 15)
            {
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("已突破");
               this.tishengBtn.enabled = false;
            }
         }
      }
      
      public function showTuPoPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.lianqiTupo.y == 380)
            {
               TweenMax.to(this.lianqiTupo,1,{"y":273});
               this.tupoBo = true;
               this.shangyiyeButton.enabled = false;
               this.xiayiyeButton.enabled = false;
               this.tishengBtn.enabled = false;
            }
         }
         else
         {
            if(this.lianqiTupo.y == 273)
            {
               TweenMax.to(this.lianqiTupo,1,{"y":380});
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_LIANQI_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.shangyiyeButton.enabled = true;
            this.xiayiyeButton.enabled = true;
            this.tishengBtn.enabled = true;
         }
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.lianqiTupo.y == 273)
         {
            return true;
         }
         return false;
      }
      
      public function setTupoInit(param1:String, param2:int, param3:Boolean, param4:int) : void
      {
         this.lianqiTupo.setTupoInit(param1,param2,param3,param4);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.lianqiTupo.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.lianqiTupo.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.lianqiTupo.setTuPoBtn(param1);
      }
      
      public function setEnableFun() : void
      {
         this.shangyiyeButton.enabled = false;
         this.xiayiyeButton.enabled = false;
         this.tishengBtn.enabled = false;
      }
      
      public function showPan(param1:int) : void
      {
         if(!this.lianqihuoqu)
         {
            this.lianqihuoqu = new LianQiHuoQuPanel();
            this.lianqihuoqu.$parent = this.$parent;
         }
         this.lianqihuoqu.x = (GameConfig.sceneWidth - this.lianqihuoqu.width) / 2;
         this.lianqihuoqu.y = (GameConfig.sceneHeight - this.lianqihuoqu.height) / 2;
         GameInstance.uiInstance.uiContainer.addChild(this.lianqihuoqu);
         this.lianqihuoqu.setHuoquInit(param1);
         this.lianqihuoqu.setGoods();
      }
      
      public function isShowDuiHuan() : Boolean
      {
         if(this.lianqihuoqu != null && Fun.isVisible(this.lianqihuoqu))
         {
            return true;
         }
         return false;
      }
      
      public function setDuiHuanGoods(param1:int = 0) : void
      {
         if(Boolean(this.isShowDuiHuan))
         {
            this.lianqihuoqu.setGoods();
         }
      }
      
      public function closeDuiHuan() : void
      {
         this.lianqihuoqu.onClose();
      }
      
      public function setFanbeiJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.textColor = StaticValue.GREEN;
            this.fts1.htmlText = LanResManager.getLanCommonTextWords("炼气翻倍(已激活)");
         }
         else
         {
            this.fts1.textColor = StaticValue.RED;
            this.fts1.htmlText = LanResManager.getLanCommonTextWords("炼气翻倍(未激活)");
         }
      }
      
      public function setDingjiJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts2.textColor = StaticValue.GREEN;
            this.fts2.htmlText = LanResManager.getLanCommonTextWords("炼气顶级神功(已激活)");
         }
         else
         {
            this.fts2.textColor = StaticValue.RED;
            this.fts2.htmlText = LanResManager.getLanCommonTextWords("炼气顶级神功(未激活)");
         }
      }
      
      public function setJihuo(param1:Boolean) : void
      {
         this.isMain = param1;
         if(param1)
         {
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.LIANQI_GANGQIZONGHENG_ID];
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.LIANQI_BUXIUSHENWAN_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.LIANQI_FENGHUANGJINGPO_ID])
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
            this.fts6.visible = GameState.dictMainStatus[SpecialGoodsID.LIANQI_DIANLAO_ID];
            this.suipian = GameState.dictMainStatus[SpecialGoodsID.LIANQI_LEIDIANSUIPIAN_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.LIANQI_DIANLAO_ID])
            {
               this.setSkillJiHuo(200365,true);
               this.mainSkillContainer.visible = true;
               this.kuang1.visible = true;
            }
            else
            {
               this.mainSkillContainer.visible = false;
               this.kuang1.visible = false;
            }
            this.fts7.visible = GameState.dictMainStatus[SpecialGoodsID.LIANQI_BAIMIANSHUSHENG_ID];
            this.checkHz.visible = GameState.dictMainStatus[SpecialGoodsID.LIANQI_BAIMIANSHUSHENG_ID];
            this.fts8.visible = GameState.dictMainStatus[SpecialGoodsID.LIANQI_HONGLIANXIANZI_ID];
            this.checkHz2.visible = GameState.dictMainStatus[SpecialGoodsID.LIANQI_HONGLIANXIANZI_ID];
            this.fts9.visible = GameState.dictMainStatus[SpecialGoodsID.LIANQI_JULONGZHIYA_ID];
            this.checkDt.visible = GameState.dictMainStatus[SpecialGoodsID.LIANQI_JULONGZHIYA_ID];
         }
         else
         {
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.LIANQI_GANGQIZONGHENG_ID];
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.LIANQI_BUXIUSHENWAN_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.LIANQI_FENGHUANGJINGPO_ID])
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
            this.fts6.visible = GameState.dictTargetStatus[SpecialGoodsID.LIANQI_DIANLAO_ID];
            this.suipian = GameState.dictTargetStatus[SpecialGoodsID.LIANQI_LEIDIANSUIPIAN_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.LIANQI_DIANLAO_ID])
            {
               this.setSkillJiHuo(200365,true);
               this.mainSkillContainer.visible = true;
               this.kuang1.visible = true;
            }
            else
            {
               this.mainSkillContainer.visible = false;
               this.kuang1.visible = false;
            }
            this.fts7.visible = GameState.dictTargetStatus[SpecialGoodsID.LIANQI_BAIMIANSHUSHENG_ID];
            this.checkHz.visible = GameState.dictTargetStatus[SpecialGoodsID.LIANQI_BAIMIANSHUSHENG_ID];
            this.fts8.visible = GameState.dictTargetStatus[SpecialGoodsID.LIANQI_HONGLIANXIANZI_ID];
            this.checkHz2.visible = GameState.dictTargetStatus[SpecialGoodsID.LIANQI_HONGLIANXIANZI_ID];
            this.fts9.visible = GameState.dictTargetStatus[SpecialGoodsID.LIANQI_JULONGZHIYA_ID];
            this.checkDt.visible = GameState.dictTargetStatus[SpecialGoodsID.LIANQI_JULONGZHIYA_ID];
         }
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         if(this.isMain)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function set_LianQi(param1:Array) : void
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
            if(_loc3_.res.position == ItemPositionRange.POSTION_LIANQI_HUPOSHENDAO)
            {
               _loc4_.x = 4 + 1;
               _loc4_.y = 4 + 1;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_LIANQI_SHENXIAN1)
            {
               _loc4_.x = 4 + 1;
               _loc4_.y = 4 + 1 - 45;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_LIANQI_SHENXIAN2)
            {
               _loc4_.x = 40 + 5;
               _loc4_.y = 4 + 1 - 45;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_LIANQI_SHENXIAN3)
            {
               _loc4_.x = 80 + 5;
               _loc4_.y = 4 + 1 - 45;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_LIANQI_SHENXIAN4)
            {
               _loc4_.x = 80 + 40 + 5;
               _loc4_.y = 4 + 1 - 45;
               this.equipContainers.addChild(_loc4_);
            }
            _loc2_++;
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
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DINGCHANJUE_SKILL_DRAG,"",this.currSkill));
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
         _loc3_.isLearn = 1;
         this.mainSkillItemFace = new ItemFace(_loc3_);
         this.mainSkillItemFace.showKungFuTag();
         this.mainSkillItemFace.setShowCount(false);
         this.mainSkillContainer.addChild(this.mainSkillItemFace);
      }
   }
}

