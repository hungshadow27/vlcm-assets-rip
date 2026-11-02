package com.tgame.shell.view.components.attribute
{
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
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
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class JueZhanGuangMingDing extends Sprite
   {
      
      public static const UI_JUEZHANGUANGMINGDING_GUANBI_CLICK:String = "UI_JUEZHANGUANGMINGDING_GUANBI_CLICK";
      
      private var bg:DisplayObject;
      
      private var bg1:DisplayObject;
      
      private var lvli:FTextArea;
      
      private var shuxing:FTextArea;
      
      private var miaoshu:FTextArea;
      
      private var title:FTextArea;
      
      private var manjindu:FTextArea;
      
      private var chuanqi:FTextArea;
      
      private var shuomingBtn:SecondButton;
      
      private var _$parent:DisplayObject;
      
      private var bloodMc:MovieClip;
      
      private var mcObj:Array;
      
      private var bloodMcSpr:Sprite;
      
      private var chaobloodMcSpr:Sprite;
      
      private var shuoMingCanvas:FCanvas;
      
      private var tf:TextFormat;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var ZuoBiao1:Array;
      
      private var ZuoBiao2:Array;
      
      private var ZuoBiao3:Array;
      
      private var ZuoBiao4:Array;
      
      private var ZuoBiao5:Array;
      
      private var ZuoBiao6:Array;
      
      private var aaaaa:Array;
      
      private var ping:DisplayObject;
      
      private var maskSpr:Sprite;
      
      private var huangping:DisplayObject;
      
      private var hongmaskSpr:Sprite;
      
      private var hongSpr:Sprite;
      
      private var tipbo:Boolean;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var fts3:FTextArea;
      
      private var zhanShu1:Boolean;
      
      private var zhanShu2:Boolean;
      
      private var zhanShu3:Boolean;
      
      private var zhanShu4:Boolean;
      
      private var zhanShu5:Boolean;
      
      private var zhanShu6:Boolean;
      
      private var lingPai1:Boolean;
      
      private var lingPai2:Boolean;
      
      private var lingPai3:Boolean;
      
      private var lingPai4:Boolean;
      
      private var lingPai5:Boolean;
      
      private var lingPai6:Boolean;
      
      private var fts4:FTextArea;
      
      private var fts5:FTextArea;
      
      private var fts6:FTextArea;
      
      private var fts7:FTextArea;
      
      private var fts8:FTextArea;
      
      private var equipContainers:Sprite;
      
      private var isMain:Boolean;
      
      private var kuangHD:Bitmap;
      
      private var kuangSpr:Sprite;
      
      private var num51:int = 0;
      
      private var num52:int = 0;
      
      private var num53:int = 0;
      
      private var num54:int = 0;
      
      private var num55:int = 0;
      
      private var num56:int = 0;
      
      public function JueZhanGuangMingDing()
      {
         var ft:FTextArea;
         var i:int;
         var box:FCanvas = null;
         this.ZuoBiao1 = [];
         this.ZuoBiao2 = [];
         this.ZuoBiao3 = [];
         this.ZuoBiao4 = [];
         this.ZuoBiao5 = [];
         this.ZuoBiao6 = [];
         this.aaaaa = [];
         super();
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         this.tip.x = 2;
         this.tip.y = 2;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.filters = StaticValue.filter;
         this.tipCanvas.addChild(this.tip);
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
         box.y = 300 + 2;
         box.width = 400 - 1;
         box.height = 66;
         this.maskSpr = new Sprite();
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/juezhanguangmingding/bg.swf");
         this.bg.x = 2;
         this.bg.y = 2;
         this.bg.visible = false;
         addChild(this.bg);
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/juezhanguangmingding/bg1.swf");
         this.bg1.x = 2;
         this.bg1.y = 2;
         this.bg1.visible = false;
         addChild(this.bg1);
         this.ping = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/juezhanguangmingding/lanping.swf");
         this.ping.x = 58;
         this.ping.y = 56;
         this.ping.mask = this.maskSpr;
         addChild(this.ping);
         this.hongSpr = new Sprite();
         this.hongSpr.x = 0;
         this.hongSpr.y = 0;
         addChild(this.hongSpr);
         this.hongmaskSpr = new Sprite();
         this.huangping = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/juezhanguangmingding/huangping.swf");
         this.huangping.x = 58;
         this.huangping.y = 56;
         this.huangping.mask = this.hongmaskSpr;
         this.hongSpr.addChild(this.huangping);
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 0;
         this.bloodMcSpr.y = 0;
         addChild(this.bloodMcSpr);
         this.chaobloodMcSpr = new Sprite();
         this.chaobloodMcSpr.x = 0;
         this.chaobloodMcSpr.y = 0;
         addChild(this.chaobloodMcSpr);
         this.chuanqi = new FTextArea();
         this.chuanqi.x = 20;
         this.chuanqi.y = 240 + 30;
         this.chuanqi.htmlText = "<font color=\'" + StaticValue.ORANGE_RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("传奇属性") + "</font>";
         this.chuanqi.addEventListener(MouseEvent.MOUSE_OVER,this.onCheckTip);
         this.chuanqi.addEventListener(MouseEvent.MOUSE_OUT,this.onCheckTip);
         this.shuomingBtn = new SecondButton();
         addChild(this.shuomingBtn);
         this.shuomingBtn.x = 200 - 6;
         this.shuomingBtn.y = 240 + 30;
         this.shuomingBtn.label = LanResManager.getLanCommonTextWords("战斗说明");
         this.shuomingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.title = new FTextArea();
         this.title.multiline = true;
         this.title.filters = StaticValue.filter;
         this.title.width = 100;
         this.title.height = 110;
         this.title.x = 24 + 50 - 60;
         this.title.y = 250 + 12 - 15 + 23 + 40 - 3;
         this.title.textColor = StaticValue.ORANGE;
         this.title.htmlText = "<font color=\'" + StaticValue.ORANGE_RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("决战光明顶") + "</font>";
         addChild(this.title);
         this.miaoshu = new FTextArea();
         this.miaoshu.autoSize;
         addChild(this.miaoshu);
         this.miaoshu.multiline = true;
         this.miaoshu.autoSize = TextFieldAutoSize.LEFT;
         this.miaoshu.wordWrap = true;
         this.miaoshu.width = 377;
         this.miaoshu.x = 24 + 50 - 60 - 5;
         this.miaoshu.y = 288 + 7 + 24 + 5 - 3;
         this.miaoshu.htmlText = "<font size = \'12\' color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("明教中兴，教众数十万，其中人行事诡秘狠辣，终六大门派围攻光明顶。干戈已动，六大门派与五行旗及天地风雷四门开战。急需助援。") + "</font>";
         this.lvli = new FTextArea();
         this.lvli.multiline = true;
         this.lvli.filters = StaticValue.filter;
         this.lvli.wordWrap = true;
         this.lvli.width = 114;
         this.lvli.height = 187;
         this.lvli.x = 300 - 15 - 3;
         this.lvli.y = 15 - 10;
         this.lvli.visible = false;
         this.lvli.textColor = StaticValue.ORANGE;
         addChild(this.lvli);
         this.manjindu = new FTextArea();
         this.manjindu.multiline = true;
         this.manjindu.filters = StaticValue.filter;
         this.manjindu.wordWrap = true;
         this.manjindu.width = 114;
         this.manjindu.height = 187;
         this.manjindu.x = 300 - 15 - 3;
         this.manjindu.y = 15 - 10 + 172;
         this.manjindu.visible = false;
         this.manjindu.textColor = StaticValue.GREEN;
         addChild(this.manjindu);
         this.manjindu.htmlText = "<textformat leading=\'1\'><font size = \'12\' color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("张无忌杀出，连挫六门好手，化平干戈。") + "</font></textformat >";
         this.shuxing = new FTextArea();
         this.shuxing.multiline = true;
         this.shuxing.filters = StaticValue.filter;
         this.shuxing.wordWrap = true;
         this.shuxing.width = 150;
         this.shuxing.height = 187;
         this.shuxing.x = 300 - 18;
         this.shuxing.y = 180 + 6;
         this.shuxing.textColor = StaticValue.ORANGE;
         addChild(this.shuxing);
         this.shuoMingCanvas = new FCanvas();
         this.shuoMingCanvas.skin = "menuBg";
         this.shuoMingCanvas.width = 165;
         this.shuoMingCanvas.height = 250 + 30;
         this.shuoMingCanvas.visible = true;
         ft = new FTextArea();
         ft.width = 193;
         ft.height = 20;
         ft.x = -20;
         ft.y = 5;
         ft.textColor = StaticValue.YELLOW;
         ft.filters = StaticValue.filter;
         ft.defaultTextFormat = StaticValue.format;
         ft.htmlText = "<font size=\'14\'>" + LanResManager.getLanCommonTextWords("战斗说明") + "</font>";
         this.shuoMingCanvas.addChild(ft);
         ft = new FTextArea();
         ft.autoSize = TextFieldAutoSize.LEFT;
         ft.x = 8;
         ft.y = 25;
         ft.wordWrap = true;
         ft.width = 140;
         ft.textColor = StaticValue.BLUE;
         ft.filters = StaticValue.filter;
         this.shuoMingCanvas.addChild(ft);
         ft.htmlText = "<font >" + LanResManager.getLanCommonTextWords("使用“武当两极珠，华山重阳剑，丐帮长老袋，崆峒混沌印，峨眉倚天刺，万佛舍利子，可分别对不同门派增加战斗力。") + "<br><br>" + LanResManager.getLanCommonTextWords("当战斗力达到满值时，将会击破对应的明教军队。获得属性奖励。") + "<br><br>" + LanResManager.getLanCommonTextWords("当传奇完整完成后，可激活超强隐藏属性。") + "</font>";
         ft = new FTextArea();
         ft.autoSize = TextFieldAutoSize.LEFT;
         ft.x = 8;
         ft.y = 25 + 200;
         ft.wordWrap = true;
         ft.width = 140;
         ft.textColor = StaticValue.GREEN;
         ft.filters = StaticValue.filter;
         this.shuoMingCanvas.addChild(ft);
         ft.htmlText = "<font >" + LanResManager.getLanCommonTextWords("门派战斗力增强道具，可以在武学宗师宝箱中随机得到。") + "</font>";
         this.fts1 = new FTextArea();
         this.fts1.x = 90;
         this.fts1.y = 250 + 12 - 15 + 23 + 40 - 3;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("光明顶最终决战秘籍（已激活）");
         this.fts1.visible = true;
         addChild(this.fts1);
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 7;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 40;
         this.fts2.htmlText = "<font  color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("光明之巅秘谱") + "<br>" + LanResManager.getLanCommonTextWords("（已激活）") + "</font>";
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击2000000000 防御1800000000 血量2800000000 暴击2888 闪避 2888 所有武功提升2000层") + "<br>" + LanResManager.getLanCommonTextWords("光明之剑：攻击时触发光明之剑技能，剑气一出，难逃死劫。剑气将打入对手身体，游走于任督二脉之间，使对手无法防备。") + "<br>" + LanResManager.getLanCommonTextWords("命中技能的玩家每3秒都将遭受一次沉重伤害（人物总血量扣除5%），时间持续10分钟或者死亡后剑气才会从体内流出！甚是畏惧！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10 + 165;
         this.fts3.y = 7;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 170;
         this.fts3.height = 40;
         this.fts3.htmlText = "<font  color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("光明顶-血战篇") + "<br>" + LanResManager.getLanCommonTextWords("（已激活）") + "</font>";
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>";
            if(zhanShu1)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("战书-少林派（已激活）") + "<br>";
            }
            else
            {
               _loc1_ += LanResManager.getLanCommonTextWords("战书-少林派（未激活）") + "<br>";
            }
            if(lingPai1)
            {
               _loc1_ += "    " + LanResManager.getLanCommonTextWords("玩家已镶嵌 力挫少林令") + "<br>";
               _loc1_ += "    " + LanResManager.getLanCommonTextWords("攻击：30000000000  防御15000000000 血量 500000000000 所有武功提升 10000层") + "<br>";
            }
            if(zhanShu2)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("战书-崆峒派（已激活）") + "<br>";
            }
            else
            {
               _loc1_ += LanResManager.getLanCommonTextWords("战书-崆峒派（未激活）") + "<br>";
            }
            if(lingPai2)
            {
               _loc1_ += "    " + LanResManager.getLanCommonTextWords("玩家已镶嵌 大胜崆峒令") + "<br>";
               _loc1_ += "    " + LanResManager.getLanCommonTextWords("攻击：30000000000  防御15000000000 血量 500000000000 所有武功提升 10000层") + "<br>";
            }
            if(zhanShu3)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("战书-武当派（已激活）") + "<br>";
            }
            else
            {
               _loc1_ += LanResManager.getLanCommonTextWords("战书-武当派（未激活）") + "<br>";
            }
            if(lingPai3)
            {
               _loc1_ += "    " + LanResManager.getLanCommonTextWords("玩家已镶嵌 止战武当令") + "<br>";
               _loc1_ += "    " + LanResManager.getLanCommonTextWords("攻击：30000000000  防御15000000000 血量 500000000000 所有武功提升 10000层") + "<br>";
            }
            if(zhanShu4)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("战书-峨嵋派（已激活）") + "<br>";
            }
            else
            {
               _loc1_ += LanResManager.getLanCommonTextWords("战书-峨嵋派（未激活）") + "<br>";
            }
            if(lingPai4)
            {
               _loc1_ += "    " + LanResManager.getLanCommonTextWords("玩家已镶嵌 血战峨眉令") + "<br>";
               _loc1_ += "    " + LanResManager.getLanCommonTextWords("攻击：30000000000  防御15000000000 血量 500000000000 所有武功提升 10000层") + "<br>";
            }
            if(zhanShu5)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("战书-丐  帮（已激活）") + "<br>";
            }
            else
            {
               _loc1_ += LanResManager.getLanCommonTextWords("战书-丐  帮（未激活）") + "<br>";
            }
            if(lingPai5)
            {
               _loc1_ += "    " + LanResManager.getLanCommonTextWords("玩家已镶嵌 降服丐帮令") + "<br>";
               _loc1_ += "    " + LanResManager.getLanCommonTextWords("攻击：30000000000  防御15000000000 血量 500000000000 所有武功提升 10000层") + "<br>";
            }
            if(zhanShu6)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("战书-华山派（已激活）") + "<br>";
            }
            else
            {
               _loc1_ += LanResManager.getLanCommonTextWords("战书-华山派（未激活）") + "<br>";
            }
            if(lingPai6)
            {
               _loc1_ += "    " + LanResManager.getLanCommonTextWords("玩家已镶嵌 勇破华山令") + "<br>";
               _loc1_ += "    " + LanResManager.getLanCommonTextWords("攻击：30000000000  防御15000000000 血量 500000000000 所有武功提升 5000层") + "<br>";
            }
            _loc1_ += LanResManager.getLanCommonTextWords("开启血战篇章——完成六大门派战书——镶嵌六大门派战斗结果 即可获得技能：传奇之") + "<br>" + LanResManager.getLanCommonTextWords("光明顶血战神技：传奇血战 —— 攻击时，有几率触发技能，在技能BUFF状态下，可使") + "<br>" + LanResManager.getLanCommonTextWords("对手所有定身效果的勋章全部失效。并且可再此状态下。每次遭受对手攻击时，都必定") + "<br>" + LanResManager.getLanCommonTextWords("吸收50%的伤害转化为自身血量为自身进行生命恢复。技能效果持续10秒");
            return _loc1_ + "</font></textformat>";
         });
         this.fts4 = new FTextArea();
         this.fts4.x = 90 + 170;
         this.fts4.y = 250 + 12 - 15 + 23 + 40 - 3;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 170;
         this.fts4.height = 20;
         this.fts4.htmlText = "<font  color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("乾坤挪移秘技（已激活）") + "</font>";
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击：40888亿、防御38888亿、血量42888亿、所有武功提升 600000层") + "<br>" + LanResManager.getLanCommonTextWords("乾坤挪移（特殊技能）：被攻击时有几率触发乾坤挪移，5秒之内可将自身受到的负面状态全部转移") + "<br>" + LanResManager.getLanCommonTextWords("给5格范围内的其他玩家！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts5 = new FTextArea();
         this.fts5.x = 279;
         this.fts5.y = 3;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 170;
         this.fts5.height = 20;
         this.fts5.htmlText = "<font  color=\'" + StaticValue.GREEN_HTML + "\'>" + "Lục Phái Chiến" + "</font>";
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("领悟精华少林：") + num51 + "<br>" + LanResManager.getLanCommonTextWords("武功") + "：+" + num51 * 10000 + "  " + LanResManager.getLanCommonTextWords("武防") + "：+" + num51 * 10000 + "  " + LanResManager.getLanCommonTextWords("战斗力") + "：+" + num51 * 10000 + "  " + "<br>" + LanResManager.getLanCommonTextWords("领悟精华桃花：") + num52 + "<br>" + LanResManager.getLanCommonTextWords("武功") + "：+" + num52 * 10000 + "  " + LanResManager.getLanCommonTextWords("武防") + "：+" + num52 * 10000 + "  " + LanResManager.getLanCommonTextWords("战斗力") + "：+" + num52 * 10000 + "  " + "<br>" + LanResManager.getLanCommonTextWords("领悟精华华山：") + num53 + "<br>" + LanResManager.getLanCommonTextWords("武功") + "：+" + num53 * 10000 + "  " + LanResManager.getLanCommonTextWords("武防") + "：+" + num53 * 10000 + "  " + LanResManager.getLanCommonTextWords("战斗力") + "：+" + num53 * 10000 + "  " + "<br>" + LanResManager.getLanCommonTextWords("领悟精华古墓：") + num54 + "<br>" + LanResManager
            .getLanCommonTextWords("武功") + "：+" + num54 * 10000 + "  " + LanResManager.getLanCommonTextWords("武防") + "：+" + num54 * 10000 + "  " + LanResManager.getLanCommonTextWords("战斗力") + "：+" + num54 * 10000 + "  " + "<br>" + LanResManager.getLanCommonTextWords("领悟精华明教：") + num55 + "<br>" + LanResManager.getLanCommonTextWords("武功") + "：+" + num55 * 10000 + "  " + LanResManager.getLanCommonTextWords("武防") + "：+" + num55 * 10000 + "  " + LanResManager.getLanCommonTextWords("战斗力") + "：+" + num55 * 10000 + "  " + "<br>" + LanResManager.getLanCommonTextWords("领悟精华白驼：") + num56 + "<br>" + LanResManager.getLanCommonTextWords("武功") + "：+" + num56 * 10000 + "  " + LanResManager.getLanCommonTextWords("武防") + "：+" + num56 * 10000 + "  " + LanResManager.getLanCommonTextWords("战斗力") + "：+" + num56 * 10000 + "  " + "<br>" + "Lĩnh ngộ tinh hoa của từng môn phái ở bậc cao nhất sẽ nhận được hiệu quả đặc biệt như sau:" + "<br>";
            _loc1_ += num51 < 1000 ? "Thiếu Lâm Tuyệt Học: Đang cập nhật<br>" : "Thiếu Lâm Tuyệt Học : Đã lĩnh ngộ - Bậc 1" + "<br>";
            _loc1_ += num52 < 1000 ? "Đào Hoa Tuyệt Học: Đang cập nhật<br>" : "Đào Hoa Tuyệt Học : Đã lĩnh ngộ - Bậc 1" + "<br>";
            _loc1_ += num53 < 1000 ? "Hoa Sơn Tuyệt Học: Đang cập nhật<br>" : "Hoa Sơn Tuyệt Học : Đã lĩnh ngộ - Bậc 1" + "<br>";
            _loc1_ += num54 < 1000 ? "Cổ Mộ Tuyệt Học: Đang cập nhật<br>" : "Cổ Mộ Tuyệt Học : Đã lĩnh ngộ - Bậc 1" + "<br>";
            _loc1_ += num55 < 1000 ? "Minh Giáo Tuyệt Học: Đang cập nhật<br>" : "Minh Giáo Tuyệt Học : Đã lĩnh ngộ - Bậc 1" + "<br>";
            _loc1_ += num56 < 1000 ? "Bạch Đà Tuyệt Học: Đang cập nhật<br>" : "Bạch Đà Tuyệt Học : Đã lĩnh ngộ - Bậc 1" + "<br>";
            _loc1_ += "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts7 = new FTextArea();
         this.fts7.x = 270;
         this.fts7.y = 21;
         this.fts7.textColor = StaticValue.GREEN;
         this.fts7.width = 170;
         this.fts7.height = 20;
         this.fts7.htmlText = "<font  color=\'" + StaticValue.GREEN_HTML + "\'>" + new Goods(730577).res.name + "</font>";
         addChild(this.fts7);
         ToolTips.createToolTips(this.fts7,this,function():String
         {
            var _loc1_:int = int(GameState.dictMainStatus[730578]);
            var _loc2_:int = int(GameState.dictMainStatus[730579]);
            var _loc3_:int = int(GameState.dictMainStatus[730580]);
            var _loc4_:int = int(GameState.dictMainStatus[730581]);
            var _loc5_:int = int(GameState.dictMainStatus[730582]);
            var _loc6_:String = "";
            _loc6_ = _loc6_ + "<textformat leading=\'6\'>";
            _loc6_ = _loc6_ + ("<font color=\'StaticValue.WHITE_HTML\'>" + "Hoa Sơn – Luận Kiếm Kỳ I (Đã kích hoạt)" + "<br>" + "Luận Kiếm – Đông Tà : " + _loc1_ + "<br>" + "Bạo Kích: " + _loc1_ * 100000 + " - Né Tránh: " + _loc1_ * 100000 + " - Tầng Võ: " + _loc1_ * 10000 + " - Lục Chiến: " + _loc1_ * 10000 + "<br>" + "Luận Kiếm – Tây Độc : " + _loc2_ + "<br>" + "Bạo Kích: " + _loc2_ * 100000 + " - Né Tránh: " + _loc2_ * 100000 + " - Tầng Võ: " + _loc2_ * 10000 + " - Lục Chiến: " + _loc2_ * 10000 + "<br>" + "Luận Kiếm – Nam Đế :  " + _loc3_ + "<br>" + "Bạo Kích: " + _loc3_ * 100000 + " - Né Tránh: " + _loc3_ * 100000 + " - Tầng Võ: " + _loc3_ * 10000 + " - Lục Chiến: " + _loc3_ * 10000 + "<br>" + "Luận Kiếm – Bắc Cái : " + _loc4_ + "<br>" + "Bạo Kích: " + _loc4_ * 100000 + " - Né Tránh: " + _loc4_ * 100000 + " - Tầng Võ: " + _loc4_ * 10000 + " - Lục Chiến: " + _loc4_ * 10000 + "<br>" + "Luận Kiếm – Trung Thần Thông : " + _loc5_ + "<br>" + "Bạo Kích: " + _loc5_ * 100000 + " - Né Tránh: " + _loc5_ * 100000 + " - Tầng Võ: " + _loc5_ * 10000 + " - Lục Chiến: " + _loc5_ * 10000 + "<br>" + "Thu thập đủ những hồi ức năm xưa sẽ nhận được các hiệu quả đặc biệt: " + "<br>" + "Đông Tà : " + "<br>" + "Tây Độc : " + "<br>" + "Nam Đế :  " + "<br>" + "Bắc Cái :  " + "<br>" + "Trung Thần Thông : " + "</font>");
            return _loc6_ + "</textformat>";
         });
         this.fts6 = new FTextArea();
         this.fts6.x = 270;
         this.fts6.y = 39;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 170;
         this.fts6.height = 20;
         this.fts6.htmlText = "<font  color=\'" + StaticValue.GREEN_HTML + "\'>" + new Goods(730570).res.name + "</font>";
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Khi tấn công có xác suất kích hoạt kỹ năng giúp nhân vật sở hữu trạng thái Tinh Linh Trợ Chiến trong" + "<br>" + "10 giây." + "<br>" + "Trong thời gian hiệu lực Tinh Linh Trợ Chiến, bản thân đánh vào đối thủ sẽ khiến đối thủ bị phong ấn" + "<br>" + "trong 5 giây. Có thể tác dụng liên tục lên nhiều đối thủ. Thời gian chờ là 180 giây." + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts8 = new FTextArea();
         this.fts8.x = 270;
         this.fts8.y = 57;
         this.fts8.textColor = StaticValue.GREEN;
         this.fts8.width = 170;
         this.fts8.height = 20;
         this.fts8.htmlText = "Bá Kim Giáp";
         addChild(this.fts8);
         ToolTips.createToolTips(this.fts8,this,function():String
         {
            var _loc1_:int = int(GameState.dictMainStatus[733948]);
            var _loc2_:String = "";
            _loc2_ += "<textformat leading=\'6\'>";
            _loc2_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Bá Kim Giáp đã lĩnh ngộ:" + _loc1_ + "<br>" + "Tầng Võ Phòng:" + _loc1_ * 100000 + "<br>" + "Có thể nhận Võ Phòng (Bí Kíp) thông qua hoạt động ưu đãi tích lũy." + "<br>" + "Tối đa có thể lĩnh ngộ được 10.000 lần." + "</font>";
            return _loc2_ + "</textformat>";
         });
         this.kuangSpr = new Sprite();
         this.equipContainers = new Sprite();
         this.equipContainers.x = 60 - 2 - 1;
         this.equipContainers.y = 120 + 13 - 2 - 1;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         i = 0;
         while(i < 4)
         {
            this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
            this.kuangSpr.addChild(this.kuangHD);
            this.kuangHD.x = 60 + 40 * i;
            this.kuangHD.y = 120 + 13;
            i++;
         }
      }
      
      private function onCheckTip(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.chuanqi.addEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip();
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.chuanqi.removeEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
         }
      }
      
      private function showTip() : void
      {
         if(this.tipbo)
         {
            this.tip.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("完成传奇开启属性") + "<br>" + LanResManager.getLanCommonTextWords("攻击力提升：30%") + "<br>" + LanResManager.getLanCommonTextWords("防御力提升：40%") + "<br>" + LanResManager.getLanCommonTextWords("血量提升：50%") + "<br>" + LanResManager.getLanCommonTextWords("暴击提升：50%") + "<br>" + LanResManager.getLanCommonTextWords("闪避提升：50%") + "<br>" + LanResManager.getLanCommonTextWords("武功层数提升：50层") + "<br><br>" + LanResManager.getLanCommonTextWords("开启特殊称号：") + "<br></font>" + "<font size =\'16\' color=\'" + StaticValue.PURPLE50_HTML + "\'>☜" + LanResManager.getLanCommonTextWords("武林战神") + "☞</font>";
         }
         else
         {
            this.tip.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("完成传奇开启属性") + "<br></font>" + "<font  color=\'" + StaticValue.HUISE_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击力提升：30%") + "<br>" + LanResManager.getLanCommonTextWords("防御力提升：40%") + "<br>" + LanResManager.getLanCommonTextWords("血量提升：50%") + "<br>" + LanResManager.getLanCommonTextWords("暴击提升：50%") + "<br>" + LanResManager.getLanCommonTextWords("闪避提升：50%") + "<br>" + LanResManager.getLanCommonTextWords("武功层数提升：50层") + "<br><br></font>" + "<font  color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("开启特殊称号：") + "<br></font>" + "<font color=\'" + StaticValue.HUISE_HTML + "\'>☜" + LanResManager.getLanCommonTextWords("武林战神") + "☞</font>";
         }
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 5;
         this.tipCanvas.y = mouseY + 5;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
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
            this.shuoMingCanvas.y = 0;
         }
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
      }
      
      public function setinitilizeUI(param1:Boolean, param2:Object) : void
      {
         this.isMain = param1;
         this.setShuxing(param2.act,param2.def,param2.hp,param2.baoji,param2.shanbi,param2.wugong);
         this.setLvli(param2.dataArr);
         this.setJiHuo(param1);
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.kuangSpr.visible = !GameInstance.mainCharData.isDiZi;
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.GUANGMINGDINGZUIZHONGJUEZHAN_MIJI_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.JUEZHANGUANGMINGDING_GUANGMINGZHIDIAN_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.GUANGMINGDING_XUEZHANPIAN];
            this.zhanShu1 = GameState.dictMainStatus[SpecialGoodsID.ZHANSHU_SHAOLINPAI];
            this.lingPai1 = GameState.dictMainStatus[SpecialGoodsID.LICUO_SHAOLINLING];
            this.zhanShu2 = GameState.dictMainStatus[SpecialGoodsID.ZHANSHU_KONGTONGPAI];
            this.lingPai2 = GameState.dictMainStatus[SpecialGoodsID.DASHENG_KONGTONGLING];
            this.zhanShu3 = GameState.dictMainStatus[SpecialGoodsID.ZHANSHU_WUDANGPAI];
            this.lingPai3 = GameState.dictMainStatus[SpecialGoodsID.ZHIZHAN_WUDANGLING];
            this.zhanShu4 = GameState.dictMainStatus[SpecialGoodsID.ZHANSHU_EMEIPAI];
            this.lingPai4 = GameState.dictMainStatus[SpecialGoodsID.XUEZHAN_EMEILING];
            this.zhanShu5 = GameState.dictMainStatus[SpecialGoodsID.ZHANSHU_GAIBANG];
            this.lingPai5 = GameState.dictMainStatus[SpecialGoodsID.XIANGFU_GAIBANGLING];
            this.zhanShu6 = GameState.dictMainStatus[SpecialGoodsID.ZHANSHU_HUASHANPAI];
            this.lingPai6 = GameState.dictMainStatus[SpecialGoodsID.YONGPO_HUASHANLING];
            if(this.lingPai1 && this.lingPai2 && this.lingPai3 && this.lingPai4 && this.lingPai5 && this.lingPai6)
            {
               this.bg1.visible = true;
               this.bg.visible = false;
            }
            else
            {
               this.bg1.visible = false;
               this.bg.visible = true;
            }
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.JUEZHAN_GUANGMINGDINGQIANKUNNUOYI_ID];
            this.fts5.visible = GameState.dictMainStatus[729795];
            this.num51 = GameState.dictMainStatus[729796];
            this.num52 = GameState.dictMainStatus[729797];
            this.num53 = GameState.dictMainStatus[729798];
            this.num54 = GameState.dictMainStatus[729799];
            this.num55 = GameState.dictMainStatus[729800];
            this.num56 = GameState.dictMainStatus[729801];
            this.fts6.visible = GameState.dictMainStatus[730570];
            this.fts7.visible = GameState.dictMainStatus[730577];
            this.fts8.visible = GameState.dictMainStatus[733947];
         }
         else
         {
            this.kuangSpr.visible = !GameInstance.lookPlayerData.isDiZi;
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.GUANGMINGDINGZUIZHONGJUEZHAN_MIJI_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.JUEZHANGUANGMINGDING_GUANGMINGZHIDIAN_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.GUANGMINGDING_XUEZHANPIAN];
            this.zhanShu1 = GameState.dictTargetStatus[SpecialGoodsID.ZHANSHU_SHAOLINPAI];
            this.lingPai1 = GameState.dictTargetStatus[SpecialGoodsID.LICUO_SHAOLINLING];
            this.zhanShu2 = GameState.dictTargetStatus[SpecialGoodsID.ZHANSHU_KONGTONGPAI];
            this.lingPai2 = GameState.dictTargetStatus[SpecialGoodsID.DASHENG_KONGTONGLING];
            this.zhanShu3 = GameState.dictTargetStatus[SpecialGoodsID.ZHANSHU_WUDANGPAI];
            this.lingPai3 = GameState.dictTargetStatus[SpecialGoodsID.ZHIZHAN_WUDANGLING];
            this.zhanShu4 = GameState.dictTargetStatus[SpecialGoodsID.ZHANSHU_EMEIPAI];
            this.lingPai4 = GameState.dictTargetStatus[SpecialGoodsID.XUEZHAN_EMEILING];
            this.zhanShu5 = GameState.dictTargetStatus[SpecialGoodsID.ZHANSHU_GAIBANG];
            this.lingPai5 = GameState.dictTargetStatus[SpecialGoodsID.XIANGFU_GAIBANGLING];
            this.zhanShu6 = GameState.dictTargetStatus[SpecialGoodsID.ZHANSHU_HUASHANPAI];
            this.lingPai6 = GameState.dictTargetStatus[SpecialGoodsID.YONGPO_HUASHANLING];
            if(this.lingPai1 && this.lingPai2 && this.lingPai3 && this.lingPai4 && this.lingPai5 && this.lingPai6)
            {
               this.bg1.visible = true;
               this.bg.visible = false;
            }
            else
            {
               this.bg1.visible = false;
               this.bg.visible = true;
            }
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.JUEZHAN_GUANGMINGDINGQIANKUNNUOYI_ID];
            this.fts5.visible = GameState.dictTargetStatus[729795];
            this.num51 = GameState.dictTargetStatus[729796];
            this.num52 = GameState.dictTargetStatus[729797];
            this.num53 = GameState.dictTargetStatus[729798];
            this.num54 = GameState.dictTargetStatus[729799];
            this.num55 = GameState.dictTargetStatus[729800];
            this.num56 = GameState.dictTargetStatus[729801];
            this.fts6.visible = GameState.dictTargetStatus[730570];
            this.fts7.visible = GameState.dictTargetStatus[730577];
            this.fts8.visible = GameState.dictTargetStatus[733947];
         }
      }
      
      public function setShuxing(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         this.shuxing.htmlText = "<textformat leading=\'1\'><font size = \'12\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("属性增加：") + "<br>" + LanResManager.getLanCommonTextWords("攻击力：") + param1 + "<br>" + LanResManager.getLanCommonTextWords("防御力：") + param2 + "<br>" + LanResManager.getLanCommonTextWords("血量：") + param3 + "<br>" + LanResManager.getLanCommonTextWords("暴击：") + param4 + "<br>" + LanResManager.getLanCommonTextWords("闪避：") + param5 + "<br>" + LanResManager.getLanCommonTextWords("武功：") + param6 + "</font></textformat >";
      }
      
      public function setLvli(param1:Array) : void
      {
         var _loc6_:Object = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc2_:Array = [];
         var _loc3_:Array = [];
         var _loc4_:String = "";
         var _loc5_:int = 0;
         while(_loc5_ < 6)
         {
            _loc6_ = param1[_loc5_];
            _loc4_ += _loc6_.name + LanResManager.getLanCommonTextWords("战斗力：") + _loc6_.zhandouli + "<br>";
            _loc7_ = _loc6_.jindu / 50 + 1;
            if(_loc7_ > 5)
            {
               _loc7_ = 5;
            }
            _loc2_.push(_loc7_);
            _loc8_ = (_loc6_.jindu - 200) / 60;
            _loc3_.push(_loc8_);
            _loc5_++;
         }
         this.setDian(_loc2_);
         this.setchaoDian(_loc3_);
         this.lvli.htmlText = "<textformat leading=\'1\'><font size =\'12\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + _loc4_ + "</font></textformat >";
      }
      
      public function removeMc() : void
      {
         if(Boolean(this.bloodMc) && this.bloodMc.parent != null)
         {
            this.bloodMc.stop();
            this.bloodMc.parent.removeChild(this.bloodMc);
         }
      }
      
      public function setDian(param1:Array) : void
      {
         var _loc3_:DisplayObject = null;
         if(int(param1[0]) == 5 && int(param1[1]) == 5 && int(param1[2]) == 5 && int(param1[3]) == 5 && int(param1[4]) == 5 && int(param1[5]) == 5)
         {
            this.tipbo = true;
         }
         else
         {
            this.tipbo = false;
         }
         while(this.bloodMcSpr.numChildren > 0)
         {
            this.bloodMcSpr.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < 6)
         {
            if(param1[0] - _loc2_ > 0)
            {
               _loc3_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/juezhanguangmingding/liang.swf");
               _loc3_.x = 130;
               _loc3_.y = 124 - 19 * _loc2_;
               this.bloodMcSpr.addChild(_loc3_);
            }
            if(param1[1] - _loc2_ > 0)
            {
               _loc3_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/juezhanguangmingding/liang.swf");
               _loc3_.x = 145 + 16 * _loc2_;
               _loc3_.y = 133 - 9 * _loc2_;
               this.bloodMcSpr.addChild(_loc3_);
            }
            if(param1[2] - _loc2_ > 0)
            {
               _loc3_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/juezhanguangmingding/liang.swf");
               _loc3_.x = 145 + 16 * _loc2_;
               _loc3_.y = 151 + 9 * _loc2_;
               this.bloodMcSpr.addChild(_loc3_);
            }
            if(param1[3] - _loc2_ > 0)
            {
               _loc3_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/juezhanguangmingding/liang.swf");
               _loc3_.x = 130;
               _loc3_.y = 160 + 18 * _loc2_;
               this.bloodMcSpr.addChild(_loc3_);
            }
            if(param1[4] - _loc2_ > 0)
            {
               _loc3_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/juezhanguangmingding/liang.swf");
               _loc3_.x = 114 - 16 * _loc2_;
               _loc3_.y = 151 + 9 * _loc2_;
               this.bloodMcSpr.addChild(_loc3_);
            }
            if(param1[5] - _loc2_ > 0)
            {
               _loc3_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/juezhanguangmingding/liang.swf");
               _loc3_.x = 114 - 16 * _loc2_;
               _loc3_.y = 133 - 9 * _loc2_;
               this.bloodMcSpr.addChild(_loc3_);
            }
            _loc2_++;
         }
         this.maskSpr.graphics.clear();
         this.maskSpr.graphics.beginFill(0,1);
         this.maskSpr.graphics.moveTo(140,133 - 19 * (param1[0] - 1));
         this.maskSpr.graphics.lineTo(155 + 17 * (param1[1] - 1),143 - 10 * (param1[1] - 1));
         this.maskSpr.graphics.lineTo(155 + 17 * (param1[2] - 1),161 + 10 * (param1[2] - 1));
         this.maskSpr.graphics.lineTo(140,170 + 19 * (param1[3] - 1));
         this.maskSpr.graphics.lineTo(125 - 17 * (param1[4] - 1),161 + 10 * (param1[4] - 1));
         this.maskSpr.graphics.lineTo(125 - 17 * (param1[5] - 1),143 - 10 * (param1[5] - 1));
         this.maskSpr.graphics.lineTo(140,133 - 19 * (param1[0] - 1));
         this.maskSpr.graphics.endFill();
         addChild(this.maskSpr);
      }
      
      public function setchaoDian(param1:Array) : void
      {
         var _loc3_:DisplayObject = null;
         if(int(param1[0]) >= 1 && int(param1[1]) >= 1 && int(param1[2]) >= 1 && int(param1[3]) >= 1 && int(param1[4]) >= 1 && int(param1[5]) >= 1)
         {
            this.chaobloodMcSpr.visible = true;
            this.hongSpr.visible = true;
         }
         else
         {
            this.chaobloodMcSpr.visible = false;
            this.hongSpr.visible = false;
         }
         while(this.chaobloodMcSpr.numChildren > 0)
         {
            this.chaobloodMcSpr.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < 6)
         {
            if(param1[0] - _loc2_ > 0)
            {
               _loc3_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/juezhanguangmingding/huangliang.swf");
               _loc3_.x = 130;
               _loc3_.y = 124 - 19 * _loc2_;
               this.chaobloodMcSpr.addChild(_loc3_);
            }
            if(param1[1] - _loc2_ > 0)
            {
               _loc3_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/juezhanguangmingding/huangliang.swf");
               _loc3_.x = 145 + 16 * _loc2_;
               _loc3_.y = 133 - 9 * _loc2_;
               this.chaobloodMcSpr.addChild(_loc3_);
            }
            if(param1[2] - _loc2_ > 0)
            {
               _loc3_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/juezhanguangmingding/huangliang.swf");
               _loc3_.x = 145 + 16 * _loc2_;
               _loc3_.y = 151 + 9 * _loc2_;
               this.chaobloodMcSpr.addChild(_loc3_);
            }
            if(param1[3] - _loc2_ > 0)
            {
               _loc3_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/juezhanguangmingding/huangliang.swf");
               _loc3_.x = 130;
               _loc3_.y = 160 + 18 * _loc2_;
               this.chaobloodMcSpr.addChild(_loc3_);
            }
            if(param1[4] - _loc2_ > 0)
            {
               _loc3_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/juezhanguangmingding/huangliang.swf");
               _loc3_.x = 114 - 16 * _loc2_;
               _loc3_.y = 151 + 9 * _loc2_;
               this.chaobloodMcSpr.addChild(_loc3_);
            }
            if(param1[5] - _loc2_ > 0)
            {
               _loc3_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/juezhanguangmingding/huangliang.swf");
               _loc3_.x = 114 - 16 * _loc2_;
               _loc3_.y = 133 - 9 * _loc2_;
               this.chaobloodMcSpr.addChild(_loc3_);
            }
            _loc2_++;
         }
         this.hongmaskSpr.graphics.clear();
         this.hongmaskSpr.graphics.beginFill(0,1);
         this.hongmaskSpr.graphics.moveTo(140,133 - 19 * (param1[0] - 1));
         this.hongmaskSpr.graphics.lineTo(155 + 17 * (param1[1] - 1),143 - 10 * (param1[1] - 1));
         this.hongmaskSpr.graphics.lineTo(155 + 17 * (param1[2] - 1),161 + 10 * (param1[2] - 1));
         this.hongmaskSpr.graphics.lineTo(140,170 + 19 * (param1[3] - 1));
         this.hongmaskSpr.graphics.lineTo(125 - 17 * (param1[4] - 1),161 + 10 * (param1[4] - 1));
         this.hongmaskSpr.graphics.lineTo(125 - 17 * (param1[5] - 1),143 - 10 * (param1[5] - 1));
         this.hongmaskSpr.graphics.lineTo(140,133 - 19 * (param1[0] - 1));
         this.hongmaskSpr.graphics.endFill();
         addChild(this.hongmaskSpr);
      }
      
      public function setEnableFun() : void
      {
         this.shuomingBtn.enabled = false;
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         if(this.isMain)
         {
            this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function set_juezhanguangmingding(param1:Array) : void
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
            if(_loc3_.res.position == ItemPositionRange.POSTION_JUEZHANGUANGMINGDING1)
            {
               _loc4_.x = 4 + 1;
               _loc4_.y = 4 + 1;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_JUEZHANGUANGMINGDING2)
            {
               _loc4_.x = 40 + 4 + 1;
               _loc4_.y = 4 + 1;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_JUEZHANGUANGMINGDING3)
            {
               _loc4_.x = 40 + 4 + 1 + 40;
               _loc4_.y = 4 + 1;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_JUEZHANGUANGMINGDING4)
            {
               _loc4_.x = 40 + 4 + 1 + 80;
               _loc4_.y = 4 + 1;
               this.equipContainers.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
   }
}

