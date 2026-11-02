package com.tgame.shell.view.components.attribute
{
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
   import com.tgame.moudels.douZhuanXingYi.model.info.DouZhuanXingYiVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import gs.TweenMax;
   
   public class DouZhuanXingYi extends Sprite
   {
      
      public static const UI_DOUZHUANXINGYI_GUANBI_CLICK:String = "UI_DOUZHUANXINGYI_GUANBI_CLICK";
      
      private var bg1:DisplayObject;
      
      private var shangyiyeButton:FSimpleButton;
      
      private var xiayiyeButton:FSimpleButton;
      
      private var cengshu:FTextArea;
      
      private var tishengBtn:SecondButton;
      
      private var shuxing:FTextArea;
      
      private var fb:FTextArea;
      
      private var dingjiFt:FTextArea;
      
      private var douzhuanxingyi:DouZhuanXingYiTupoCanvas;
      
      public var _$parent:DisplayObject;
      
      public const DOUZHUANXINGYI_MAX:int = 7;
      
      private var nowId:int;
      
      private var lookingId:int;
      
      private var tupoBo:Boolean = false;
      
      private var fc1:FCanvas;
      
      private var miaoshu:FTextArea;
      
      private var kuang:Bitmap;
      
      private var jinengSpr:Sprite;
      
      private var bgSpr:Sprite;
      
      private var bg:DisplayObject;
      
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
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var fts3:FTextArea;
      
      private var fts4:FTextArea;
      
      private var fts5:FTextArea;
      
      private var molingshi:int = 0;
      
      private var checkZq1:FCheckBox;
      
      private var equipContainers:Sprite;
      
      private var kuangHD:Bitmap;
      
      private var kuangHD1:Bitmap;
      
      private var isMain:Boolean;
      
      public function DouZhuanXingYi()
      {
         var douzhuan:FTextArea;
         var fujia:FTextArea;
         var fudaijineng:FTextArea;
         var $mask:Sprite;
         super();
         this.bgSpr = new Sprite();
         addChild(this.bgSpr);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/douzhuanxingyi/bg.swf");
         this.bg.visible = true;
         this.bg.x = -1 + 4;
         this.bg.y = 1 + 4;
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
         this.bg1Spr = new Sprite();
         this.bg1Spr.x = 256 + 1 - 16 + 5 - 70 + 4;
         this.bg1Spr.y = 127 + 45 - 15 + 2 - 158 + 4;
         addChild(this.bg1Spr);
         this.bg2Spr = new Sprite();
         this.bg2Spr.x = 288 + 1 - 16 + 5 - 178 + 4;
         this.bg2Spr.y = 100 - 15 + 2 - 39 + 4;
         addChild(this.bg2Spr);
         this.bg3Spr = new Sprite();
         this.bg3Spr.x = 240 + 1 - 16 + 5 - 123 + 4;
         this.bg3Spr.y = 10 + 3 - 15 + 2 + 124 + 4;
         addChild(this.bg3Spr);
         this.bg4Spr = new Sprite();
         this.bg4Spr.x = 130 - 2 - 16 + 5 + 62 + 4;
         this.bg4Spr.y = 15 - 2 - 15 + 2 + 155 + 4;
         addChild(this.bg4Spr);
         this.bg5Spr = new Sprite();
         this.bg5Spr.x = 95 + 3 - 16 + 5 + 21 + 142 + 4;
         this.bg5Spr.y = 100 - 1 - 15 + 2 + 122 - 82 + 4;
         addChild(this.bg5Spr);
         this.bg6Spr = new Sprite();
         this.bg6Spr.x = 172 + 1 - 16 + 5 + 89 + 4;
         this.bg6Spr.y = 172 - 15 + 2 - 110 + 4;
         addChild(this.bg6Spr);
         this.bg7Spr = new Sprite();
         this.bg7Spr.x = 190 + 4 - 16 + 5 - 17 + 4;
         this.bg7Spr.y = 90 + 10 - 15 + 2 - 17 + 4;
         addChild(this.bg7Spr);
         this.shangyiyeButton = new FSimpleButton();
         this.shangyiyeButton.skin = "previousButton";
         addChild(this.shangyiyeButton);
         this.shangyiyeButton.x = 240 + 50 - 45 - 16 - 116 + 30;
         this.shangyiyeButton.y = 205 + 17 + 6 - 4;
         this.shangyiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cengshu = new FTextArea();
         this.cengshu.autoSize;
         addChild(this.cengshu);
         this.cengshu.multiline = true;
         this.cengshu.autoSize = TextFieldAutoSize.LEFT;
         this.cengshu.wordWrap = true;
         this.cengshu.width = 150;
         this.cengshu.height = 30;
         this.cengshu.x = 180 - 50 + 13 + 45;
         this.cengshu.y = 205 + 17 + 6 - 4;
         this.cengshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("第一层") + "</font>";
         this.xiayiyeButton = new FSimpleButton();
         this.xiayiyeButton.skin = "nextButton";
         addChild(this.xiayiyeButton);
         this.xiayiyeButton.x = 240 + 50 - 45 - 16 + 15;
         this.xiayiyeButton.y = 205 + 17 + 6 - 4;
         this.xiayiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tishengBtn = new SecondButton();
         addChild(this.tishengBtn);
         this.tishengBtn.x = 240 + 50;
         this.tishengBtn.y = 205 + 17 + 6 - 4;
         this.tishengBtn.label = LanResManager.getLanCommonTextWords("功法提升");
         this.tishengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         douzhuan = new FTextArea();
         addChild(douzhuan);
         douzhuan.multiline = true;
         douzhuan.autoSize = TextFieldAutoSize.CENTER;
         douzhuan.wordWrap = true;
         douzhuan.width = 150;
         douzhuan.height = 30;
         douzhuan.x = 25 - 12;
         douzhuan.y = 265 - 20 + 12 - 5;
         douzhuan.htmlText = "<font size = \'14\' color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("斗转星移") + "</font>";
         this.miaoshu = new FTextArea();
         addChild(this.miaoshu);
         this.miaoshu.multiline = true;
         this.miaoshu.autoSize = TextFieldAutoSize.CENTER;
         this.miaoshu.wordWrap = true;
         this.miaoshu.width = 160;
         this.miaoshu.height = 120;
         this.miaoshu.x = 25 - 12;
         this.miaoshu.y = 280 - 5;
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("由慕容世家家传绝学") + "</font>";
         fujia = new FTextArea();
         addChild(fujia);
         fujia.multiline = true;
         fujia.autoSize = TextFieldAutoSize.CENTER;
         fujia.wordWrap = true;
         fujia.width = 150;
         fujia.height = 30;
         fujia.x = 210 - 18;
         fujia.y = 265 - 20 + 12 - 5;
         fujia.htmlText = "<font size = \'14\' color=\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("增加属性") + "</font>";
         this.shuxing = new FTextArea();
         addChild(this.shuxing);
         this.shuxing.multiline = true;
         this.shuxing.autoSize = TextFieldAutoSize.CENTER;
         this.shuxing.wordWrap = true;
         this.shuxing.width = 190;
         this.shuxing.height = 130;
         this.shuxing.x = 210 - 18;
         this.shuxing.y = 265 + 12;
         this.shuxing.htmlText = "<textformat leading=\'1\'><font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：") + "<br>" + LanResManager.getLanCommonTextWords("防御：") + "<br>" + LanResManager.getLanCommonTextWords("生命：") + "<br>" + LanResManager.getLanCommonTextWords("内力：") + "<br>" + LanResManager.getLanCommonTextWords("体力：") + "</font></textformat>";
         this.fb = new FTextArea();
         addChild(this.fb);
         this.fb.multiline = true;
         this.fb.autoSize = TextFieldAutoSize.CENTER;
         this.fb.wordWrap = true;
         this.fb.width = 190;
         this.fb.height = 130;
         this.fb.x = 210 - 18 + 80 + 5;
         this.fb.y = 265 + 12;
         this.fb.htmlText = "<textformat leading=\'1\'><font color=\'" + StaticValue.BlUE20_HTML + "\'>X2<br>X2<br>X2<br>X2<br>X2</font></textformat>";
         this.fb.visible = false;
         fudaijineng = new FTextArea();
         addChild(fudaijineng);
         fudaijineng.multiline = true;
         fudaijineng.autoSize = TextFieldAutoSize.LEFT;
         fudaijineng.wordWrap = true;
         fudaijineng.width = 100;
         fudaijineng.height = 30;
         fudaijineng.x = 213 + 90;
         fudaijineng.y = 245 + 80;
         fudaijineng.htmlText = "<font size=\'15\' color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("附加技能") + "</font>";
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 303 + 20 - 8;
         this.kuang.y = 230 + 60 - 30 + 20;
         this.jinengSpr = new Sprite();
         this.jinengSpr.x = 303 + 20 + 1 + 1 - 8;
         this.jinengSpr.y = 292 - 30 + 20;
         addChild(this.jinengSpr);
         this.dingjiFt = new FTextArea();
         addChild(this.dingjiFt);
         this.dingjiFt.autoSize = TextFieldAutoSize.LEFT;
         this.dingjiFt.x = 247;
         this.dingjiFt.y = 15;
         this.dingjiFt.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("斗转星移顶级属性已激活") + "</font>";
         this.dingjiFt.visible = false;
         ToolTips.createToolTips(this.dingjiFt,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活顶级属性：") + "<br>" + LanResManager.getLanCommonTextWords("额外增加攻击4888888、防御3888888、血量62888888、暴击2888、闪避2888") + "<br>" + LanResManager.getLanCommonTextWords("所有武功提升十二层，并100%抵抗斗转星移技能效果。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.douzhuanxingyi = new DouZhuanXingYiTupoCanvas();
         addChild(this.douzhuanxingyi);
         this.douzhuanxingyi.x = 138;
         this.douzhuanxingyi.y = 0;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 410;
         $mask.y = -5;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,800,390);
            endFill();
         }
         this.douzhuanxingyi.mask = $mask;
         addEventListener(UI_DOUZHUANXINGYI_GUANBI_CLICK,this.onCloseTupo);
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 7;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("斗转星移最终激活秘籍（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击1600000000 防御1000000000 血量2288888888暴击 8888闪避8888 所有武功提升500层") + "<br>" + LanResManager.getLanCommonTextWords("转星移月（特殊技能）：攻击时候有较高几率触发自身BUFF状态，在转星移月状态下，将无法被攻击") + "<br>" + LanResManager.getLanCommonTextWords("和造成任何伤害，技能效果持续5秒。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 27;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 200;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("斗转星移究极激活秘籍（已激活）");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击2088888888 防御1688888888 暴击2888 闪避2888血量2088888888、所有武功提升2180层") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10 + 230;
         this.fts3.y = 27 + 10;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 200;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("魔灵反噬心法 （已激活）");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("魔灵反噬：攻击12888888889000 防御10888888889000 血量13888888889000 暴击 88888闪避88888 ") + "<br>" + LanResManager.getLanCommonTextWords("所有武功2500000层") + "<br>" + LanResManager.getLanCommonTextWords("★魔灵反噬 ——激活魔灵反噬心法且养成满后，将可激活魔灵反噬隐藏技能。不管是攻击或是") + "<br>" + LanResManager.getLanCommonTextWords("被攻击时将100%触发使对手命中魔灵反噬效果，持续10秒。不断吸噬对手的百分比掉血抵抗能力直至") + "<br>" + LanResManager.getLanCommonTextWords("为0，使对手不在有防御抵抗，受到的百分比伤害数值将达到100%的伤害，冷却60秒！") + "<br>" + LanResManager.getLanCommonTextWords("★魔灵反噬属性：激活魔灵反噬秘籍后，将开启魔灵反噬隐藏属性，可使用魔力石对该隐藏属性") + "<br>" + LanResManager.getLanCommonTextWords("进行养成，最多可养成200次。") + "<br>" + LanResManager.getLanCommonTextWords("每个增加：攻击1500亿，所有武功350000层。") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用魔力石") + molingshi + LanResManager.getLanCommonTextWords("颗") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + molingshi * 1500 + LanResManager.getLanCommonTextWords("亿，所有武功") + molingshi * 350000 + LanResManager
            .getLanCommonTextWords("层") + "<br>" + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts4 = new FTextArea();
         this.fts4.x = 10;
         this.fts4.y = 7;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 200;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("继承称号卡（已激活）");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("激活弟子斗转星移被动技，可以在跳跃状态下进行二次跳跃且获得弟子称号：铁掌水上漂。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts5 = new FTextArea();
         this.fts5.x = 10;
         this.fts5.y = 7 + 25 + 18;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 110;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("梼杌（神兽）");
         this.fts5.visible = false;
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Tấn công 6888,8 tỷ, phòng thủ 6088,8 tỷ, lượng máu 8088,8 tỷ, tầng võ tăng 880000" + "<br>" + LanResManager.getLanCommonTextWords("梼杌：上古四大凶兽之一，毛长，人面、虎足、猪口牙，尾长，十分凶猛。人物可自己骑乘。") + "<br>" + LanResManager.getLanCommonTextWords("梼杌之怨：攻击时有几率触发梼杌之怨，持续10秒；在此状态下，梼杌狂暴肆虐，撕咬对手，") + "<br>" + LanResManager.getLanCommonTextWords("对手血肉模糊，每秒掉血50%；梼杌周围其他对手无法近身，对手一旦靠近都将被梼杌怨气瞬") + "<br>" + LanResManager.getLanCommonTextWords("间击退，且受怨气禁锢无法动弹，持续10秒；自身骑乘在梼杌之上，四周被梼杌怨气包围，") + "<br>" + LanResManager.getLanCommonTextWords("在此状态下，人与梼杌合一，自身不受任何伤害。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkZq1 = new FCheckBox();
         addChild(this.checkZq1);
         this.checkZq1.visible = false;
         this.checkZq1.x = 80;
         this.checkZq1.y = 7 + 25 + 18;
         this.checkZq1.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.equipContainers = new Sprite();
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuangHD);
         this.kuangHD.x = 338;
         this.kuangHD.y = 11;
         this.kuangHD1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuangHD1);
         this.kuangHD1.x = 338;
         this.kuangHD1.y = 51;
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         addChild(this.equipContainers);
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         if(this.isMain)
         {
            this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.checkZq1:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkZq1.selectState,119]));
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
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DOUZHUANXINGYI_PREVIOUS_CLICK,"",this.lookingId - 1));
               break;
            case this.xiayiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DOUZHUANXINGYI_NEXT_CLICK,"",this.lookingId + 1));
               break;
            case this.tishengBtn:
               this.showTuPoPanel(true);
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DOUZHUANXINGYI_TUPO_CLICK,"",this.lookingId));
         }
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
         this.douzhuanxingyi._parent2 = param1;
         this.douzhuanxingyi._parent3 = this;
      }
      
      public function setInitialize(param1:Boolean, param2:DouZhuanXingYiVO) : void
      {
         this.isMain = param1;
         this.setBg(param2.nowLookingID);
         this.setShuxingJiacheng(param2.act,param2.def,param2.hp,param2.bj,param2.sb,param2.miaoshu);
         this.setGongFaTiSheng(param2.nowLookingName,param2.nowLookingID,param2.nowID);
         this.setSkill(param2.skillid,param2.isLearn);
         this.setFanBei(param2.isDouble);
         this.setDingjiShuxingJihuo(param2.isDingjiJihuo);
         this.setJiHuo(param1);
         this.checkZq1.selectState = param2.isZuoQi;
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.DOUZHUANXINGYI_ZUIZHONGJIHUO_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.DOUZHUANXINGYI_JIUJI_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.DOUZHUANXINGYI_MOLINGFANSHI_ID];
            this.molingshi = GameState.dictMainStatus[SpecialGoodsID.DOUZHUANXINGYI_MOLISHI_ID];
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.CHUANCHENG_DOUZHUANXINGYI_CHENGHAOKA_ID];
            this.fts5.visible = GameState.dictMainStatus[SpecialGoodsID.DOUZHUANXINGYI_TAOWU_ID];
            this.checkZq1.visible = GameState.dictMainStatus[SpecialGoodsID.DOUZHUANXINGYI_TAOWU_ID];
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.DOUZHUANXINGYI_ZUIZHONGJIHUO_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.DOUZHUANXINGYI_JIUJI_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.DOUZHUANXINGYI_MOLINGFANSHI_ID];
            this.molingshi = GameState.dictTargetStatus[SpecialGoodsID.DOUZHUANXINGYI_MOLISHI_ID];
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.CHUANCHENG_DOUZHUANXINGYI_CHENGHAOKA_ID];
            this.fts5.visible = GameState.dictTargetStatus[SpecialGoodsID.DOUZHUANXINGYI_TAOWU_ID];
            this.checkZq1.visible = GameState.dictTargetStatus[SpecialGoodsID.DOUZHUANXINGYI_TAOWU_ID];
         }
      }
      
      private function setBg(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < 7)
         {
            if(this["boll" + String(_loc2_ + 1)])
            {
               if(this["boll" + String(_loc2_ + 1)].parent)
               {
                  this["boll" + String(_loc2_ + 1)].parent.removeChild(this["boll" + String(_loc2_ + 1)]);
               }
            }
            this["boll" + String(_loc2_ + 1)] = null;
            if(_loc2_ < param1)
            {
               this["boll" + String(_loc2_ + 1)] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/douzhuanxingyi/" + _loc2_ + ".swf");
               this["bg" + String(_loc2_ + 1) + "Spr"].addChild(this["boll" + String(_loc2_ + 1)]);
            }
            else
            {
               this["boll" + String(_loc2_ + 1)] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/douzhuanxingyi/weijihuo.swf");
            }
            this["boll" + String(_loc2_ + 1)].visible = true;
            _loc2_++;
         }
      }
      
      public function setShuxingJiacheng(param1:int, param2:int, param3:int, param4:int, param5:int, param6:String) : void
      {
         this.shuxing.htmlText = "<textformat leading=\'1\'><font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：") + param1 + "<br>" + LanResManager.getLanCommonTextWords("防御：") + param2 + "<br>" + LanResManager.getLanCommonTextWords("生命：") + param3 + "<br>" + LanResManager.getLanCommonTextWords("内力：") + param4 + "<br>" + LanResManager.getLanCommonTextWords("体力：") + param5 + "</font></textformat>";
         this.miaoshu.htmlText = "<textformat leading=\'1\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + param6 + "</font></textformat>";
      }
      
      public function setFanBei(param1:Boolean) : void
      {
         if(param1)
         {
            this.fb.visible = true;
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
      
      public function setGongFaTiSheng(param1:String, param2:int, param3:int = -1) : void
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
            if(param2 >= this.DOUZHUANXINGYI_MAX)
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
      
      public function showTuPoPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.douzhuanxingyi.x == 138)
            {
               TweenMax.to(this.douzhuanxingyi,1,{"x":410});
               this.tupoBo = true;
               this.shangyiyeButton.enabled = false;
               this.xiayiyeButton.enabled = false;
               this.tishengBtn.enabled = false;
            }
         }
         else
         {
            if(this.douzhuanxingyi.x == 410)
            {
               TweenMax.to(this.douzhuanxingyi,1,{"x":138});
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DOUZHUANXINGYI_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.shangyiyeButton.enabled = true;
            this.xiayiyeButton.enabled = true;
            this.tishengBtn.enabled = true;
            if(this.lookingId == 1)
            {
               this.shangyiyeButton.enabled = false;
            }
            if(this.lookingId >= this.DOUZHUANXINGYI_MAX)
            {
               this.xiayiyeButton.enabled = false;
            }
         }
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.douzhuanxingyi.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setTupoInit(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.douzhuanxingyi.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.douzhuanxingyi.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.douzhuanxingyi.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.douzhuanxingyi.setTuPoBtn(param1);
      }
      
      public function setEnableFun() : void
      {
         this.shangyiyeButton.enabled = false;
         this.xiayiyeButton.enabled = false;
         this.tishengBtn.enabled = false;
      }
      
      public function setDingjiShuxingJihuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.dingjiFt.visible = true;
         }
         else
         {
            this.dingjiFt.visible = false;
         }
      }
      
      public function setDouzhuangxingyiZhuangbei(param1:Array) : void
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
            if(_loc3_.res.position == ItemPositionRange.POSTION_QIANKUNJIA)
            {
               _loc4_.x = 340;
               _loc4_.y = 13;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_20171115SHENGHUODOUZHUAN)
            {
               _loc4_.x = 340;
               _loc4_.y = 53;
               _loc4_.Select = true;
               _loc4_.isHotGoods = true;
               this.equipContainers.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
   }
}

