package com.tgame.shell.view.components.attribute.tengtianyi
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.character.PurePlayer;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.tengtianyi.model.info.TengtianyiVo;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import game.display.Button;
   import game.display.Label;
   import game.display.RadioButton;
   import game.skin.TengTianYiSkin;
   import game.utils.SkinTools;
   import gs.TweenMax;
   
   public class TengtianyiPanel extends BasePanel
   {
      
      public static const UI_TENGTIANYI_GUANBI_CLICK:String = "UI_TENGTIANYI_GUANBI_CLICK";
      
      public var _$parent:DisplayObject;
      
      private var feixingBtn:Button;
      
      private var jinjieBtn:Button;
      
      private var kuaisuBtn:SecondButton;
      
      private var jinjieBo:Boolean;
      
      private var jinengSpr:Sprite;
      
      private var nengli:FTextArea;
      
      private var isMainChar:Boolean;
      
      private var chibangTupo:TengTianYiTupoCanvas;
      
      private var nowId:int;
      
      private var lookingId:int;
      
      private var tupoBo:Boolean = false;
      
      private var bloodMc:MovieClip;
      
      private var mcObj:Array;
      
      private var bloodMcSpr:Sprite;
      
      private var yanhuaMc:MovieClip;
      
      private var jinjieMc:MovieClip;
      
      private var mainSkillContainer:Sprite;
      
      private var currSkill:ItemFace;
      
      private var p:Point;
      
      private var mainSkillItemFace:ItemFace;
      
      private var mainSkill:Skill;
      
      private var check:RadioButton;
      
      private var xingxingSpr:Sprite;
      
      private var xingBar1:MovieClip;
      
      private var xingBar2:MovieClip;
      
      private var xingBar3:MovieClip;
      
      private var xingBar4:MovieClip;
      
      private var xingBar5:MovieClip;
      
      private var xingBar6:MovieClip;
      
      private var xingBar7:MovieClip;
      
      private var xingBar8:MovieClip;
      
      private var xingBar9:MovieClip;
      
      private var xingBar10:MovieClip;
      
      private var label1:Label;
      
      private var label2:Label;
      
      private var label3:Label;
      
      private var label4:Label;
      
      private var label5:Label;
      
      private var label6:Label;
      
      private var label7:Label;
      
      private var item3:ItemFace;
      
      private var item4:ItemFace;
      
      private var fts1:FTextArea;
      
      private var check1:FCheckBox;
      
      private var fts2:FTextArea;
      
      private var check2:FCheckBox;
      
      private var fts3:FTextArea;
      
      private var check3:FCheckBox;
      
      private var fts4:FTextArea;
      
      private var check4:FCheckBox;
      
      private var fts5:FTextArea;
      
      private var check5:FCheckBox;
      
      private var fts6:FTextArea;
      
      private var check6:FCheckBox;
      
      private var fts7:FTextArea;
      
      private var check7:FCheckBox;
      
      private var fts8:FTextArea;
      
      private var check8:FCheckBox;
      
      private var fts9:FTextArea;
      
      private var check9:FCheckBox;
      
      private var fts10:FTextArea;
      
      private var check10:FCheckBox;
      
      private var fts11:FTextArea;
      
      private var check11:FCheckBox;
      
      private var fts12:FTextArea;
      
      private var check12:FCheckBox;
      
      private var fts13:FTextArea;
      
      private var check13:FCheckBox;
      
      private var fts14:FTextArea;
      
      private var check14:FCheckBox;
      
      private var fts15:FTextArea;
      
      private var check15:FCheckBox;
      
      public function TengtianyiPanel()
      {
         var $mask:Sprite;
         super();
         this.skin = SkinTools.getChildSkinByName(TengTianYiSkin.skin,"tengtianyi");
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 17;
         this.bloodMcSpr.y = -56;
         addChild(this.bloodMcSpr);
         this.jinengSpr = new Sprite();
         this.jinengSpr.x = 312;
         this.jinengSpr.y = 179;
         addChild(this.jinengSpr);
         this.chibangTupo = new TengTianYiTupoCanvas();
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
         addEventListener(UI_TENGTIANYI_GUANBI_CLICK,this.onCloseTupo);
         this.mcObj = new Array();
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 25 + 2 + 324 - 340;
         this.mainSkillContainer.y = 160 + 2 + 35 - 186 + 37;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp);
         this.fts1 = new FTextArea();
         this.fts1.x = 31;
         this.fts1.y = 180;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 120;
         this.fts1.height = 20;
         this.fts1.htmlText = new Goods(7500131).res.name;
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Bát Niên Thần Vũ – Kích ẩn đặc biệt nhân dịp Sinh Nhật 8 Tuổi Cùng Võ Lâm Chi Mộng" + "<br>" + "Hiểu quả đặc biệt: Khi nhảy liên tục 30 lần sẽ lập tức được hồi phục 100% Sinh Lực, Nội " + "<br>" + "Lực và Thể Lực. Thời gian chờ của kỹ năng là 60 giây." + "<br>" + "Hiểu quả hiển thị: tủy chọn hiển thị ảo hóa cánh đặc biệt." + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check1 = new FCheckBox();
         addChild(this.check1);
         this.check1.x = 10;
         this.check1.y = 180;
         this.check1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fts2 = new FTextArea();
         this.fts2.x = 31;
         this.fts2.y = 162;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 120;
         this.fts2.height = 20;
         this.fts2.htmlText = new Goods(731574).res.name;
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Cửu Tiêu Vũ giúp nhân vật nhận được các hiệu quả sau:" + "<br>" + "Cửu Tiêu Quang: Bản thân và tất cả đồng đội xung quanh 10 ô được hồi phục mỗi giây 10% Sinh Lực" + "<br>" + "+ 10% Nội Lực + 10% Thể Lực, kéo dài liên tục 10 giây." + "<br>" + "Cửu Tiêu Sát: Bản thân đánh khiến đối thủ lập tức bị rơi ngựa, kèm theo các hiệu quả bất lợi như giảm " + "<br>" + "50.000.000 Tầng Võ Công trong 5 giây, mất toàn bộ Thể Lực." + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check2 = new FCheckBox();
         addChild(this.check2);
         this.check2.x = 10;
         this.check2.y = 162;
         this.check2.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fts3 = new FTextArea();
         this.fts3.x = 31;
         this.fts3.y = 144;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 120;
         this.fts3.height = 20;
         this.fts3.htmlText = new Goods(732211).res.name;
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(732211).res.desc;
            return _loc1_ + "</textformat>";
         });
         this.check3 = new FCheckBox();
         addChild(this.check3);
         this.check3.x = 10;
         this.check3.y = 144;
         this.check3.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fts4 = new FTextArea();
         this.fts4.x = 31;
         this.fts4.y = 126;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 120;
         this.fts4.height = 20;
         this.fts4.htmlText = new Goods(736952).res.name;
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Thập Nhị Niên Vũ – Kích hoạt cánh đặc biệt kỉ niệm 12 năm phát hành sản phẩm." + "<br>" + "Thập Nhị Niên Vũ : Khi nhảy liên tục 12 lần sẽ lập tức kích hoạt kỹ năng Thập Nhị Niên Vũ kéo dài liên tục 30 giây." + "<br>" + "Trong thời gian hiệu quả: Bản thân lập tức Vô Địch và Miễn Dịch 100% Sát Thương của đối thủ. Bên cạnh đó, " + "<br>";
            "bản thân đánh vào đối thủ nào thì đối thủ đó sẽ lập tức rơi khỏi ngựa và cấm nhảy trong 30 giây.  " + "<br>";
            "Thời gian chờ của kỹ năng là 60 giây." + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check4 = new FCheckBox();
         addChild(this.check4);
         this.check4.x = 10;
         this.check4.y = 126;
         this.check4.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fts5 = new FTextArea();
         this.fts5.x = 31;
         this.fts5.y = 108;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 120;
         this.fts5.height = 20;
         this.fts5.text = "Tuyết Vương Vũ";
         this.fts5.visible = false;
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Tuyết Vương Vũ : Kỉ niệm Giáng Sinh 2023" + "<br>" + "Thuộc tính cộng thêm:" + "<br>" + "Tấn Công : 888.888.888" + "<br>" + "Phòng Thủ : 888.888.888" + "<br>" + "Bạo Kích : 888.888.888" + "<br>" + "Né Tránh : 888.888.888" + "<br>" + "Sinh Lực : 8.888.888.888" + "<br>" + "Tầng Võ Công : 188.888.888" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check5 = new FCheckBox();
         addChild(this.check5);
         this.check5.x = 10;
         this.check5.y = 108;
         this.check5.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fts6 = new FTextArea();
         this.fts6.x = 31;
         this.fts6.y = 90;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 120;
         this.fts6.height = 20;
         this.fts6.text = "Đại Hải Thần Vũ";
         this.fts6.visible = false;
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Đại Hải Thần Vũ – Kích hoạt cánh đặc biệt Mùa Hè 2024." + "<br>" + "Đại Hải Thần Vũ : Khi nhảy liên tục 30 lần sẽ lập tức kích hoạt kỹ năng Đại Hải Thần Vũ kéo dài liên tục 30 giây." + "<br>" + "Trong thời gian hiệu quả: Bản thân lập tức bỏ qua hiệu quả Miễn Dịch 100% Sát Thương của đối thủ. Bên cạnh đó, bản thân đánh vào đối thủ " + "<br>" + "nào thì đối thủ đó sẽ lập tức bị mất 20.000.000.000 Tầng Võ Công. Thời gian chờ của kỹ năng là 120 giây." + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check6 = new FCheckBox();
         addChild(this.check6);
         this.check6.x = 10;
         this.check6.y = 90;
         this.check6.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fts7 = new FTextArea();
         this.fts7.x = 31;
         this.fts7.y = 72;
         this.fts7.textColor = StaticValue.GREEN;
         this.fts7.width = 120;
         this.fts7.height = 20;
         this.fts7.text = "Vũ Điều Mùa Hè 2024";
         this.fts7.visible = false;
         addChild(this.fts7);
         ToolTips.createToolTips(this.fts7,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Vũ Điều Mùa Hè 2024 – Kích hoạt cánh đặc biệt Mùa Hè 2024." + "<br>" + "Vũ Điều Mùa Hè 2024 : Khi nhảy liên tục 12 lần sẽ lập tức kích hoạt kỹ năng Vũ Điều Mùa Hè 2024 kéo dài liên tục 30 giây." + "<br>" + "Trong thời gian hiệu quả: Bản thân lập tức Vô Địch và Miễn Dịch 100% Sát Thương của đối thủ. Bên cạnh đó, bản thân đánh vào đối thủ nào " + "<br>" + "thì đối thủ đó sẽ lập tức cấm nhảy và cấm sử dụng kỹ năng trong 30 giây. Thời gian chờ của kỹ năng là 120 giây." + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check7 = new FCheckBox();
         addChild(this.check7);
         this.check7.x = 10;
         this.check7.y = 72;
         this.check7.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fts8 = new FTextArea();
         this.fts8.x = 31;
         this.fts8.y = 54;
         this.fts8.textColor = StaticValue.GREEN;
         this.fts8.width = 120;
         this.fts8.height = 20;
         this.fts8.text = " [Tuyệt] Đông Quân Thần Vũ";
         this.fts8.visible = false;
         addChild(this.fts8);
         ToolTips.createToolTips(this.fts8,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Hiệu quả: Khi sử dụng kỹ năng Phá Huyết Cuồng Sát sẽ lập tức kích hoạt kỹ năng [Tuyệt] Đông Quân Thần Vũ kéo dài 25 giây." + "<br>" + "Trong thời gian hiệu quả," + "<br>" + "Bản thân bỏ qua trạng thái Miễn Dịch Sát thương của đối thủ" + "<br>" + "Tất cả đối thủ trong phạm vi 5m bị mất 15 buff ngẫu nghiên và lập tức bị cấm sử dụng kỹ năng. " + "<br>" + "Tất cả đối thủ trong phạm vi 5m không thể kích hoạt các kỹ năng đặc biệt từ trang bị đang mặc trên người trong 15 giây" + "<br>" + "Thời gian chờ của kỹ năng là 90 giây." + "<br>" + "Bên cạnh đó, bản thân mặc định Kháng 100% các hiệu quả kỹ năng dưới đây. Hiệu quả kháng không có thời gian chờ." + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check8 = new FCheckBox();
         addChild(this.check8);
         this.check8.x = 10;
         this.check8.y = 54;
         this.check8.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fts9 = new FTextArea();
         this.fts9.x = 31;
         this.fts9.y = 36;
         this.fts9.textColor = StaticValue.GREEN;
         this.fts9.width = 120;
         this.fts9.height = 20;
         this.fts9.text = "Thập Tam Niên Vũ";
         this.fts9.visible = false;
         addChild(this.fts9);
         ToolTips.createToolTips(this.fts9,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Thập Tam Niên Vũ – Kích hoạt hiển thị cánh đặc biệt kỉ niệm 13 năm phát hành sản phẩm." + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check9 = new FCheckBox();
         addChild(this.check9);
         this.check9.x = 10;
         this.check9.y = 36;
         this.check9.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fts10 = new FTextArea();
         this.fts10.x = 31;
         this.fts10.y = 18;
         this.fts10.textColor = StaticValue.GREEN;
         this.fts10.width = 120;
         this.fts10.height = 20;
         this.fts10.text = "GM Táo Quân 2025-Vũ";
         this.fts10.visible = false;
         addChild(this.fts10);
         ToolTips.createToolTips(this.fts10,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Sinh Lực: + 5.000.000.000" + "<br>" + "SNội Lực: + 500.000.000" + "<br>" + "Thể Lực: + 500.000.000" + "<br>" + "Võ Công: + 200.000.000" + "<br>" + "Võ Phòng: +200.000.000" + "<br>" + "Nhận được tại hoạt động: Ông Táo của phiên bản V689 – Bạch Y Thần Kiếm" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check10 = new FCheckBox();
         addChild(this.check10);
         this.check10.x = 10;
         this.check10.y = 18;
         this.check10.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fts11 = new FTextArea();
         this.fts11.x = 31;
         this.fts11.y = 0;
         this.fts11.textColor = StaticValue.GREEN;
         this.fts11.width = 120;
         this.fts11.height = 20;
         this.fts11.text = "Hỏa Tỵ Thần Vũ";
         this.fts11.visible = false;
         addChild(this.fts11);
         ToolTips.createToolTips(this.fts11,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Đã kích hoạt Hỏa Tỵ Thần Vũ" + "<br>" + "Bạo Kích + 300.000.000" + "<br>" + "Né Tránh + 300.000.000" + "<br>" + "Võ Công + 300.000.000" + "<br>" + "Sinh Lực + 3.000.000.000" + "<br>" + "Nội Lực + 3.000.000.000" + "<br>" + "Khi nhảy liên tục 10 lần sẽ kích hoạt kỹ năng Hỏa Tỵ Thần Vũ kéo dài 8 giây." + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check11 = new FCheckBox();
         addChild(this.check11);
         this.check11.x = 10;
         this.check11.y = 0;
         this.check11.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fts12 = new FTextArea();
         this.fts12.x = 231;
         this.fts12.y = 0;
         this.fts12.textColor = StaticValue.GREEN;
         this.fts12.width = 120;
         this.fts12.height = 20;
         this.fts12.text = "Thần Châu Uyên Hải";
         this.fts12.visible = false;
         addChild(this.fts12);
         this.check12 = new FCheckBox();
         addChild(this.check12);
         this.check12.x = 210;
         this.check12.y = 0;
         this.check12.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fts13 = new FTextArea();
         this.fts13.x = 231;
         this.fts13.y = 18;
         this.fts13.textColor = StaticValue.GREEN;
         this.fts13.width = 120;
         this.fts13.height = 20;
         this.fts13.text = "Huyền Vũ Huyễn Dực";
         this.fts13.visible = false;
         addChild(this.fts13);
         this.check13 = new FCheckBox();
         addChild(this.check13);
         this.check13.x = 210;
         this.check13.y = 18;
         this.check13.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fts14 = new FTextArea();
         this.fts14.x = 231;
         this.fts14.y = 36;
         this.fts14.textColor = StaticValue.GREEN;
         this.fts14.width = 120;
         this.fts14.height = 20;
         this.fts14.text = "Ngân Quang Linh Dực";
         this.fts14.visible = false;
         addChild(this.fts14);
         this.check14 = new FCheckBox();
         addChild(this.check14);
         this.check14.x = 210;
         this.check14.y = 36;
         this.check14.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fts15 = new FTextArea();
         this.fts15.x = 231;
         this.fts15.y = 54;
         this.fts15.textColor = StaticValue.GREEN;
         this.fts15.width = 120;
         this.fts15.height = 20;
         this.fts15.text = "Bính Ngọ Niên Vũ";
         this.fts15.visible = false;
         addChild(this.fts15);
         this.check15 = new FCheckBox();
         addChild(this.check15);
         this.check15.x = 210;
         this.check15.y = 54;
         this.check15.addEventListener(MouseEvent.CLICK,this.onClick);
         this.kuaisuBtn = new SecondButton();
         this.kuaisuBtn.label = "Dùng nhanh";
         addChild(this.kuaisuBtn);
         this.kuaisuBtn.x = 309;
         this.kuaisuBtn.y = 256;
         this.kuaisuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      override protected function createVariableReference() : void
      {
         this.feixingBtn = getChildByName("zhanchilingkong") as Button;
         this.jinjieBtn = getChildByName("tijiaojinqianye") as Button;
         this.jinjieBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.feixingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.check = getChildByName("duigou") as RadioButton;
         this.check.addEventListener(MouseEvent.CLICK,this.onClick);
         this.label1 = getChildByName("shuziwenben1") as Label;
         this.label1.width = 100;
         this.label2 = getChildByName("shuziwenben2") as Label;
         this.label2.width = 100;
         this.label3 = getChildByName("shuziwenben3") as Label;
         this.label3.width = 100;
         this.label4 = getChildByName("shuziwenben4") as Label;
         this.label4.width = 100;
         this.label5 = getChildByName("shuziwenben5") as Label;
         this.label5.width = 100;
         this.label6 = getChildByName("shuziwenben6") as Label;
         this.label6.width = 100;
         this.label7 = getChildByName("shuziwenben7") as Label;
         this.label7.width = 100;
         this.xingxingSpr = new Sprite();
         addChild(this.xingxingSpr);
         this.xingxingSpr.x = 34;
         this.xingxingSpr.y = 84;
         var _loc1_:int = 1;
         while(_loc1_ < 11)
         {
            this["xingBar" + _loc1_] = StaticValue.getMCByClassName("ui.tengtianyi.xingxing") as MovieClip;
            this["xingBar" + _loc1_].gotoAndStop(1);
            this.xingxingSpr.addChild(this["xingBar" + _loc1_]);
            this["xingBar" + _loc1_].buttonMode = false;
            this["xingBar" + _loc1_].stop();
            this["xingBar" + _loc1_].x = _loc1_ * 24;
            this["xingBar" + _loc1_].y = 130 + 15;
            _loc1_++;
         }
      }
      
      private function onCloseTupo(param1:BaseEvent) : void
      {
         this.showTuPoPanel(false);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.feixingBtn:
               if(this.feixingBtn.enabled)
               {
                  PipeManager.sendMsg(PipeConstants.UP_DOWN_FEIXING,101);
               }
               break;
            case this.jinjieBtn:
               if(this.jinjieBtn.enabled)
               {
                  this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_TENGTIANYI_LINGWU_SHOW,"",this.lookingId));
                  this.showTuPoPanel(true);
               }
               break;
            case this.check:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_TENGTIANYI_WAIGUAN_CLICK,"",this.check.selected));
               break;
            case this.check1:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check1.selectState,120]));
               break;
            case this.check2:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check2.selectState,121]));
               break;
            case this.check3:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check3.selectState,732211]));
               break;
            case this.check4:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check4.selectState,736952]));
               break;
            case this.check5:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check5.selectState,737120]));
               break;
            case this.check6:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check6.selectState,738186]));
               break;
            case this.check7:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check7.selectState,738187]));
               break;
            case this.check8:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check8.selectState,739293]));
               break;
            case this.check9:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check9.selectState,739539]));
               break;
            case this.check10:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check10.selectState,739825]));
               break;
            case this.check11:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check11.selectState,739848]));
               break;
            case this.check12:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check12.selectState,741189]));
               break;
            case this.check13:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check13.selectState,741786]));
               break;
            case this.check14:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check14.selectState,742225]));
               break;
            case this.check15:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check15.selectState,742414]));
               break;
            case this.kuaisuBtn:
               PipeManager.sendMsg(PipeConstants.SEND_53099,[268,this.lookingId]);
         }
      }
      
      public function showTengtianyi(param1:int) : void
      {
         if(param1 == 0)
         {
            this.check.selected = false;
         }
         else if(param1 == 1)
         {
            this.check.selected = true;
         }
      }
      
      public function setInitialize(param1:TengtianyiVo, param2:Boolean) : void
      {
         this.setJiHuoTianshi(param2);
         this.isMainChar = param2;
         this.check1.selectState = Boolean(param1.check1);
         this.check2.selectState = Boolean(param1.check2);
         this.check3.selectState = Boolean(param1.check3);
         this.check4.selectState = Boolean(param1.check4);
         this.setBg(param1.lookId);
         this.yuyidengji(param1.nowId);
         this.setShuxingJiacheng(param1.shengMing,param1.tiLi,param1.gongJi,param1.fangYu,param1.baoJi,param1.shanBi,param1.neili);
         this.setZhenFaTiSheng(param1.lookId,param1.nowId);
         this.setSkill(param1.skillId,param1.isLearned,param1.skillId2,param1.isLearned2,param1.nowId);
         if(param1.isShow)
         {
            this.showTengtianyi(1);
         }
         else
         {
            this.showTengtianyi(0);
         }
         if(param1.MaxXingXing <= param1.CurXingXing)
         {
            this.jinjieBtn.enabled = true;
         }
         else
         {
            this.jinjieBtn.enabled = false;
         }
         this.setValue(param1.nowId,param1.CurXingXing,param1.MaxXingXing);
      }
      
      public function setJiHuoTianshi(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = this.check1.visible = GameState.dictMainStatus[7500131];
            this.fts2.visible = this.check2.visible = GameState.dictMainStatus[731574];
            this.fts3.visible = this.check3.visible = GameState.dictMainStatus[732211];
            this.fts4.visible = this.check4.visible = GameState.dictMainStatus[736952];
            this.fts5.visible = this.check5.visible = GameState.dictMainStatus[737120];
            this.fts6.visible = this.check6.visible = GameState.dictMainStatus[738186];
            this.fts7.visible = this.check7.visible = GameState.dictMainStatus[738187];
            this.fts8.visible = this.check8.visible = GameState.dictMainStatus[739293];
            this.fts9.visible = this.check9.visible = GameState.dictMainStatus[739539];
            this.fts10.visible = this.check10.visible = GameState.dictMainStatus[739825];
            this.fts11.visible = this.check11.visible = GameState.dictMainStatus[739848];
            this.fts12.visible = this.check12.visible = GameState.dictMainStatus[741189];
            this.fts13.visible = this.check13.visible = GameState.dictMainStatus[741786];
            this.fts14.visible = this.check14.visible = GameState.dictMainStatus[742225];
            this.fts15.visible = this.check15.visible = GameState.dictMainStatus[742414];
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[7500131];
            this.check1.visible = false;
            this.fts2.visible = GameState.dictTargetStatus[731574];
            this.check2.visible = false;
            this.fts3.visible = GameState.dictTargetStatus[732211];
            this.check3.visible = false;
            this.fts4.visible = GameState.dictTargetStatus[736952];
            this.check4.visible = false;
            this.fts5.visible = GameState.dictTargetStatus[737120];
            this.check5.visible = false;
            this.fts6.visible = GameState.dictTargetStatus[738186];
            this.check6.visible = false;
            this.fts7.visible = GameState.dictTargetStatus[738187];
            this.check7.visible = false;
            this.fts8.visible = GameState.dictTargetStatus[739293];
            this.check8.visible = false;
            this.fts9.visible = GameState.dictTargetStatus[739539];
            this.check9.visible = false;
            this.fts10.visible = GameState.dictTargetStatus[739825];
            this.check10.visible = false;
            this.fts11.visible = GameState.dictTargetStatus[739848];
            this.check11.visible = false;
            this.fts12.visible = GameState.dictTargetStatus[741189];
            this.check12.visible = false;
            this.fts13.visible = GameState.dictTargetStatus[741786];
            this.check13.visible = false;
            this.fts14.visible = GameState.dictTargetStatus[742225];
            this.check14.visible = false;
            this.fts15.visible = GameState.dictTargetStatus[742414];
            this.check15.visible = false;
         }
      }
      
      public function setValue(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:int = param1 + 1;
         var _loc5_:int = 1;
         while(_loc5_ <= 10)
         {
            if(_loc5_ < _loc4_)
            {
               this["xingBar" + _loc5_].gotoAndStop(100);
            }
            else if(_loc5_ == _loc4_)
            {
               this["xingBar" + _loc5_].gotoAndStop(int(param2 * 100 / param3));
            }
            else if(_loc5_ > _loc4_)
            {
               return;
            }
            _loc5_++;
         }
      }
      
      public function setShuxingJiacheng(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number) : void
      {
         this.label1.text = param1 + "";
         this.label2.text = param3 + "";
         this.label3.text = param4 + "";
         this.label4.text = param7 + "";
         this.label5.text = param5 + "";
         this.label6.text = param6 + "";
         this.label7.text = param2 + "";
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
         this.chibangTupo._parent2 = param1;
         this.chibangTupo._parent3 = this;
      }
      
      private function setBg(param1:int) : void
      {
         var mcId:int = 0;
         var loadUrl:String = null;
         var sex:String = null;
         var pPlayer:PurePlayer = null;
         var lookid:int = param1;
         mcId = 0;
         if(lookid == 1 || lookid == 2 || lookid == 3 || lookid == 4)
         {
            mcId = 1;
         }
         else if(lookid == 5 || lookid == 6 || lookid == 7)
         {
            mcId = 2;
         }
         else if(lookid == 8 || lookid == 9)
         {
            mcId = 3;
         }
         else if(lookid == 10)
         {
            mcId = 4;
         }
         if(this.isMainChar)
         {
            sex = GameInstance.mainCharData.attributeInfo.getSex() == 1 ? "man" : "woman";
         }
         else
         {
            pPlayer = GameInstance.lookPlayerData;
            sex = pPlayer.attributeInfo.getSex() == 1 ? "man" : "woman";
         }
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/tengtianyi/" + sex + "/" + mcId + ".swf";
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
      }
      
      public function setZhenFaTiSheng(param1:int, param2:int = -1) : void
      {
         this.nowId = param2;
         this.lookingId = param1;
         if(this.tupoBo)
         {
            this.jinjieBtn.enabled = false;
            this.closejinjie();
         }
         else if(param1 < param2)
         {
            this.jinjieBtn.enabled = false;
            this.closejinjie();
         }
         else if(param1 == param2)
         {
            if(param2 == 8)
            {
               this.jinjieBo = false;
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
            this.jinjieBtn.enabled = false;
            this.closejinjie();
         }
      }
      
      public function setSkill(param1:int, param2:Boolean, param3:int, param4:Boolean, param5:int) : void
      {
         var _loc6_:ItemFace = null;
         var _loc8_:ItemFace = null;
         while(this.jinengSpr.numChildren > 0)
         {
            this.jinengSpr.removeChildAt(0);
         }
         var _loc7_:Skill = new Skill(param1);
         _loc7_.isLearn = param2 == true ? 1 : 0;
         _loc6_ = new ItemFace(_loc7_);
         _loc6_.showKungFuTag();
         _loc6_.setShowCount(false);
         this.jinengSpr.addChild(_loc6_);
         var _loc9_:Skill = new Skill(param3);
         _loc9_.isLearn = param4 == true ? 1 : 0;
         _loc8_ = new ItemFace(_loc9_);
         _loc8_.showKungFuTag();
         _loc8_.setShowCount(false);
         _loc8_.x = 42;
         this.jinengSpr.addChild(_loc8_);
         var _loc10_:Skill = new Skill(200153);
         _loc10_.isLearn = param5 > 8 ? 1 : 0;
         this.item3 = new ItemFace(_loc10_);
         this.item3.showKungFuTag();
         this.item3.setShowCount(false);
         this.item3.y = -42;
         this.jinengSpr.addChild(this.item3);
         var _loc11_:Skill = new Skill(80200301);
         _loc11_.isLearn = param5 > 9 ? 1 : 0;
         this.item4 = new ItemFace(_loc11_);
         this.item4.showKungFuTag();
         this.item4.setShowCount(false);
         this.item4.y = -42;
         this.item4.x = 42;
         this.jinengSpr.addChild(this.item4);
      }
      
      public function showTuPoPanel(param1:Boolean) : void
      {
         this.tupoBo = param1;
         if(param1)
         {
            if(this.chibangTupo.x == 138)
            {
               TweenMax.to(this.chibangTupo,1,{"x":410});
               this.tupoBo = true;
               this.jinjieBtn.enabled = false;
               this.closejinjie();
            }
         }
         else
         {
            if(this.chibangTupo.x == 410)
            {
               TweenMax.to(this.chibangTupo,1,{"x":138});
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_TENGTIANYI_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.jinjieBtn.enabled = true;
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

