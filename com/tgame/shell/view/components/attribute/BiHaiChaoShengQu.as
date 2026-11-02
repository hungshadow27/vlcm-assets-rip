package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
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
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.bihaichaoshengqu.model.info.BiHaiChaoShengQuVo;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import gs.TweenMax;
   
   public class BiHaiChaoShengQu extends Sprite
   {
      
      public static const UI_BIHAICHAOSHENGQU_GUANBI_CLICK:String = "UI_BIHAICHAOSHENGQU_GUANBI_CLICK";
      
      private var bg:DisplayObject;
      
      private var shangyiyeButton:FSimpleButton;
      
      private var xiayiyeButton:FSimpleButton;
      
      private var cengshu:FTextArea;
      
      private var tishengBtn:SecondButton;
      
      private var shuxing:FTextArea;
      
      private var miaoshu:FTextArea;
      
      private var bihaichaoshengqu:BiHaiChaoShengQuTupoCanvas;
      
      private var _$parent:DisplayObject;
      
      public const BIHAICHAOSHENGQU_MAX:int = 9;
      
      private var nowId:int;
      
      private var lookingId:int;
      
      private var tupoBo:Boolean = false;
      
      private var bloodMc:MovieClip;
      
      private var mcObj:Array;
      
      private var bloodMcSpr:Sprite;
      
      private var kuang:Bitmap;
      
      private var jinengSpr:Sprite;
      
      private var tf:TextFormat;
      
      private var Double:FTextArea;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var txt1:FTextArea;
      
      private var txt2:FTextArea;
      
      private var tengBg:DisplayObject;
      
      private var hulu1:DisplayObject;
      
      private var hulu2:DisplayObject;
      
      private var hulu3:DisplayObject;
      
      private var hulu4:DisplayObject;
      
      private var hulu5:DisplayObject;
      
      private var hulu6:DisplayObject;
      
      private var hulu7:DisplayObject;
      
      private var huluwa1:int;
      
      private var huluwa2:int;
      
      private var huluwa3:int;
      
      private var huluwa4:int;
      
      private var huluwa5:int;
      
      private var huluwa6:int;
      
      private var huluwa7:int;
      
      private var fts3:FTextArea;
      
      private var checkSlz:FCheckBox;
      
      private var fts4:FTextArea;
      
      private var checkWq:FCheckBox;
      
      private var equipContainers:Sprite;
      
      private var kuangHD:Bitmap;
      
      private var isMain:Boolean;
      
      public function BiHaiChaoShengQu()
      {
         var $mask:Sprite;
         var box:FCanvas = null;
         var title:FTextArea = null;
         var fjjn:FTextArea = null;
         super();
         this.tf = new TextFormat();
         this.tf.align = "center";
         box = new FCanvas();
         box.skin = "box";
         addChild(box);
         box.x = 0;
         box.y = 0;
         box.width = 403;
         box.height = 366;
         box = new FCanvas();
         box.skin = "box";
         addChild(box);
         box.x = 2;
         box.y = 231 + 32 - 25;
         box.width = 400;
         box.height = 135 - 32 + 25;
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/qinlonggong/bg.swf");
         this.bg.x = 2;
         this.bg.y = 2;
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 2;
         this.bloodMcSpr.y = 2;
         addChild(this.bloodMcSpr);
         this.shangyiyeButton = new FSimpleButton();
         this.shangyiyeButton.skin = "previousButton";
         addChild(this.shangyiyeButton);
         this.shangyiyeButton.x = 240 + 50 - 45 - 16 - 116 + 37 - 10 - 30;
         this.shangyiyeButton.y = 205 + 25 - 20;
         this.shangyiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cengshu = new FTextArea();
         this.cengshu.autoSize;
         addChild(this.cengshu);
         this.cengshu.defaultTextFormat = this.tf;
         this.cengshu.background = true;
         this.cengshu.backgroundColor = 1186072;
         this.cengshu.width = 140;
         this.cengshu.height = 17;
         this.cengshu.x = 170 - 10 - 30;
         this.cengshu.y = 230 - 20;
         this.xiayiyeButton = new FSimpleButton();
         this.xiayiyeButton.skin = "nextButton";
         addChild(this.xiayiyeButton);
         this.xiayiyeButton.x = 240 + 50 - 45 - 16 + 10 + 30;
         this.xiayiyeButton.y = 205 + 25 - 20;
         this.xiayiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tishengBtn = new SecondButton();
         addChild(this.tishengBtn);
         this.tishengBtn.x = 240 + 50;
         this.tishengBtn.y = 205 + 25 - 20;
         this.tishengBtn.label = LanResManager.getLanCommonTextWords("功法提升");
         this.tishengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         title = new FTextArea();
         title.multiline = true;
         title.filters = StaticValue.filter;
         title.width = 180;
         title.height = 110;
         title.x = 24 + 50;
         title.y = 250 + 12 - 15;
         title.textColor = StaticValue.ORANGE;
         title.htmlText = "<textformat leading=\'50\'><font size = \'16\' color=\'" + StaticValue.ORANGE_RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("碧海潮生曲") + "</font></textformat>";
         addChild(title);
         this.miaoshu = new FTextArea();
         this.miaoshu.autoSize;
         addChild(this.miaoshu);
         this.miaoshu.multiline = true;
         this.miaoshu.autoSize = TextFieldAutoSize.LEFT;
         this.miaoshu.wordWrap = true;
         this.miaoshu.width = 185;
         this.miaoshu.x = 24 - 10;
         this.miaoshu.y = 270 + 12 - 15;
         this.miaoshu.htmlText = "<font  \' color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("江湖绝技，使用后，可立即解除自身大部分减益状态。纵横江湖，自在逍遥，必备神技。") + "</font>";
         this.shuxing = new FTextArea();
         this.shuxing.multiline = true;
         this.shuxing.filters = StaticValue.filter;
         this.shuxing.width = 100;
         this.shuxing.height = 110;
         this.shuxing.x = 210 + 13 + 17 - 33;
         this.shuxing.y = 250 + 20 - 8 - 8;
         this.shuxing.textColor = StaticValue.ORANGE;
         addChild(this.shuxing);
         this.txt1 = new FTextArea();
         this.txt1.x = 10;
         this.txt1.y = 10;
         this.txt1.textColor = StaticValue.RED;
         this.txt1.width = 170;
         this.txt1.height = 20;
         this.txt1.htmlText = LanResManager.getLanCommonTextWords("降龙护体（未激活）");
         addChild(this.txt1);
         ToolTips.createToolTips(this.txt1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("100%抵抗潮落泣鬼神技能") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.txt2 = new FTextArea();
         this.txt2.x = 10;
         this.txt2.y = 10;
         this.txt2.textColor = StaticValue.GREEN;
         this.txt2.width = 200;
         this.txt2.height = 20;
         this.txt2.htmlText = LanResManager.getLanCommonTextWords("降龙护体（已激活）");
         this.txt2.visible = false;
         addChild(this.txt2);
         ToolTips.createToolTips(this.txt2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.GOLD_HTML\'>" + LanResManager.getLanCommonTextWords("100%抵抗潮落泣鬼神技能") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.Double = new FTextArea();
         addChild(this.Double);
         this.Double.multiline = true;
         this.Double.autoSize = TextFieldAutoSize.CENTER;
         this.Double.wordWrap = true;
         this.Double.width = 27;
         this.Double.height = 130;
         this.Double.x = 210 + 13 + 17 + 80 - 15;
         this.Double.y = 250 + 20;
         this.Double.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>X2<br>X2<br>X2<br>X2<br>X2</font>";
         fjjn = new FTextArea();
         fjjn.multiline = true;
         fjjn.filters = StaticValue.filter;
         fjjn.width = 100;
         fjjn.height = 110;
         fjjn.x = 205 + 112 - 9 + 36 - 15;
         fjjn.y = 255 + 5 + 5 + 6 + 22;
         fjjn.textColor = StaticValue.ORANGE;
         fjjn.htmlText = "<textformat leading=\'50\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("顶级技能") + "</font></textformat>";
         addChild(fjjn);
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 325 - 2 + 33;
         this.kuang.y = 300 - 2 + 20;
         this.jinengSpr = new Sprite();
         this.jinengSpr.x = 325 + 33;
         this.jinengSpr.y = 300 + 20;
         addChild(this.jinengSpr);
         this.bihaichaoshengqu = new BiHaiChaoShengQuTupoCanvas();
         addChild(this.bihaichaoshengqu);
         this.bihaichaoshengqu.x = 138;
         this.bihaichaoshengqu.y = 0;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 410;
         $mask.y = -5;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,500,390);
            endFill();
         }
         this.bihaichaoshengqu.mask = $mask;
         addEventListener(UI_BIHAICHAOSHENGQU_GUANBI_CLICK,this.onCloseTupo);
         this.mcObj = new Array();
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 7;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.filters = StaticValue.filter;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("六指琴魔最终秘籍(已激活)");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击1600000000 防御1000000000 血量2288888888暴击 8888闪避8888 所有武功提升500层") + "<br>" + LanResManager.getLanCommonTextWords("六指琴魔最终式（特殊技能）：攻击时自身将有极高几率触发六指琴魔状态，音律缭绕，摄人心魂，") + "<br>" + LanResManager.getLanCommonTextWords("在此状态下，将可以100%无视 攻无不克勋章 的 战?天神之尊临身 特殊效果，六指琴魔状态将持续") + "<br>" + LanResManager.getLanCommonTextWords("30秒，冷却时间120秒.") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 7 + 20;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.filters = StaticValue.filter;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("夺魂琴终极激活秘籍(已激活)");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击88888888 防御68888888 血量108888888 暴击 888 闪避888 所有武功提升18层") + "<br></font>";
            return _loc1_ + "</textformat>";
         });
         this.tengBg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/bihaichaoshengqu/tengBg.swf");
         this.tengBg.x = 136;
         this.tengBg.y = 3;
         addChild(this.tengBg);
         ToolTips.createToolTips(this.tengBg,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("七宝葫芦秘籍") + "<br>" + LanResManager.getLanCommonTextWords("特殊属性：攻击 68888亿、防御60888亿、血量80888亿、所有武功提升 880000层") + "<br>" + LanResManager.getLanCommonTextWords("红娃：") + LanResManager.getLanCommonTextWords("已使用") + huluwa1 + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("橙娃：") + LanResManager.getLanCommonTextWords("已使用") + huluwa2 + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("黄娃：") + LanResManager.getLanCommonTextWords("已使用") + huluwa3 + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("绿娃：") + LanResManager.getLanCommonTextWords("已使用") + huluwa4 + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("青娃：") + LanResManager.getLanCommonTextWords("已使用") + huluwa5 + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("蓝娃 ：") + LanResManager
            .getLanCommonTextWords("已使用") + huluwa6 + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("紫娃 ：") + LanResManager.getLanCommonTextWords("已使用") + huluwa7 + LanResManager.getLanCommonTextWords("个") + "<br>" + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.hulu1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/bihaichaoshengqu/hulu1.swf");
         this.hulu1.x = 2 + 350 + 8;
         this.hulu1.y = 2 + 16 + 21;
         addChild(this.hulu1);
         ToolTips.createToolTips(this.hulu1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("红娃：") + "<br>" + LanResManager.getLanCommonTextWords("已使用") + huluwa1 + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("特殊属性：攻击36888亿、防御32888亿、血量30888亿、所有武功提升 280000层") + "<br>" + LanResManager.getLanCommonTextWords("红娃：攻击时有几率触发红娃附体，持续8秒；每次攻击都将附加红娃的力量可瞬间击退对手，") + "<br>" + LanResManager.getLanCommonTextWords("每击退一次对手将受到强大的撞击，眩晕原地3秒。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.hulu2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/bihaichaoshengqu/hulu2.swf");
         this.hulu2.x = 329;
         this.hulu2.y = 45;
         addChild(this.hulu2);
         ToolTips.createToolTips(this.hulu2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("橙娃：") + "<br>" + LanResManager.getLanCommonTextWords("已使用") + huluwa2 + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("特殊属性：攻击36888亿、防御32888亿、血量30888亿、所有武功提升 280000层") + "<br>" + LanResManager.getLanCommonTextWords("橙娃：攻击时几率触发橙娃千里眼，持续10秒；对手在此状态下，将受到千里眼的影响，双眼") + "<br>" + LanResManager.getLanCommonTextWords("无法看清任何目标，持续8秒。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.hulu3 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/bihaichaoshengqu/hulu3.swf");
         this.hulu3.x = 303;
         this.hulu3.y = 56;
         addChild(this.hulu3);
         ToolTips.createToolTips(this.hulu3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("黄娃：") + "<br>" + LanResManager.getLanCommonTextWords("已使用") + huluwa3 + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("特殊属性：攻击36888亿、防御32888亿、血量30888亿、所有武功提升 280000层") + "<br>" + LanResManager.getLanCommonTextWords("技能效果都被无效。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.hulu4 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/bihaichaoshengqu/hulu4.swf");
         this.hulu4.x = 280;
         this.hulu4.y = 2 + 16 + 21;
         addChild(this.hulu4);
         ToolTips.createToolTips(this.hulu4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("绿娃：") + "<br>" + LanResManager.getLanCommonTextWords("已使用") + huluwa4 + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("特殊属性：攻击36888亿、防御32888亿、血量30888亿、所有武功提升 280000层") + "<br>" + LanResManager.getLanCommonTextWords("绿娃：攻击时有几率触发绿娃火焰，持续8秒；对手在此状态下，每秒都将受到火焰的燃烧掉血") + "<br>" + LanResManager.getLanCommonTextWords("40%，且在火焰的效果下，对手的攻击力将直接下降至0点，无法在进行任何攻击。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.hulu5 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/bihaichaoshengqu/hulu5.swf");
         this.hulu5.x = 244;
         this.hulu5.y = 74;
         addChild(this.hulu5);
         ToolTips.createToolTips(this.hulu5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("青娃：") + "<br>" + LanResManager.getLanCommonTextWords("已使用") + huluwa5 + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("特殊属性：攻击36888亿、防御32888亿、血量30888亿、所有武功提升 280000层") + "<br>" + LanResManager.getLanCommonTextWords("青娃：攻击时有几率触发青娃吐水，持续8秒；对手在此状态下，将落入水当中，攻击速度和移") + "<br>" + LanResManager.getLanCommonTextWords("动速度下降至1点。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.hulu6 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/bihaichaoshengqu/hulu6.swf");
         this.hulu6.x = 205;
         this.hulu6.y = 27;
         addChild(this.hulu6);
         ToolTips.createToolTips(this.hulu6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("蓝娃 ：") + "<br>" + LanResManager.getLanCommonTextWords("已使用") + huluwa6 + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("特殊属性：攻击36888亿、防御32888亿、血量30888亿、所有武功提升 280000层") + "<br>" + LanResManager.getLanCommonTextWords("蓝娃：攻击时有几率触发蓝娃隐身，持续8秒；在此状态下，自身将进入隐身，且在隐身状态，") + "<br>" + LanResManager.getLanCommonTextWords("每攻击一次都将造成对手致命伤，瞬间掉血60%。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.hulu7 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/bihaichaoshengqu/hulu7.swf");
         this.hulu7.x = 179;
         this.hulu7.y = 17;
         addChild(this.hulu7);
         ToolTips.createToolTips(this.hulu7,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("紫娃 ：") + "<br>" + LanResManager.getLanCommonTextWords("已使用") + huluwa7 + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("特殊属性：攻击36888亿、防御32888亿、血量30888亿、所有武功提升 280000层") + "<br>" + LanResManager.getLanCommonTextWords("紫娃：攻击时有几率触发紫娃葫芦，可将五格范围内的所有玩家灵魂都吸收至葫芦，使对手瞬") + "<br>" + LanResManager.getLanCommonTextWords("间呆滞原地无法移动，持续8秒。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 7 + 20 + 25;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 110;
         this.fts3.height = 20;
         this.fts3.htmlText = "灵神虚界";
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层" + "<br>" + "灵神虚界：激活灵神虚界的玩家，人物脚下将出现华丽外观，傲视九重天。" + "<br>" + "虚如飘渺：攻击时100%触发，虚如飘渺状态，自身被灵神守护护体，完全" + "<br>" + "无视对手所以伤害，持续10秒。且自身在此状态下，每次受到攻击都将触" + "<br>" + "发虚空状态，对手无法看清自身，且对手每次攻击自身，都会受到阵法大" + "<br>" + "神反噬，使对手每次掉血50%，且必定使对手命中虚界幻像禁武10秒。冷" + "<br>" + "却60秒。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkSlz = new FCheckBox();
         addChild(this.checkSlz);
         this.checkSlz.x = 80;
         this.checkSlz.y = 7 + 20 + 25;
         this.checkSlz.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts4 = new FTextArea();
         this.fts4.x = 10;
         this.fts4.y = 7 + 20 + 25 * 2;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 110;
         this.fts4.height = 20;
         this.fts4.htmlText = "寒光（神器）";
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：攻击12888888889000 防御10888888889000 血量13888888889000" + "<br>" + "暴击 88888闪避 88888所有武功3000000层" + "<br>" + "寒光：寒光，产于九天境界，经上古魔神耗费神之血炼制，全身散发寒气，刀光剑影，" + "<br>" + "杀人于无形，三界之外，无人能看清它的真面目。 " + "<br>" + "寒气摄心：攻击时100%触发寒气摄心，持续10秒；在此状态下，受到寒气侵蚀，瞬间" + "<br>" + "冻僵在原地，无法进行任何操作，且自身将会瞬间触发寒光护体状态，每攻击一次，" + "<br>" + "都瞬间清除自身所有负面状态，持续10秒。当对手挣脱寒气之后，立即陷入心魂蛊惑，" + "<br>" + "失去方向，且自残自身，瞬间掉血80%,持续5秒。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkWq = new FCheckBox();
         addChild(this.checkWq);
         this.checkWq.visible = false;
         this.checkWq.x = 80;
         this.checkWq.y = 7 + 20 + 25 * 2;
         this.checkWq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.equipContainers = new Sprite();
         this.equipContainers.x = 343 + 8 + 7;
         this.equipContainers.y = 12 + 30 + 135 + 13;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick00,false,30);
         addChild(this.equipContainers);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.checkSlz:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkSlz.selectState,118]));
               break;
            case this.checkWq:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkWq.selectState,117]));
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
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_BIHAICHAOSHENGQU_PREVIOUS_CLICK,"",this.lookingId - 1));
               break;
            case this.xiayiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_BIHAICHAOSHENGQU_NEXT_CLICK,"",this.lookingId + 1));
               break;
            case this.tishengBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_BIHAICHAOSHENGQU_TUPO_CLICK,"",this.lookingId));
               this.showTuPoPanel(true);
         }
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
         this.bihaichaoshengqu._parent2 = param1;
         this.bihaichaoshengqu._parent3 = this;
      }
      
      public function setinitilizeUI(param1:Boolean, param2:BiHaiChaoShengQuVo) : void
      {
         this.huluwa1 = param2.huLuWa1;
         this.huluwa2 = param2.huLuWa2;
         this.huluwa3 = param2.huLuWa3;
         this.huluwa4 = param2.huLuWa4;
         this.huluwa5 = param2.huLuWa5;
         this.huluwa6 = param2.huLuWa6;
         this.huluwa7 = param2.huLuWa7;
         this.isMain = param1;
         this.setBg(param2.nowLookingID);
         this.setShuxingJiacheng(param2.isDouble,param2.miaoshu,param2.act,param2.def,param2.hp,param2.mp,param2.tili);
         this.setZhaoShiMsg(param2.nowLookingName,param2.nowLookingID,param2.nowID);
         this.setSkill(param2.skillid,param2.isLearn);
         this.setJiHuo(param1);
         this.checkSlz.selectState = param2.isSiLingZhen;
         this.checkWq.selectState = param2.isWuQi;
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.txt2.visible = GameState.dictMainStatus[SpecialGoodsID.XIANGLONGHUTI_JIHUO_ID];
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.BIHAICHAOSHENGQU_ZUIZHONGSHI_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.BIHAICHAOSHENGQU_DUOHUNQIN_ID];
            this.tengBg.visible = GameState.dictMainStatus[SpecialGoodsID.BIHAICHAOSHENGQU_TENG_ID];
            this.hulu1.visible = GameState.dictMainStatus[SpecialGoodsID.BIHAICHAOSHENGQU_HULU1_ID];
            this.hulu2.visible = GameState.dictMainStatus[SpecialGoodsID.BIHAICHAOSHENGQU_HULU2_ID];
            this.hulu3.visible = GameState.dictMainStatus[SpecialGoodsID.BIHAICHAOSHENGQU_HULU3_ID];
            this.hulu4.visible = GameState.dictMainStatus[SpecialGoodsID.BIHAICHAOSHENGQU_HULU4_ID];
            this.hulu5.visible = GameState.dictMainStatus[SpecialGoodsID.BIHAICHAOSHENGQU_HULU5_ID];
            this.hulu6.visible = GameState.dictMainStatus[SpecialGoodsID.BIHAICHAOSHENGQU_HULU6_ID];
            this.hulu7.visible = GameState.dictMainStatus[SpecialGoodsID.BIHAICHAOSHENGQU_HULU7_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.BIHAICHAOSHENGQU_LINGSHENXUJIE_ID];
            this.checkSlz.visible = GameState.dictMainStatus[SpecialGoodsID.BIHAICHAOSHENGQU_LINGSHENXUJIE_ID];
            if(this.txt2.visible == true)
            {
               this.txt1.visible = false;
            }
         }
         else
         {
            this.txt2.visible = GameState.dictTargetStatus[SpecialGoodsID.XIANGLONGHUTI_JIHUO_ID];
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.BIHAICHAOSHENGQU_ZUIZHONGSHI_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.BIHAICHAOSHENGQU_DUOHUNQIN_ID];
            this.tengBg.visible = GameState.dictTargetStatus[SpecialGoodsID.BIHAICHAOSHENGQU_TENG_ID];
            this.hulu1.visible = GameState.dictTargetStatus[SpecialGoodsID.BIHAICHAOSHENGQU_HULU1_ID];
            this.hulu2.visible = GameState.dictTargetStatus[SpecialGoodsID.BIHAICHAOSHENGQU_HULU2_ID];
            this.hulu3.visible = GameState.dictTargetStatus[SpecialGoodsID.BIHAICHAOSHENGQU_HULU3_ID];
            this.hulu4.visible = GameState.dictTargetStatus[SpecialGoodsID.BIHAICHAOSHENGQU_HULU4_ID];
            this.hulu5.visible = GameState.dictTargetStatus[SpecialGoodsID.BIHAICHAOSHENGQU_HULU5_ID];
            this.hulu6.visible = GameState.dictTargetStatus[SpecialGoodsID.BIHAICHAOSHENGQU_HULU6_ID];
            this.hulu7.visible = GameState.dictTargetStatus[SpecialGoodsID.BIHAICHAOSHENGQU_HULU7_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.BIHAICHAOSHENGQU_LINGSHENXUJIE_ID];
            this.checkSlz.visible = GameState.dictTargetStatus[SpecialGoodsID.BIHAICHAOSHENGQU_LINGSHENXUJIE_ID];
            if(this.txt2.visible == true)
            {
               this.txt1.visible = false;
            }
         }
      }
      
      private function setBg(param1:int) : void
      {
         var mcId:int = 0;
         var loadUrl:String = null;
         var id:int = param1;
         mcId = 0;
         if(id == 1 || id == 2 || id == 3 || id == 0)
         {
            mcId = 1;
         }
         else if(id == 4 || id == 5 || id == 6)
         {
            mcId = 2;
         }
         else if(id == 7 || id == 8 || id == 9)
         {
            mcId = 3;
         }
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/bihaichaoshengqu/" + mcId + ".swf";
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
      
      public function setShuxingJiacheng(param1:Boolean, param2:String, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + param2 + "</font>";
         this.shuxing.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("人物属性加成：") + "<br>" + LanResManager.getLanCommonTextWords("攻击:") + param3 + "<br>" + LanResManager.getLanCommonTextWords("防御:") + param4 + "<br>" + LanResManager.getLanCommonTextWords("生命:") + param5 + "<br>" + LanResManager.getLanCommonTextWords("内力:") + param6 + "<br>" + LanResManager.getLanCommonTextWords("体力:") + param7 + "</font>";
         if(param1)
         {
            this.Double.visible = true;
         }
         else
         {
            this.Double.visible = false;
         }
      }
      
      public function setZhaoShiMsg(param1:String, param2:int, param3:int = -1) : void
      {
         this.cengshu.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "</font>";
         this.nowId = param3;
         this.lookingId = param2;
         if(this.tupoBo)
         {
            this.shangyiyeButton.enabled = false;
            this.tishengBtn.label = LanResManager.getLanCommonTextWords("功法提升");
            this.tishengBtn.enabled = false;
            this.xiayiyeButton.enabled = false;
         }
         else
         {
            if(param2 <= 1)
            {
               this.shangyiyeButton.enabled = false;
            }
            else
            {
               this.shangyiyeButton.enabled = true;
            }
            if(param2 >= this.BIHAICHAOSHENGQU_MAX)
            {
               this.xiayiyeButton.enabled = false;
            }
            else
            {
               this.xiayiyeButton.enabled = true;
            }
            if(param2 < param3 + 1)
            {
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("已领悟");
               this.tishengBtn.enabled = false;
            }
            else if(param2 == param3 + 1)
            {
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("功法提升");
               this.tishengBtn.enabled = true;
            }
            else if(param2 > param3 + 1)
            {
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("不可领悟");
               this.tishengBtn.enabled = false;
            }
         }
      }
      
      public function setSkill(param1:int, param2:Boolean) : void
      {
         var _loc4_:ItemFace = null;
         while(this.jinengSpr.numChildren > 0)
         {
            this.jinengSpr.removeChildAt(0);
         }
         var _loc3_:Skill = new Skill(param1);
         if(param2)
         {
            _loc3_.isLearn = 1;
         }
         else
         {
            _loc3_.isLearn = 0;
         }
         _loc4_ = new ItemFace(_loc3_);
         _loc4_.showKungFuTag();
         _loc4_.setShowCount(false);
         this.jinengSpr.addChild(_loc4_);
      }
      
      public function showTuPoPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.bihaichaoshengqu.x == 138)
            {
               TweenMax.to(this.bihaichaoshengqu,1,{"x":410});
               this.tupoBo = true;
               this.shangyiyeButton.enabled = false;
               this.xiayiyeButton.enabled = false;
               this.tishengBtn.enabled = false;
            }
         }
         else
         {
            if(this.bihaichaoshengqu.x == 410)
            {
               TweenMax.to(this.bihaichaoshengqu,1,{"x":138});
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_BIHAICHAOSHENGQU_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.shangyiyeButton.enabled = true;
            this.xiayiyeButton.enabled = true;
            this.tishengBtn.enabled = true;
            if(this.lookingId == 1)
            {
               this.shangyiyeButton.enabled = false;
            }
            if(this.lookingId >= this.BIHAICHAOSHENGQU_MAX)
            {
               this.xiayiyeButton.enabled = false;
            }
         }
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.bihaichaoshengqu.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setTupoInit(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.bihaichaoshengqu.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.bihaichaoshengqu.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.bihaichaoshengqu.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.bihaichaoshengqu.setTuPoBtn(param1);
      }
      
      public function setEnableFun() : void
      {
         this.shangyiyeButton.enabled = false;
         this.xiayiyeButton.enabled = false;
         this.tishengBtn.enabled = false;
      }
      
      private function onItemClick00(param1:MouseEvent) : void
      {
         if(this.isMain)
         {
            this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function set_BiHaiChaoShengQu(param1:Array) : void
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
            if(_loc3_.res.position == ItemPositionRange.POSTION_BIHAICHAOSHENGQU_HANGUANG)
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
            _loc2_++;
         }
      }
   }
}

