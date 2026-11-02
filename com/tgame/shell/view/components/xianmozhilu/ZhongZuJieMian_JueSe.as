package com.tgame.shell.view.components.xianmozhilu
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.NewSkinButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.PipeManager;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class ZhongZuJieMian_JueSe extends Sprite
   {
      
      public var _parent:DisplayObject;
      
      private var xianshiBtn:NewSkinButton;
      
      private var yincangBtn:NewSkinButton;
      
      private var yichuBtn:NewSkinButton;
      
      private var bgspr:Sprite;
      
      private var bg1:DisplayObject;
      
      private var _avatar:Bitmap;
      
      private var skillSpr:Sprite;
      
      private var p:Point;
      
      private var kuang:Bitmap;
      
      private var mainSkill:Skill;
      
      private var mainSkillItemFace:ItemFace;
      
      private var mainSkillContainer:Sprite;
      
      private var currSkill:ItemFace;
      
      private var txtZhongZu:FTextArea;
      
      private var txtXianQuMoTi:FTextArea;
      
      private var txt1:FTextArea;
      
      private var txt2:FTextArea;
      
      private var txt3:FTextArea;
      
      private var txt4:FTextArea;
      
      private var txt5:FTextArea;
      
      private var txt6:FTextArea;
      
      private var txt7:FTextArea;
      
      private var txt8:FTextArea;
      
      private var txt9:FTextArea;
      
      private var txt10:FTextArea;
      
      private var txt11:FTextArea;
      
      private var txt12:FTextArea;
      
      private var txt13:FTextArea;
      
      private var txt14:FTextArea;
      
      private var txt15:FTextArea;
      
      private var txt16:FTextArea;
      
      private var txt17:FTextArea;
      
      private var txt18:FTextArea;
      
      private var txt19:FTextArea;
      
      private var txt20:FTextArea;
      
      private var txt21:FTextArea;
      
      private var txt22:FTextArea;
      
      private var txt23:FTextArea;
      
      private var txt24:FTextArea;
      
      private var txt25:FTextArea;
      
      private var txt26:FTextArea;
      
      private var txt27:FTextArea;
      
      private var txt28:FTextArea;
      
      private var txt29:FTextArea;
      
      private var txt30:FTextArea;
      
      private var txt31:FTextArea;
      
      private var txt32:FTextArea;
      
      private var txt33:FTextArea;
      
      private var check33:FCheckBox;
      
      private var tagSpr1:Sprite;
      
      private var tagSpr2:Sprite;
      
      private var tagSpr3:Sprite;
      
      private var tagSpr4:Sprite;
      
      private var tagSpr5:Sprite;
      
      private var tagSpr6:Sprite;
      
      private var tagSpr7:Sprite;
      
      private var num32:int;
      
      private var numZhongZu:int = 0;
      
      private var tipZhongZu:String = "";
      
      private var tipXianQuMoTi:String = "";
      
      private var equipContainers:Sprite;
      
      private var kuangHD:Bitmap;
      
      public function ZhongZuJieMian_JueSe()
      {
         var bg:DisplayObject = null;
         super();
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/shuxingbg.swf");
         bg.x = 10;
         bg.y = 22;
         addChild(bg);
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/jiantou.swf");
         bg.x = 385;
         bg.y = 90;
         addChild(bg);
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/jiantou.swf");
         bg.x = 385;
         bg.y = 90 + 95;
         addChild(bg);
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/jiantou.swf");
         bg.x = 385;
         bg.y = 90 + 95 * 2;
         addChild(bg);
         this.bgspr = new Sprite();
         addChild(this.bgspr);
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/5.swf");
         this.bg1.x = 0;
         this.bg1.y = 0;
         this.bgspr.addChild(this.bg1);
         this.skillSpr = new Sprite();
         this.skillSpr.x = 375;
         addChild(this.skillSpr);
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 375;
         this.mainSkillContainer.y = -50;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp);
         this._avatar = new Bitmap();
         addChild(this._avatar);
         this.xianshiBtn = new NewSkinButton();
         this.xianshiBtn.skin = "xianshizhuanzhi_Button";
         this.xianshiBtn.x = 100 + 45;
         this.xianshiBtn.y = 280 + 70;
         this.xianshiBtn.visible = false;
         addChild(this.xianshiBtn);
         this.xianshiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.yincangBtn = new NewSkinButton();
         this.yincangBtn.skin = "yincangzhuanzhi_Button";
         this.yincangBtn.x = 100 + 45;
         this.yincangBtn.y = 280 + 70;
         addChild(this.yincangBtn);
         this.yincangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.yichuBtn = new NewSkinButton();
         this.yichuBtn.skin = "jiechuzhuanzhi_Button";
         this.yichuBtn.x = 40;
         this.yichuBtn.y = 200;
         addChild(this.yichuBtn);
         this.yichuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.yichuBtn.toolTip = "<font color=\'" + StaticValue.RED_HTML + "\'>" + "消耗道具：种族解除书*1" + "</font>";
         this.txtZhongZu = new FTextArea();
         this.txtZhongZu.x = 120;
         this.txtZhongZu.y = 70;
         this.txtZhongZu.textColor = StaticValue.GREEN;
         this.txtZhongZu.width = 60;
         this.txtZhongZu.height = 20;
         this.txtZhongZu.htmlText = "仙族内丹";
         this.txtZhongZu.visible = false;
         addChild(this.txtZhongZu);
         ToolTips.createToolTips(this.txtZhongZu,this,function():String
         {
            return tipZhongZu;
         });
         this.txtXianQuMoTi = new FTextArea();
         this.txtXianQuMoTi.x = 120;
         this.txtXianQuMoTi.y = 88;
         this.txtXianQuMoTi.textColor = StaticValue.GREEN;
         this.txtXianQuMoTi.width = 60;
         this.txtXianQuMoTi.height = 20;
         this.txtXianQuMoTi.htmlText = "仙躯";
         this.txtXianQuMoTi.visible = false;
         addChild(this.txtXianQuMoTi);
         ToolTips.createToolTips(this.txtXianQuMoTi,this,function():String
         {
            return tipXianQuMoTi;
         });
         this.txt1 = new FTextArea();
         this.txt1.x = 120;
         this.txt1.y = 106;
         this.txt1.textColor = StaticValue.GREEN;
         this.txt1.width = 60;
         this.txt1.height = 20;
         this.txt1.htmlText = "天枢（星）";
         this.txt1.visible = false;
         addChild(this.txt1);
         ToolTips.createToolTips(this.txt1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊效果：每次攻击有几率触发天枢，恢复自身的5%血量。（对仙魔转生及非转生均有效！）" + "<br>" + "特殊技能：同时拥有天枢（星）、天璇（星）、天玑（星）、天权（星）可开启北斗四星阵，" + "<br>" + "攻击时100%触发北斗四星，持续10秒；在此状态下，对手只要受到攻击必定陷入黑暗，且" + "<br>" + "无法随意跳跃；当状态结束后，对手将受到压制停留在原地5秒。冷却60秒。（对仙魔转" + "<br>" + "生及非转生均有效！）" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt2 = new FTextArea();
         this.txt2.x = 120;
         this.txt2.y = 124;
         this.txt2.textColor = StaticValue.GREEN;
         this.txt2.width = 60;
         this.txt2.height = 20;
         this.txt2.htmlText = "天璇（星）";
         this.txt2.visible = false;
         addChild(this.txt2);
         ToolTips.createToolTips(this.txt2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：激活天璇（星）增加人物全属性100%。" + "<br>" + "特殊技能：同时拥有天枢（星）、天璇（星）、天玑（星）、天权（星）可开启北斗四星阵，" + "<br>" + "攻击时100%触发北斗四星，持续10秒；在此状态下，对手只要受到攻击必定陷入黑暗，且" + "<br>" + "无法随意跳跃；当状态结束后，对手将受到压制停留在原地5秒。冷却60秒。（对仙魔转" + "<br>" + "生及非转生均有效！）" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt3 = new FTextArea();
         this.txt3.x = 120;
         this.txt3.y = 142;
         this.txt3.textColor = StaticValue.GREEN;
         this.txt3.width = 60;
         this.txt3.height = 20;
         this.txt3.htmlText = "天玑（星）";
         this.txt3.visible = false;
         addChild(this.txt3);
         ToolTips.createToolTips(this.txt3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：激活天玑（星）增加人物全战纹100%。" + "<br>" + "特殊技能：同时拥有天枢（星）、天璇（星）、天玑（星）、天权（星）可开启北斗四星阵，" + "<br>" + "攻击时100%触发北斗四星，持续10秒；在此状态下，对手只要受到攻击必定陷入黑暗，且" + "<br>" + "无法随意跳跃；当状态结束后，对手将受到压制停留在原地5秒。冷却60秒。（对仙魔转" + "<br>" + "生及非转生均有效！）" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt4 = new FTextArea();
         this.txt4.x = 120;
         this.txt4.y = 160;
         this.txt4.textColor = StaticValue.GREEN;
         this.txt4.width = 60;
         this.txt4.height = 20;
         this.txt4.htmlText = "天权（星）";
         this.txt4.visible = false;
         addChild(this.txt4);
         ToolTips.createToolTips(this.txt4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊效果：攻击时有几率触发天权，持续10秒；在此状态下，天权BUFF可加持使自身每" + "<br>" + "次血量低于50%时就恢复自身血量，且立即霸体3秒。（对仙魔转生及非转生均有效！）" + "<br>" + "特殊技能：同时拥有天枢（星）、天璇（星）、天玑（星）、天权（星）可开启北斗四星阵，" + "<br>" + "攻击时100%触发北斗四星，持续10秒；在此状态下，对手只要受到攻击必定陷入黑暗，且" + "<br>" + "无法随意跳跃；当状态结束后，对手将受到压制停留在原地5秒。冷却60秒。（对仙魔转" + "<br>" + "生及非转生均有效！）" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt5 = new FTextArea();
         this.txt5.x = 120;
         this.txt5.y = 178;
         this.txt5.textColor = StaticValue.GREEN;
         this.txt5.width = 60;
         this.txt5.height = 20;
         this.txt5.htmlText = "玉衡（星）";
         this.txt5.visible = false;
         addChild(this.txt5);
         ToolTips.createToolTips(this.txt5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：激活衡（星）增加人物全属性100%。" + "<br>" + "特殊技能：同时拥有衡（星）、开阳（星）、摇光（星）可开启北斗三星阵，被攻击时100" + "<br>" + "触发北斗三星，持续10秒；在此状态下，对手将会困在三星阵中，无处可躲，只能呆在原" + "<br>" + "地中；且在此状态下，对手每在阵中一秒，就将会失去视野且无法触发回血效果，持续5" + "<br>" + "秒。冷却60秒。（对仙魔转生及非转生均有效！）" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt6 = new FTextArea();
         this.txt6.x = 120;
         this.txt6.y = 196;
         this.txt6.textColor = StaticValue.GREEN;
         this.txt6.width = 60;
         this.txt6.height = 20;
         this.txt6.htmlText = "开阳（星）";
         this.txt6.visible = false;
         addChild(this.txt6);
         ToolTips.createToolTips(this.txt6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：激活开阳（星）增加全战纹100%。" + "<br>" + "特殊技能：同时拥有衡（星）、开阳（星）、摇光（星）可开启北斗三星阵，被攻击时100" + "<br>" + "触发北斗三星，持续10秒；在此状态下，对手将会困在三星阵中，无处可躲，只能呆在原" + "<br>" + "地中；且在此状态下，对手每在阵中一秒，就将会失去视野且无法触发回血效果，持续5" + "<br>" + "秒。冷却60秒。（对仙魔转生及非转生均有效！）" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt7 = new FTextArea();
         this.txt7.x = 120;
         this.txt7.y = 214;
         this.txt7.textColor = StaticValue.GREEN;
         this.txt7.width = 60;
         this.txt7.height = 20;
         this.txt7.htmlText = "摇光（星）";
         this.txt7.visible = false;
         addChild(this.txt7);
         ToolTips.createToolTips(this.txt7,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊效果：攻击时有几率触发摇光，持续10秒；在此状态下，每次被攻击对手都将被摇光" + "<br>" + "BUFF所牵制，失去控制无法操作，且自身在3秒内免疫所有伤害。（对仙魔转生及非转生均" + "<br>" + "有效！）" + "<br>" + "特殊技能：同时拥有衡（星）、开阳（星）、摇光（星）可开启北斗三星阵，被攻击时100" + "<br>" + "触发北斗三星，持续10秒；在此状态下，对手将会困在三星阵中，无处可躲，只能呆在原" + "<br>" + "地中；且在此状态下，对手每在阵中一秒，就将会失去视野且无法触发回血效果，持续5" + "<br>" + "秒。冷却60秒。（对仙魔转生及非转生均有效！）" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt8 = new FTextArea();
         this.txt8.x = 120;
         this.txt8.y = 232;
         this.txt8.textColor = StaticValue.GREEN;
         this.txt8.width = 60;
         this.txt8.height = 20;
         this.txt8.htmlText = "千年积木";
         this.txt8.visible = false;
         addChild(this.txt8);
         ToolTips.createToolTips(this.txt8,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊技能：战斗时100%触发千年积木技能，持续10秒；自身在此状态下将获得无敌BUFF，" + "<br>" + "同时当自身攻击对手时，对手将受到千年诅咒的BUFF，持续10秒，10秒内对手无法攻击" + "<br>" + "他人及触发BUFF，当状态解除后对手血量直接下降一半。（对仙魔转生及非转生均有效！）" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt9 = new FTextArea();
         this.txt9.x = 120;
         this.txt9.y = 250;
         this.txt9.textColor = StaticValue.GREEN;
         this.txt9.width = 60;
         this.txt9.height = 20;
         this.txt9.htmlText = "转生印";
         this.txt9.visible = false;
         addChild(this.txt9);
         ToolTips.createToolTips(this.txt9,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "转生属性：人物全属性增加100%。" + "<br>" + "特殊属性：攻击400888亿、防御320888亿、血量320888亿、所有武功提升400000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt10 = new FTextArea();
         this.txt10.x = 120;
         this.txt10.y = 268;
         this.txt10.textColor = StaticValue.GREEN;
         this.txt10.width = 60;
         this.txt10.height = 20;
         this.txt10.htmlText = "转生符";
         this.txt10.visible = false;
         addChild(this.txt10);
         ToolTips.createToolTips(this.txt10,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "转生属性：人物全战纹属性增加100%。" + "<br>" + "特殊属性：攻击400888亿、防御320888亿、血量320888亿、所有武功提升400000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt11 = new FTextArea();
         this.txt11.x = 120;
         this.txt11.y = 286;
         this.txt11.textColor = StaticValue.GREEN;
         this.txt11.width = 60;
         this.txt11.height = 20;
         this.txt11.htmlText = "东神将";
         this.txt11.visible = false;
         addChild(this.txt11);
         ToolTips.createToolTips(this.txt11,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：佩戴后增加攻击属性200%" + "<br>" + "特殊属性：攻击110888亿、防御80888亿、血量80888亿、所有武功提升400000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt12 = new FTextArea();
         this.txt12.x = 120;
         this.txt12.y = 304;
         this.txt12.textColor = StaticValue.GREEN;
         this.txt12.width = 60;
         this.txt12.height = 20;
         this.txt12.htmlText = "西神将";
         this.txt12.visible = false;
         addChild(this.txt12);
         ToolTips.createToolTips(this.txt12,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：佩戴后增加攻击属性200%" + "<br>" + "特殊属性：攻击110888亿、防御80888亿、血量80888亿、所有武功提升400000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt13 = new FTextArea();
         this.txt13.x = 120;
         this.txt13.y = 322;
         this.txt13.textColor = StaticValue.GREEN;
         this.txt13.width = 60;
         this.txt13.height = 20;
         this.txt13.htmlText = "南神将";
         this.txt13.visible = false;
         addChild(this.txt13);
         ToolTips.createToolTips(this.txt13,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：佩戴后增加攻击属性200%" + "<br>" + "特殊属性：攻击110888亿、防御80888亿、血量80888亿、所有武功提升400000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt14 = new FTextArea();
         this.txt14.x = 120;
         this.txt14.y = 340;
         this.txt14.textColor = StaticValue.GREEN;
         this.txt14.width = 60;
         this.txt14.height = 20;
         this.txt14.htmlText = "北神将";
         this.txt14.visible = false;
         addChild(this.txt14);
         ToolTips.createToolTips(this.txt14,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：佩戴后增加攻击属性200%" + "<br>" + "特殊属性：攻击110888亿、防御80888亿、血量80888亿、所有武功提升400000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt15 = new FTextArea();
         this.txt15.x = 120;
         this.txt15.y = 358;
         this.txt15.textColor = StaticValue.GREEN;
         this.txt15.width = 60;
         this.txt15.height = 20;
         this.txt15.htmlText = "中神将";
         this.txt15.visible = false;
         addChild(this.txt15);
         ToolTips.createToolTips(this.txt15,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：佩戴后增加攻击属性200%" + "<br>" + "特殊属性：攻击110888亿、防御80888亿、血量80888亿、所有武功提升400000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt16 = new FTextArea();
         this.txt16.x = 10;
         this.txt16.y = 28;
         this.txt16.textColor = StaticValue.GREEN;
         this.txt16.width = 90;
         this.txt16.height = 20;
         this.txt16.htmlText = "仙魔转职强化丹";
         this.txt16.visible = false;
         addChild(this.txt16);
         ToolTips.createToolTips(this.txt16,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "隐藏效果：服用仙魔职业丹可强化自身体魄值，全属性增加300%。" + "<br>" + "特殊技能：仙魔职业强化后，所有对手攻击的伤害都将会永久化去40%；且自身每次的攻击" + "<br>" + "将会持续加强，每次攻击都将会给对手造成额外的30%伤害效果。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt17 = new FTextArea();
         this.txt17.x = 10;
         this.txt17.y = 46;
         this.txt17.textColor = StaticValue.GREEN;
         this.txt17.width = 90;
         this.txt17.height = 20;
         this.txt17.htmlText = "天道";
         this.txt17.visible = false;
         addChild(this.txt17);
         ToolTips.createToolTips(this.txt17,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：解封六道轮回天道属性，增加全属性100%。" + "<br>" + "特殊属性：攻击200888亿、防御160888亿、血量160888亿、所有武功提升200000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt18 = new FTextArea();
         this.txt18.x = 10;
         this.txt18.y = 64;
         this.txt18.textColor = StaticValue.GREEN;
         this.txt18.width = 90;
         this.txt18.height = 20;
         this.txt18.htmlText = "人道";
         this.txt18.visible = false;
         addChild(this.txt18);
         ToolTips.createToolTips(this.txt18,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：解封六道轮回人道属性，增加全属性100%。" + "<br>" + "特殊属性：攻击200888亿、防御160888亿、血量160888亿、所有武功提升200000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt19 = new FTextArea();
         this.txt19.x = 10;
         this.txt19.y = 82;
         this.txt19.textColor = StaticValue.GREEN;
         this.txt19.width = 90;
         this.txt19.height = 20;
         this.txt19.htmlText = "畜生道";
         this.txt19.visible = false;
         addChild(this.txt19);
         ToolTips.createToolTips(this.txt19,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：解封六道轮回畜生道属性，增加全属性100%。" + "<br>" + "特殊属性：攻击200888亿、防御160888亿、血量160888亿、所有武功提升200000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt20 = new FTextArea();
         this.txt20.x = 10;
         this.txt20.y = 100;
         this.txt20.textColor = StaticValue.GREEN;
         this.txt20.width = 90;
         this.txt20.height = 20;
         this.txt20.htmlText = "阿修罗道";
         this.txt20.visible = false;
         addChild(this.txt20);
         ToolTips.createToolTips(this.txt20,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：解封六道轮回阿修罗道属性，增加全属性100%。" + "<br>" + "特殊属性：攻击200888亿、防御160888亿、血量160888亿、所有武功提升200000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt21 = new FTextArea();
         this.txt21.x = 10;
         this.txt21.y = 118;
         this.txt21.textColor = StaticValue.GREEN;
         this.txt21.width = 90;
         this.txt21.height = 20;
         this.txt21.htmlText = "饿鬼道";
         this.txt21.visible = false;
         addChild(this.txt21);
         ToolTips.createToolTips(this.txt21,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：解封六道轮回饿鬼道属性，增加全属性100%。" + "<br>" + "特殊属性：攻击200888亿、防御160888亿、血量160888亿、所有武功提升200000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt22 = new FTextArea();
         this.txt22.x = 10;
         this.txt22.y = 136;
         this.txt22.textColor = StaticValue.GREEN;
         this.txt22.width = 90;
         this.txt22.height = 20;
         this.txt22.htmlText = "地狱道";
         this.txt22.visible = false;
         addChild(this.txt22);
         ToolTips.createToolTips(this.txt16,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：解封六道轮回地狱道属性，增加全属性100%。" + "<br>" + "特殊属性：攻击200888亿、防御160888亿、血量160888亿、所有武功提升200000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt23 = new FTextArea();
         this.txt23.x = 10;
         this.txt23.y = 154;
         this.txt23.textColor = StaticValue.GREEN;
         this.txt23.width = 90;
         this.txt23.height = 20;
         this.txt23.htmlText = "风神将";
         this.txt23.visible = false;
         addChild(this.txt23);
         ToolTips.createToolTips(this.txt23,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊效果：可增加全属性200%。" + "<br>" + "特殊属性：攻击2000888亿、防御1600888亿、血量1600888亿、所有武功提升2000000" + "<br>" + "层。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt24 = new FTextArea();
         this.txt24.x = 10;
         this.txt24.y = 172;
         this.txt24.textColor = StaticValue.GREEN;
         this.txt24.width = 90;
         this.txt24.height = 20;
         this.txt24.htmlText = "雷神将";
         this.txt24.visible = false;
         addChild(this.txt24);
         ToolTips.createToolTips(this.txt24,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊效果：可增加全属性200%。" + "<br>" + "特殊属性：攻击2000888亿、防御1600888亿、血量1600888亿、所有武功提升2000000" + "<br>" + "层。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt25 = new FTextArea();
         this.txt25.x = 10;
         this.txt25.y = 190;
         this.txt25.textColor = StaticValue.GREEN;
         this.txt25.width = 90;
         this.txt25.height = 20;
         this.txt25.htmlText = "邪魔将";
         this.txt25.visible = false;
         addChild(this.txt25);
         ToolTips.createToolTips(this.txt25,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊效果：可增加全属性200%。" + "<br>" + "特殊属性：攻击2000888亿、防御1600888亿、血量1600888亿、所有武功提升2000000" + "<br>" + "层。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt26 = new FTextArea();
         this.txt26.x = 10;
         this.txt26.y = 208;
         this.txt26.textColor = StaticValue.GREEN;
         this.txt26.width = 90;
         this.txt26.height = 20;
         this.txt26.htmlText = "炎魔将";
         this.txt26.visible = false;
         addChild(this.txt26);
         ToolTips.createToolTips(this.txt26,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊效果：可增加全属性200%。" + "<br>" + "特殊属性：攻击2000888亿、防御1600888亿、血量1600888亿、所有武功提升2000000" + "<br>" + "层。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt27 = new FTextArea();
         this.txt27.x = 10;
         this.txt27.y = 346;
         this.txt27.textColor = StaticValue.GREEN;
         this.txt27.width = 90;
         this.txt27.height = 20;
         this.txt27.htmlText = "学无止境";
         this.txt27.visible = false;
         addChild(this.txt27);
         ToolTips.createToolTips(this.txt27,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：攻击2000888亿、防御1600888亿、血量1600888亿、所有武功提升2000000层" + "<br>" + "特殊属性：人物佩戴可增加全属性500%。" + "<br>" + "特殊效果：双击使用之后角色人物上方添加字体状态：“学”" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt28 = new FTextArea();
         this.txt28.x = 10;
         this.txt28.y = 364;
         this.txt28.textColor = StaticValue.GREEN;
         this.txt28.width = 90;
         this.txt28.height = 20;
         this.txt28.htmlText = "霸在坚持";
         this.txt28.visible = false;
         addChild(this.txt28);
         ToolTips.createToolTips(this.txt28,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：攻击2000888亿、防御1600888亿、血量1600888亿、所有武功提升2000000层" + "<br>" + "特殊属性：人物佩戴可增加全属性500%。" + "<br>" + "特殊效果：双击使用之后角色人物上方添加字体状态：“霸”" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt29 = new FTextArea();
         this.txt29.x = 245;
         this.txt29.y = 28;
         this.txt29.textColor = StaticValue.GREEN;
         this.txt29.width = 90;
         this.txt29.height = 20;
         this.txt29.htmlText = "凌裳石";
         this.txt29.visible = false;
         addChild(this.txt29);
         ToolTips.createToolTips(this.txt29,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "增加人物攻击属性：30000亿、防御属性：30000亿（限1500次）" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt30 = new FTextArea();
         this.txt30.x = 245;
         this.txt30.y = 46;
         this.txt30.textColor = StaticValue.GREEN;
         this.txt30.width = 90;
         this.txt30.height = 20;
         this.txt30.htmlText = "凌幽石";
         this.txt30.visible = false;
         addChild(this.txt30);
         ToolTips.createToolTips(this.txt30,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "增加人物攻击属性：30000亿、防御属性：30000亿（限1500次）" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt31 = new FTextArea();
         this.txt31.x = 245;
         this.txt31.y = 64;
         this.txt31.textColor = StaticValue.GREEN;
         this.txt31.width = 90;
         this.txt31.height = 20;
         this.txt31.htmlText = "凌阵石";
         this.txt31.visible = false;
         addChild(this.txt31);
         ToolTips.createToolTips(this.txt31,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "加人物攻击属性：30000亿、防御属性：30000亿（限1500次）" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt32 = new FTextArea();
         this.txt32.x = 245;
         this.txt32.y = 82;
         this.txt32.textColor = StaticValue.GREEN;
         this.txt32.width = 90;
         this.txt32.height = 20;
         this.txt32.htmlText = "康乃馨花束";
         this.txt32.visible = false;
         addChild(this.txt32);
         ToolTips.createToolTips(this.txt32,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "已使用：" + num32 + "<br>" + "特殊效果：每收集康乃馨花束x1可增加人物内功修为值：2000。" + "<br>" + "特殊效果：累计集齐康乃馨花束x1 可获得花灵缚，任何与自身战斗都会受到花灵的缠缚，使对手的每次攻击以及移动都会受到阻扰，" + "<br>" + "无法保持正常的行动，并不断的受到花毒麻痹神经，使对手的每次操作都瞬间被压制无法产生效果，且花灵可吞噬任何目标的灵识" + "<br>" + "并使对手受到花灵包围，期间每次锁定都将只可作用在花灵上，无法作用在其他目标，并在自身周围不断的产生花瓣，" + "<br>" + "不断的抵消周围的攻击，且自身瞬间受到遮蔽无法再被其他目标看见。持续15秒。冷却60秒。" + "<br>" + "特殊效果：累计集齐康乃馨花束x3 可增加人物全属性5000%。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt33 = new FTextArea();
         this.txt33.x = 245;
         this.txt33.y = 100;
         this.txt33.textColor = StaticValue.GREEN;
         this.txt33.width = 90;
         this.txt33.height = 20;
         this.txt33.htmlText = "无心加持卡";
         this.txt33.visible = false;
         addChild(this.txt33);
         ToolTips.createToolTips(this.txt33,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊效果：激活无心加持卡后可享受无心三大特权以及技能专属。" + "<br>" + "无心特权1：可在当日活动期间内可增加飞升经验丹以及渡劫经验丹的次数兑换增加。" + "<br>" + "无心特权2：可在当日活动期间内使用天灵兑换内功丸次数增加50次。" + "<br>" + "无心特权3：可免费领取特权专属特效外观。" + "<br>" + "无心专属：永久BUFF，只要处于战斗阶段可瞬间将周围10码内的目标全部笼罩在无心结界内，使其目标" + "<br>" + "的心神瞬间被夺取呆滞在原地，期间对手意识将会不断的沉沦，在脱离结界前无法自行摆脱困境，持续20" + "<br>" + "秒。冷却30秒。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check33 = new FCheckBox();
         addChild(this.check33);
         this.check33.x = 245 + 100;
         this.check33.y = 100;
         this.check33.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.tagSpr1 = new Sprite();
         this.tagSpr1.x = 155;
         this.tagSpr1.y = 106 - 23;
         this.tagSpr1.mouseEnabled = false;
         this.tagSpr1.visible = false;
         addChild(this.tagSpr1);
         this.tagSpr2 = new Sprite();
         this.tagSpr2.x = 155;
         this.tagSpr2.y = 124 - 23;
         this.tagSpr2.mouseEnabled = false;
         this.tagSpr2.visible = false;
         addChild(this.tagSpr2);
         this.tagSpr3 = new Sprite();
         this.tagSpr3.x = 155;
         this.tagSpr3.y = 142 - 23;
         this.tagSpr3.mouseEnabled = false;
         this.tagSpr3.visible = false;
         addChild(this.tagSpr3);
         this.tagSpr4 = new Sprite();
         this.tagSpr4.x = 155;
         this.tagSpr4.y = 160 - 23;
         this.tagSpr4.mouseEnabled = false;
         this.tagSpr4.visible = false;
         addChild(this.tagSpr4);
         this.tagSpr5 = new Sprite();
         this.tagSpr5.x = 155;
         this.tagSpr5.y = 178 - 23;
         this.tagSpr5.mouseEnabled = false;
         this.tagSpr5.visible = false;
         addChild(this.tagSpr5);
         this.tagSpr6 = new Sprite();
         this.tagSpr6.x = 155;
         this.tagSpr6.y = 196 - 23;
         this.tagSpr6.mouseEnabled = false;
         this.tagSpr6.visible = false;
         addChild(this.tagSpr6);
         this.tagSpr7 = new Sprite();
         this.tagSpr7.x = 155;
         this.tagSpr7.y = 214 - 23;
         this.tagSpr7.mouseEnabled = false;
         this.tagSpr7.visible = false;
         addChild(this.tagSpr7);
         this.setInitUI();
         this.equipContainers = new Sprite();
         addChild(this.equipContainers);
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick00,false,30);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.check33:
               PipeManager.sendMsg(PipeConstants.UI_MeiRenPanel_GOUXUAN_CLICK,[this.check33.selectState,SpecialGoodsID.XIANMO_KANGNAIXINHUASHU_394691]);
         }
      }
      
      private function onItemClick00(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new BaseEvent(ZhongZuJieMianPanel.UI_ZHONGZUJIEMIAN_MENU_SHOW,"",param1));
      }
      
      private function setInitUI() : void
      {
         var obj:Object = null;
         var i:int = 0;
         while(i < 7)
         {
            obj = new Object();
            obj.id = i;
            obj.spr = this["tagSpr" + (i + 1)];
            LoadSwf.AndReturnMC2(GameConfig.fileBaseFolder + "res/ui/UIditu/chixuemozhen/tag.swf",function(param1:MovieClip, param2:Object):*
            {
               var _loc3_:Sprite = null;
               if(param1)
               {
                  _loc3_ = new Sprite();
                  _loc3_.addChild(param1);
                  _loc3_.name = String(param2.id);
                  param2.spr.addChild(_loc3_);
               }
            },obj);
            i++;
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.xianshiBtn:
               PipeManager.sendMsg(PipeConstants.UI_ZHONGZUJIEMIAN_WAIXIAN_CLICK,1);
               break;
            case this.yincangBtn:
               PipeManager.sendMsg(PipeConstants.UI_ZHONGZUJIEMIAN_WAIXIAN_CLICK,0);
               break;
            case this.yichuBtn:
               PipeManager.sendMsg(PipeConstants.UI_ZHONGZUJIEMIAN_YICHU_CLICK);
         }
      }
      
      private function setGetAvatar(param1:int, param2:int) : void
      {
         var apd:AvatarParamData = null;
         var callBack1:Function = null;
         var id:int = param1;
         var isleixing:int = param2;
         callBack1 = function(param1:*, param2:BitmapData):void
         {
            avatar(param2);
         };
         var apdArr:Array = [];
         apd = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,id),AvatarPartType.BODY);
         apdArr.push(apd);
         this.avatar(null);
         if(isleixing == 1)
         {
            SimpleAvatarSynthesizer.synthesisSimpleAvatar(id,callBack1,apdArr,0,CharStatusType.STAND);
         }
         else if(isleixing == 2)
         {
            SimpleAvatarSynthesizer.synthesisSimpleAvatar(id,callBack1,apdArr,1,CharStatusType.STAND,2);
         }
      }
      
      public function avatar(param1:BitmapData) : void
      {
         this._avatar.bitmapData = param1;
         if(!param1)
         {
            return;
         }
         this._avatar.x = 300 - this._avatar.width / 2 - 70;
         this._avatar.y = 120 - this._avatar.height / 2 + 130;
      }
      
      public function setPanel(param1:Object) : void
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         this.setGetAvatar(param1.ziyuan,1);
         while(this.bgspr.numChildren > 0)
         {
            this.bgspr.removeChildAt(0);
         }
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/zhongzu_" + param1.type + ".swf");
         this.bg1.x = 30;
         this.bg1.y = 60;
         this.bgspr.addChild(this.bg1);
         this.setSkill(param1.skillid1,1);
         this.setSkill(param1.skillid2,2);
         this.setSkill(param1.skillid3,3);
         this.setSkill(param1.skillid4,4);
         if(param1.isxianshi)
         {
            this.yincangBtn.visible = true;
            this.xianshiBtn.visible = false;
         }
         else
         {
            this.yincangBtn.visible = false;
            this.xianshiBtn.visible = true;
         }
         var _loc2_:Boolean = false;
         if(param1.type == 1)
         {
            this.txtZhongZu.htmlText = "仙族内丹";
            _loc2_ = Boolean(GameState.dictMainStatus[SpecialGoodsID.XIANMO_XIANZUNEIDAN]);
            this.numZhongZu = GameState.dictMainStatus[SpecialGoodsID.XIANMO_XIANZUNEIDAN];
            _loc3_ = "";
            _loc3_ += "<textformat leading=\'6\'>";
            _loc3_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "使用提升自身攻击属性500000亿、防御属性300000亿、且全属性提升1%。" + "<br>" + "同时仙族技能追魂斩加成攻击力1%。神龙摆尾加成攻击力1%。（使用上限200颗）" + "<br>" + "特殊效果：当仙族内丹吃满200颗，可激活仙脉效果每次攻击对对手造成1%总血量伤害" + "<br>" + "（可和魔骨效果、转生效果、仙界凌云内丹效果叠加）。" + "<br>" + "当前已使用仙族内丹" + this.numZhongZu + "颗" + "<br>";
            _loc3_ += "</textformat>";
            this.tipZhongZu = _loc3_;
            this.txtXianQuMoTi.htmlText = "仙躯";
            this.txtXianQuMoTi.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_XIANQU];
            _loc4_ = "";
            _loc4_ = _loc4_ + "<textformat leading=\'6\'>";
            _loc4_ = _loc4_ + ("<font color=\'StaticValue.WHITE_HTML\'>" + "特殊技能：战斗状态100%触发仙躯金身，期间自身开启金身，不受任何魔族的技能伤害；" + "<br>" + "且攻击对手将可限制对手的移动范围禁锢原地。" + "<br>" + "冷却60秒。（对仙魔转生及非转生均有效！）" + "<br>");
            _loc4_ = _loc4_ + "</textformat>";
            this.tipXianQuMoTi = _loc4_;
         }
         else if(param1.type == 2)
         {
            this.txtZhongZu.htmlText = "魔族内丹";
            _loc2_ = Boolean(GameState.dictMainStatus[SpecialGoodsID.XIANMO_MOZUNEIDAN]);
            this.numZhongZu = GameState.dictMainStatus[SpecialGoodsID.XIANMO_MOZUNEIDAN];
            _loc3_ = "";
            _loc3_ += "<textformat leading=\'6\'>";
            _loc3_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "使用提升自身攻击属性500000亿、防御属性300000亿、且全属性提升1%。" + "<br>" + "同时魔族技能隐龙刀加成攻击力1%。天凤神炎加成攻击力1%。（使用上限200颗）" + "<br>" + "特殊效果：当魔族内丹吃满200颗，可激活魔骨效果每次攻击对对手造成1%总血量伤害" + "<br>" + "（可和仙脉效果、转生效果、仙界凌云内丹效果叠加）。" + "<br>" + "当前已使用魔族内丹" + this.numZhongZu + "颗" + "<br>";
            _loc3_ += "</textformat>";
            this.tipZhongZu = _loc3_;
            this.txtXianQuMoTi.htmlText = "魔体";
            this.txtXianQuMoTi.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_MOTI];
            _loc4_ = "";
            _loc4_ = _loc4_ + "<textformat leading=\'6\'>";
            _loc4_ = _loc4_ + ("<font color=\'StaticValue.WHITE_HTML\'>" + "特殊技能：PK时100%触发魔体虚化，期间自身进入虚化，无法被任何仙族攻击操作；" + "<br>" + "且攻击对手可将魔气压制对手身躯使其无法离地。" + "<br>" + "冷却60秒。（对仙魔转生及非转生均有效！）" + "<br>");
            _loc4_ = _loc4_ + "</textformat>";
            this.tipXianQuMoTi = _loc4_;
         }
         this.txtZhongZu.visible = _loc2_;
         this.check33.selectState = param1.check33;
         this.txt1.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_TIANSHU];
         this.txt2.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_TIANXUAN];
         this.txt3.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_TIANJI];
         this.txt4.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_TIANQUAN];
         this.txt5.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_HENGXING];
         this.txt6.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_KAIYANG];
         this.txt7.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_YAOGUANG];
         this.txt8.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_QIANNIANJIMU];
         this.txt9.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_ZHUANSHENGYIN];
         this.txt10.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_ZHUANSHENGFU];
         this.txt11.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_DONGSHENJIANG];
         this.txt12.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_XISHENJIANG];
         this.txt13.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_NANSHENJIANG];
         this.txt14.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_BEISHENJIANG];
         this.txt15.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_ZHONGSHENJIANG];
         this.txt16.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_ZHUANZHIQIANGHUADAN];
         this.txt17.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_TIANDAO];
         this.txt18.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_RENDAO];
         this.txt19.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_CHUSHENGDAO];
         this.txt20.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_AXIULUODAO];
         this.txt21.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_EGUIDAO];
         this.txt22.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_DIYUDAO];
         this.txt23.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_FENGSHENJIANG];
         this.txt24.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_LEISHENJIANG];
         this.txt25.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_XIEMOJIANG];
         this.txt26.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_YANMOJIANG];
         this.txt27.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_XUEWUZHIJING];
         this.txt28.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_BAZAIJIANCHI];
         this.txt29.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_LINSHANGSHI];
         this.txt30.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_LINYOUSHI];
         this.txt31.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_LINZHENSHI];
         this.txt32.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_KANGNAIXINHUASHU];
         this.num32 = GameState.dictMainStatus[SpecialGoodsID.XIANMO_KANGNAIXINHUASHU];
         this.txt33.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_KANGNAIXINHUASHU_394691];
         this.check33.visible = this.txt33.visible;
         this.tagSpr1.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_TIANSHU];
         this.tagSpr2.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_TIANXUAN];
         this.tagSpr3.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_TIANJI];
         this.tagSpr4.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_TIANQUAN];
         this.tagSpr5.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_HENGXING];
         this.tagSpr6.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_KAIYANG];
         this.tagSpr7.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_YAOGUANG];
         this.setInit();
      }
      
      public function setInit() : void
      {
         var _loc2_:int = 0;
         var _loc1_:Array = [];
         for each(_loc2_ in ItemPositionRange.POSTION_XIANMOJUESE_SHENQI)
         {
            if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[_loc2_] != undefined)
            {
               _loc1_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[_loc2_]);
            }
         }
         this.set_ZhongZuJieMian(_loc1_);
      }
      
      public function set_ZhongZuJieMian(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         this.removeItemBoxChildren();
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            if(_loc3_.res.position == ItemPositionRange.POSTION_XIANMOJUESE_SHENQI[0])
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.equipContainers.addChild(this.kuangHD);
               _loc4_.x = 290;
               _loc4_.y = 75;
               this.kuangHD.x = _loc4_.x - 2;
               this.kuangHD.y = _loc4_.y - 2;
               this.equipContainers.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
      
      private function removeItemBoxChildren() : void
      {
         while(this.equipContainers.numChildren > 0)
         {
            this.equipContainers.removeChildAt(0);
         }
      }
      
      private function setSkill(param1:int, param2:int) : void
      {
         var _loc4_:ItemFace = null;
         if(param2 == 1)
         {
            while(this.mainSkillContainer.numChildren > 0)
            {
               this.mainSkillContainer.removeChildAt(0);
            }
         }
         var _loc3_:Skill = new Skill(param1);
         _loc3_.isLearn = 1;
         _loc4_ = new ItemFace(_loc3_);
         _loc4_.showKungFuTag();
         _loc4_.setShowCount(false);
         _loc4_.y = 95 * param2;
         this.mainSkillContainer.addChild(_loc4_);
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
               PipeManager.sendMsg(PipeConstants.UI_ZHONGZUJIEMIAN_SKILL_DRAG,this.currSkill);
            }
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         }
      }
      
      private function onSkillMouseUp(param1:MouseEvent) : void
      {
         this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
      }
   }
}

