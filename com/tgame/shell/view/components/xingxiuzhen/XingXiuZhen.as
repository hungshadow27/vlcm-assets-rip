package com.tgame.shell.view.components.xingxiuzhen
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
   import com.tgame.moudels.xingxiuzhen.model.info.XingXiuZhenVo;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import gs.TweenMax;
   
   public class XingXiuZhen extends Sprite
   {
      
      public static const UI_XINGXIUZHEN_GUANBI_CLICK:String = "UI_XINGXIUZHEN_GUANBI_CLICK";
      
      private var bg:DisplayObject;
      
      private var shangyiyeButton:FSimpleButton;
      
      private var xiayiyeButton:FSimpleButton;
      
      private var cengshu:FTextArea;
      
      private var tishengBtn:SecondButton;
      
      private var shuomingBtn:SecondButton;
      
      private var shuxing:FTextArea;
      
      private var shuxingY:FTextArea;
      
      private var miaoshu:FTextArea;
      
      private var xingxiuzhen:XingXiuZhenTupoCanvas;
      
      private var _$parent:DisplayObject;
      
      private var bg1:DisplayObject;
      
      public const XINGXIUZHEN_MAX:int = 7;
      
      private var shuoMingCanvas:FCanvas;
      
      private var nowId:int;
      
      private var lookingId:int;
      
      private var tupoBo:Boolean = false;
      
      private var bloodMc:MovieClip;
      
      private var mcObj:Array;
      
      private var bloodMcSpr:Sprite;
      
      private var kuang:Bitmap;
      
      private var jinengSpr:Sprite;
      
      private var tf:TextFormat;
      
      private var fts1:FTextArea;
      
      private var checkDt:FCheckBox;
      
      private var fts2:FTextArea;
      
      private var checkWq:FCheckBox;
      
      private var fts3:FTextArea;
      
      private var checkZq:FCheckBox;
      
      private var fts4:FTextArea;
      
      private var fts5:FTextArea;
      
      private var qinglong:DisplayObject;
      
      private var suipian:int = 0;
      
      private var baihu:DisplayObject;
      
      private var zhuque:DisplayObject;
      
      private var xuanwu:DisplayObject;
      
      private var equipContainers:Sprite;
      
      private var kuangHD:Bitmap;
      
      private var isMain:Boolean;
      
      public function XingXiuZhen()
      {
         var fjjn:FTextArea;
         var $mask:Sprite;
         var box:FCanvas = null;
         var title:FTextArea = null;
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
         box.y = 231 + 32 - 25 - 2;
         box.width = 400;
         box.height = 135 - 32 + 25 + 2;
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/xingxiuzhen/bg.swf");
         this.bg1.x = 2;
         this.bg1.y = 2;
         addChild(this.bg1);
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/xingxiuzhen/bg1.swf");
         this.bg1.x = 2;
         this.bg1.y = 2;
         addChild(this.bg1);
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 2;
         this.bloodMcSpr.y = 2;
         addChild(this.bloodMcSpr);
         this.shangyiyeButton = new FSimpleButton();
         this.shangyiyeButton.skin = "previousButton";
         addChild(this.shangyiyeButton);
         this.shangyiyeButton.x = 240 + 50 - 45 - 16 - 116 + 37;
         this.shangyiyeButton.y = 205 + 25 - 20 + 25 - 10 - 17 + 55;
         this.shangyiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cengshu = new FTextArea();
         addChild(this.cengshu);
         this.cengshu.defaultTextFormat = this.tf;
         this.cengshu.background = true;
         this.cengshu.backgroundColor = 1186072;
         this.cengshu.width = 59;
         this.cengshu.height = 17;
         this.cengshu.x = 170;
         this.cengshu.y = 230 - 20 + 25 - 10 - 17 + 55;
         this.xiayiyeButton = new FSimpleButton();
         this.xiayiyeButton.skin = "nextButton";
         addChild(this.xiayiyeButton);
         this.xiayiyeButton.x = 240 + 50 - 45 - 16;
         this.xiayiyeButton.y = 205 + 25 - 20 + 25 - 10 - 17 + 55;
         this.xiayiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tishengBtn = new SecondButton();
         addChild(this.tishengBtn);
         this.tishengBtn.x = 240 + 50 + 33;
         this.tishengBtn.y = 205 + 25 - 20 + 25 - 10 - 17 + 50;
         this.tishengBtn.label = LanResManager.getLanCommonTextWords("功法提升");
         this.tishengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.shuoMingCanvas = new FCanvas();
         this.shuoMingCanvas.skin = "menuBg";
         this.shuoMingCanvas.width = 165;
         this.shuoMingCanvas.height = 250 - 110;
         title = new FTextArea();
         title.multiline = true;
         title.filters = StaticValue.filter;
         title.width = 100;
         title.height = 110;
         title.x = 70;
         title.y = 240 + 10;
         title.textColor = StaticValue.ORANGE;
         this.miaoshu = new FTextArea();
         this.shuoMingCanvas.addChild(this.miaoshu);
         this.miaoshu.multiline = true;
         this.miaoshu.wordWrap = true;
         this.miaoshu.width = 160;
         this.miaoshu.height = 110 + 20;
         this.miaoshu.x = 5;
         this.miaoshu.y = 5;
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("江湖绝技，使用后，可立即解除自身大部分减益状态。纵横江湖，自在逍遥，必备神技。") + "</font>";
         this.shuxing = new FTextArea();
         this.shuxing.multiline = true;
         this.shuxing.filters = StaticValue.filter;
         this.shuxing.width = 100 + 100;
         this.shuxing.height = 110;
         this.shuxing.x = 10;
         this.shuxing.y = 290;
         this.shuxing.textColor = StaticValue.ORANGE;
         addChild(this.shuxing);
         this.shuxingY = new FTextArea();
         this.shuxingY.multiline = true;
         this.shuxingY.filters = StaticValue.filter;
         this.shuxingY.width = 100 + 100;
         this.shuxingY.height = 110;
         this.shuxingY.x = 10 + 130;
         this.shuxingY.y = 290;
         this.shuxingY.textColor = StaticValue.ORANGE;
         addChild(this.shuxingY);
         fjjn = new FTextArea();
         fjjn.multiline = true;
         fjjn.filters = StaticValue.filter;
         fjjn.width = 100;
         fjjn.height = 110;
         fjjn.x = 205 + 112 - 9 + 36;
         fjjn.y = 255 + 5 + 5 + 6 + 22;
         fjjn.textColor = StaticValue.ORANGE;
         fjjn.htmlText = "<textformat leading=\'50\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("附加技能") + "</font></textformat>";
         addChild(fjjn);
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 325 - 2 + 33;
         this.kuang.y = 300 - 2 + 20;
         this.jinengSpr = new Sprite();
         this.jinengSpr.x = 325 + 33;
         this.jinengSpr.y = 300 + 20;
         addChild(this.jinengSpr);
         this.shuomingBtn = new SecondButton();
         addChild(this.shuomingBtn);
         this.shuomingBtn.x = 260;
         this.shuomingBtn.y = 315;
         this.shuomingBtn.label = LanResManager.getLanCommonTextWords("阵法说明");
         this.shuomingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.xingxiuzhen = new XingXiuZhenTupoCanvas();
         addChild(this.xingxiuzhen);
         this.xingxiuzhen.x = 138;
         this.xingxiuzhen.y = 0;
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
         this.xingxiuzhen.mask = $mask;
         addEventListener(UI_XINGXIUZHEN_GUANBI_CLICK,this.onCloseTupo);
         this.mcObj = new Array();
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 7;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("青龙图腾");
         this.fts1.visible = false;
         addChild(this.fts1);
         this.checkDt = new FCheckBox();
         addChild(this.checkDt);
         this.checkDt.visible = false;
         this.checkDt.x = 80;
         this.checkDt.y = 7;
         this.checkDt.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 7 + 25;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 80;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("悲鸣之刃");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击12888888889000 防御10888888889000 血量13888888889000") + "<br>" + LanResManager.getLanCommonTextWords("暴击 88888闪避88888所有武功3000000层") + "<br>" + LanResManager.getLanCommonTextWords("悲鸣怒吼：攻击时100%触发悲鸣怒吼，持续10秒；对手在此状态下，将瞬间被悲鸣刀威慑失") + "<br>" + LanResManager.getLanCommonTextWords("去灵魂掉血80%；且在悲鸣刀的束缚之下，只要对手移动都将瞬间被束缚无限回拉至原地，一") + "<br>" + LanResManager.getLanCommonTextWords("直循环待尽，束缚效果下的对手及无法进行任何的跳跃操作。");
            return _loc1_ + "</textformat>";
         });
         this.checkWq = new FCheckBox();
         addChild(this.checkWq);
         this.checkWq.visible = false;
         this.checkWq.x = 80;
         this.checkWq.y = 7 + 25;
         this.checkWq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 7 + 25 + 25;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 80;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("诛天兽");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特珠属性：攻击88888亿防御62888亿血量90888亿暴击 88888闪避88888 所有武功1400000层") + "<br>" + LanResManager.getLanCommonTextWords("诛天兽：乃万物之异化蜕变而成的血魔兽，血红色的躯体，凶猛的巨爪，可撕开一切。人物可自由骑乘。") + "<br>" + LanResManager.getLanCommonTextWords("血魔诛天：攻击时100%触发血魔诛天，持续10秒；在此状态下，自身每移动一步，该位置的5格范围内") + "<br>" + LanResManager.getLanCommonTextWords("的所有对手时间都将静止无法前行，持续10秒，且若对手在骑乘状态下，坐骑将受到诛天兽的恐惧之气") + "<br>" + LanResManager.getLanCommonTextWords("瞬间消失；自身每攻击对手一次时，对手都将受到血魔的囚禁之力，20秒内无法进行任何反击，且无法") + "<br>" + LanResManager.getLanCommonTextWords("使用任何效果清除该囚禁之力。");
            return _loc1_ + "</textformat>";
         });
         this.checkZq = new FCheckBox();
         addChild(this.checkZq);
         this.checkZq.x = 80;
         this.checkZq.y = 7 + 25 + 25;
         this.checkZq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts4 = new FTextArea();
         this.fts4.x = 10;
         this.fts4.y = 7 + 25 + 25 + 25;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 80;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("星宿护盾");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击10888888889000 防御8888888889000 血量12888888889000") + "<br>" + LanResManager.getLanCommonTextWords("暴击88888 闪避88888 所有武功2800000层") + "<br>" + LanResManager.getLanCommonTextWords("星宿护盾：星宿护盾拥有神明般的光芒，每次会轮动都将触发光芒特效。") + "<br>" + LanResManager.getLanCommonTextWords("星宿光环：激活星宿护盾的玩家，可自由开启获得星宿护盾状态后，开启之后，") + "<br>" + LanResManager.getLanCommonTextWords("每经过30秒以自身这中心将立即触发星宿光环，持续10秒；在此状态下自身周") + "<br>" + LanResManager.getLanCommonTextWords("围将形成一光圈瞬间清除自身所有负面状态，且人物在光环之中将立即触发无") + "<br>" + LanResManager.getLanCommonTextWords("敌。光环可抵抗城里的所有技能效果，可抵抗对手的所有攻击及技能效果。冷") + "<br>" + LanResManager.getLanCommonTextWords("却30秒。");
            return _loc1_ + "</textformat>";
         });
         this.fts5 = new FTextArea();
         this.fts5.x = 10;
         this.fts5.y = 7 + 25 + 25 + 25 + 25;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 160;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("四大星君秘籍");
         this.fts5.visible = false;
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击12888888889000 防御10888888889000 血量13888888889000") + "<br>" + LanResManager.getLanCommonTextWords("暴击 88888闪避88888   所有武功2500000层") + "<br>" + LanResManager.getLanCommonTextWords("四大星君——激活四大星君的玩家，将开启四大星君之路；双击使用青龙、白虎、") + "<br>" + LanResManager.getLanCommonTextWords("玄武、朱雀激活，激活后四大星宿君就位，开启四大星君的终极属性");
            return _loc1_ + "</textformat>";
         });
         this.qinglong = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/xingxiuzhen/qinglong.swf");
         this.qinglong.x = 290;
         this.qinglong.y = 95;
         addChild(this.qinglong);
         ToolTips.createToolTips(this.qinglong,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("青龙星君：") + "<br>" + LanResManager.getLanCommonTextWords("青龙星君就位后，可使用青龙符文对该青龙星君属性进行养成，最多可养成200次。") + "<br>" + LanResManager.getLanCommonTextWords("当青龙星君属性养成次数满200次时，可在活动中领取----青龙图腾，且朱雀、白虎、") + suipian + "<br>" + LanResManager.getLanCommonTextWords("当前为您加成攻击：") + suipian * 40000000 + "  " + LanResManager.getLanCommonTextWords("武功加层：") + suipian * 150;
            return _loc1_ + "</textformat>";
         });
         this.baihu = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/xingxiuzhen/baihu.swf");
         this.baihu.x = 290 - 20;
         this.baihu.y = 95 + 30;
         addChild(this.baihu);
         ToolTips.createToolTips(this.baihu,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("白虎星君：") + "<br>" + LanResManager.getLanCommonTextWords("白虎星君就位后，获得白虎星君专属技能；攻击时几率触发，在此状态下，白虎附体，") + "<br>" + LanResManager.getLanCommonTextWords("每次攻击无视对手防御，都能造成60%的血量伤害。持续10秒。");
            return _loc1_ + "</textformat>";
         });
         this.zhuque = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/xingxiuzhen/zhuque.swf");
         this.zhuque.x = 290 - 40;
         this.zhuque.y = 95 + 60;
         addChild(this.zhuque);
         ToolTips.createToolTips(this.zhuque,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("朱雀星君：") + "<br>" + LanResManager.getLanCommonTextWords("朱雀星君就位后，获得朱雀星君专属技能；被攻击时几率触发，在此状态下，受到朱雀星君") + "<br>" + LanResManager.getLanCommonTextWords("的庇佑，对手的所有物理伤害都将免疫，且反弹2000%的伤害给对手，持续10秒。");
            return _loc1_ + "</textformat>";
         });
         this.xuanwu = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/xingxiuzhen/xuanwu.swf");
         this.xuanwu.x = 290 - 60;
         this.xuanwu.y = 95 + 90;
         addChild(this.xuanwu);
         ToolTips.createToolTips(this.xuanwu,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("玄武星君：") + "<br>" + LanResManager.getLanCommonTextWords("玄武星君就位后，获得玄武星君专属技能；被攻击时几率触发，在此状态下，得到玄") + "<br>" + LanResManager.getLanCommonTextWords("武武装，对手的所有百分比伤害、物理伤害、技能效果都将免疫，持续30秒。");
            return _loc1_ + "</textformat>";
         });
         this.equipContainers = new Sprite();
         this.equipContainers.x = 343 + 8 - 250;
         this.equipContainers.y = 12 + 30 + 135 - 150;
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
            case this.checkWq:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkWq.selectState,140]));
               break;
            case this.checkZq:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkZq.selectState,141]));
               break;
            case this.checkDt:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkDt.selectState,142]));
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
            case this.shuomingBtn:
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
            case this.shangyiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_XINGXIUZHEN_PREVIOUS_CLICK,"",this.lookingId - 1));
               break;
            case this.xiayiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_XINGXIUZHEN_NEXT_CLICK,"",this.lookingId + 1));
               break;
            case this.tishengBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_XINGXIUZHEN_TUPO_CLICK,"",this.lookingId));
               this.showTuPoPanel(true);
         }
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
         this.xingxiuzhen._parent2 = param1;
         this.xingxiuzhen._parent3 = this;
      }
      
      public function setinitilizeUI(param1:Boolean, param2:XingXiuZhenVo) : void
      {
         this.isMain = param1;
         this.setBg(param2.nowLookingID);
         this.setShuxingJiacheng(param2.miaoshu,param2.act,param2.def,param2.hp,param2.baoji,param2.shanbi);
         this.setZhaoShiMsg(param2.nowLookingName,param2.nowLookingID,param2.nowID);
         this.setSkill(param2.skillid,param2.isLearn);
         this.setJiHuo(param1);
         this.checkZq.selectState = param2.isZuoQI;
         this.checkWq.selectState = param2.isWuQI;
         this.checkDt.selectState = param2.isDanTian;
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.XINGXIUZHEN_QINGLONGTUTENG_ID];
            this.checkDt.visible = GameState.dictMainStatus[SpecialGoodsID.XINGXIUZHEN_QINGLONGTUTENG_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.XINGXIUZHEN_ZHUTIANSHOU_ID];
            this.checkZq.visible = GameState.dictMainStatus[SpecialGoodsID.XINGXIUZHEN_ZHUTIANSHOU_ID];
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.XINGXIUZHEN_XINGXIUHUDUN_ID];
            this.fts5.visible = GameState.dictMainStatus[SpecialGoodsID.XINGXIUZHEN_SIDAXINGJUN_ID];
            this.suipian = GameState.dictMainStatus[SpecialGoodsID.XINGXIUZHEN_QINGLONGFUWEN_ID];
            this.qinglong.visible = GameState.dictMainStatus[SpecialGoodsID.XINGXIUZHEN_QINGLONG_ID];
            this.baihu.visible = GameState.dictMainStatus[SpecialGoodsID.XINGXIUZHEN_BAIHU_ID];
            this.zhuque.visible = GameState.dictMainStatus[SpecialGoodsID.XINGXIUZHEN_ZHUQUE_ID];
            this.xuanwu.visible = GameState.dictMainStatus[SpecialGoodsID.XINGXIUZHEN_XUANWU_ID];
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.XINGXIUZHEN_QINGLONGTUTENG_ID];
            this.checkDt.visible = GameState.dictTargetStatus[SpecialGoodsID.XINGXIUZHEN_QINGLONGTUTENG_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.XINGXIUZHEN_ZHUTIANSHOU_ID];
            this.checkZq.visible = GameState.dictTargetStatus[SpecialGoodsID.XINGXIUZHEN_ZHUTIANSHOU_ID];
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.XINGXIUZHEN_XINGXIUHUDUN_ID];
            this.fts5.visible = GameState.dictTargetStatus[SpecialGoodsID.XINGXIUZHEN_SIDAXINGJUN_ID];
            this.suipian = GameState.dictTargetStatus[SpecialGoodsID.XINGXIUZHEN_QINGLONGFUWEN_ID];
            this.qinglong.visible = GameState.dictTargetStatus[SpecialGoodsID.XINGXIUZHEN_QINGLONG_ID];
            this.baihu.visible = GameState.dictTargetStatus[SpecialGoodsID.XINGXIUZHEN_BAIHU_ID];
            this.zhuque.visible = GameState.dictTargetStatus[SpecialGoodsID.XINGXIUZHEN_ZHUQUE_ID];
            this.xuanwu.visible = GameState.dictTargetStatus[SpecialGoodsID.XINGXIUZHEN_XUANWU_ID];
         }
      }
      
      private function setBg(param1:int) : void
      {
         var mcId:int = 0;
         var loadUrl:String = null;
         var lookId:int = param1;
         mcId = lookId;
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/xingxiuzhen/" + mcId + ".swf";
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
      
      public function setShuxingJiacheng(param1:String, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         this.miaoshu.htmlText = "<font  color=\'" + StaticValue.YELLOW_HTML + "\'>" + param1 + "</font>";
         this.shuxing.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("人物属性加成：") + "<br>" + LanResManager.getLanCommonTextWords("攻击:") + param2 + "<br>" + LanResManager.getLanCommonTextWords("防御:") + param3 + "<br>" + LanResManager.getLanCommonTextWords("生命:") + param4 + "<br></font>";
         this.shuxingY.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'><br>" + LanResManager.getLanCommonTextWords("暴击:") + param5 + "<br>" + LanResManager.getLanCommonTextWords("闪避:") + param6 + "</font>";
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
            if(param2 >= this.XINGXIUZHEN_MAX)
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
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("星宿阵功法提升");
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
            if(this.xingxiuzhen.x == 138)
            {
               TweenMax.to(this.xingxiuzhen,1,{"x":410});
               this.tupoBo = true;
               this.shangyiyeButton.enabled = false;
               this.xiayiyeButton.enabled = false;
               this.tishengBtn.enabled = false;
            }
         }
         else
         {
            if(this.xingxiuzhen.x == 410)
            {
               TweenMax.to(this.xingxiuzhen,1,{"x":138});
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_XINGXIUZHEN_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.shangyiyeButton.enabled = true;
            this.xiayiyeButton.enabled = true;
            this.tishengBtn.enabled = true;
            if(this.lookingId == 1)
            {
               this.shangyiyeButton.enabled = false;
            }
            if(this.lookingId >= this.XINGXIUZHEN_MAX)
            {
               this.xiayiyeButton.enabled = false;
            }
         }
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.xingxiuzhen.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setTupoInit(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.xingxiuzhen.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.xingxiuzhen.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.xingxiuzhen.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.xingxiuzhen.setTuPoBtn(param1);
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
      
      public function set_XingXiuZhen(param1:Array) : void
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
            if(_loc3_.res.position == ItemPositionRange.POSTION_XINGXIUZHEN_BEIMINGZHIREN)
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
                  this.fts2.visible = true;
               }
               else
               {
                  this.checkWq.visible = false;
                  this.fts2.visible = false;
               }
            }
            _loc2_++;
         }
      }
   }
}

