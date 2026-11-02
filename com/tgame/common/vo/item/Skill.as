package com.tgame.common.vo.item
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.skill.BuffRes;
   import com.tgame.common.res.skill.SkillRes;
   import com.tgame.common.res.skill.SkillResManager;
   import com.tgame.common.staticdata.CoolingType;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.character.info.data.SkillTuPoInfo;
   import flash.display.Bitmap;
   
   public class Skill extends BaseItem
   {
      
      public var res:SkillRes;
      
      public var buffres:BuffRes;
      
      private var _tupoInfo:SkillTuPoInfo;
      
      public var esoterica_id:int;
      
      public var skill_type:int;
      
      public var level:int;
      
      public var levelAppend:Number;
      
      public var zhenqi:int;
      
      public var copper:int;
      
      public var shulianCurrent:int;
      
      public var studyLevel:int;
      
      public var shulianTotal:int;
      
      public var grade:int = 0;
      
      public var nowexp:int = 0;
      
      public var target:int;
      
      public var iscommon:int;
      
      public var isLearn:int;
      
      public var isLevelUp:int;
      
      public var isStudy:int;
      
      public var isTop:int;
      
      private var _coolingTime:int = -1;
      
      public var isOther:int;
      
      public var isPingJingSkill:int;
      
      public var isAnqiSkill:int;
      
      public var isGongJian:int;
      
      public var isDanTian:int;
      
      public function Skill(param1:int, param2:int = 0, param3:int = 0, param4:Number = 0, param5:int = 0, param6:int = 0, param7:int = 0)
      {
         this.isLearn = param7;
         this.level = param5;
         this.zhenqi = param6;
         super(param1,param2,param3,param4);
         this.res = SkillResManager.getSkillRes(param1);
         if(this.res)
         {
            this.buffres = SkillResManager.getBuffRes(Number(this.res.effect_ids));
         }
      }
      
      override public function getSmallICO(param1:int = 35, param2:int = 35) : Bitmap
      {
         if(param1 == 65 && param2 == 65)
         {
            return ResPathManager.getSmallICO(this.res.id_ico_big,param1,param2);
         }
         return ResPathManager.getSmallICO(this.res.id_ico,param1,param2);
      }
      
      override public function getAvatarPath_Skill0() : String
      {
         return ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,this.res.id_e0);
      }
      
      override public function getAvatarPath_Skill1() : String
      {
         return ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,this.res.id_e1);
      }
      
      override public function getAvatarPath_Skill2() : String
      {
         return ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,this.res.id_e2);
      }
      
      override public function getID() : *
      {
         return this.getType() + "_" + id;
      }
      
      override public function getType() : int
      {
         return CoolingType.SKILL;
      }
      
      override public function getCoolingtime() : int
      {
         if(this.res.wugong_type == 14 || this.res.wugong_type == 17 || this.res.wugong_type == 19 || this.res.wugong_type == 20 || this.res.wugong_type == 21 || this.res.wugong_type == 24 || this.res.wugong_type == 29 || this.res.wugong_type == 27 || this.res.wugong_type == 31 || id == OtherConst.JINCHANTUOQIAO_SKILL_ID || id == OtherConst.ZHENWUQIJIEZHEN_SKILL_ID || id == OtherConst.JINGANGFUMOQUAN_SKILL_ID || id == OtherConst.JINGANGFUMOQUAN_DINGJI_SKILL_ID || id == OtherConst.JINGANGFUMOQUAN_YINCANG_SKILL_ID || id == OtherConst.LONGZHUA_SKILL_ID || id == OtherConst.LONGZHUA_QIANGHUA_SKILL_ID || id == OtherConst.SHENXINGBAIBIAN_SKILL_ID || id == OtherConst.SHENXINGBAIBIAN_SKILL_DINGJI_ID || id == OtherConst.SKILL_ID_RULAISHENZHANG || id == OtherConst.DINGCHANJUE_SKILL_ID || id == OtherConst.YIHUAJIEMU_SKILL_ID || id == OtherConst.MOLINGZHIYUAN_SKILL_ID || id == OtherConst.SIWANGJINWU_SKILL_ID || id == OtherConst.HUANGJINYINZHE_SKILL_ID || id == OtherConst.XUANYUANGUPAO_SKILL_ID || id == OtherConst
         .QUANSHENCHUDONG_SKILL_ID || id == OtherConst.CIYUANYICHU_SKILL_ID || id == OtherConst.KUNSHOUYUCHANG_SKILL_ID || id == OtherConst.SHENJIANZHONG_SKILL_ID || id == OtherConst.HANBINGZHANG_SKILL_ID || id == OtherConst.JIANJI_SKILL_ID || id == OtherConst.QIANLIZHIWAI_SKILL_ID || id == OtherConst.XIDUNIZHUANJIUYIN_SKILL_ID || id == OtherConst.JIANTIFENGYIN_SKILL_ID || id == OtherConst.FOGUANGPUZHAO_SKILL_ID || id == OtherConst.BUSIJINSHEN_SKILL_ID || id == OtherConst.ZIFUDONGTIAN_SKILL_ID || id == OtherConst.TIANYUYANMENG_SKILL_ID || id == OtherConst.HUANGJINGONGCHENGNU_SKILL_ID || id == OtherConst.ZHAOFENGYINDIE_SKILL_ID || id == OtherConst.DIANLAO_SKILL_ID || id == OtherConst.KAITIAN_SKILL_ID || id == OtherConst.TAOHUAHUTI_SKILL_ID || id == OtherConst.KUNXIANSHU_SKILL_ID || id == OtherConst.HUANYINGFENSHEN_SKILL_ID || id == OtherConst.SIWANGXUANYAN_SKILL_ID || id == OtherConst.GUIYINGXIANZHONG_SKILL_ID || id == OtherConst.JUEQINGMIJI_SKILL_ID || id == OtherConst.ZIJINQIANKUN_SKILL_ID || id == OtherConst
         .MEIRENJI_SKILL_ID || id == OtherConst.LINGHUHUANHUA_SKILL_ID || id == OtherConst.JINJIAZHANCHE_SKILL_ID || id == OtherConst.TAIYUANJING_SKILL_ID || id == OtherConst.ZHANLONGJUE_SKILL_ID || id == OtherConst.ZHANLONGJUE_SKILL_ID1 || id == OtherConst.ZHANLONGJUE_SKILL_ID2 || id == OtherConst.ZHANLONGJUE_SKILL_ID3 || id == OtherConst.ZHANLONGJUE_SKILL_ID4 || id == OtherConst.GUIZHUA_SKILL_ID4 || id == OtherConst.GUIZHUA_SKILL_ID5 || id == OtherConst.GUIZHUA_SKILL_ID6 || id == OtherConst.GUIZHUA_SKILL_ID7 || id == OtherConst.GUIZHUA_SKILL_ID8)
         {
            if((id == OtherConst.LIUMAISHNEJIAN_SKILL_ID_1 || id == OtherConst.LIUMAISHNEJIAN_SKILL_ID_8) && Boolean(GameState.dictMainStatus[SpecialGoodsID.LIUMAISHENJIAN_GUANCHONGJIAN_ID]))
            {
               return 8 * 1000;
            }
            if((id == OtherConst.LIUMAISHNEJIAN_SKILL_ID_2 || id == OtherConst.LIUMAISHNEJIAN_SKILL_ID_9) && Boolean(GameState.dictMainStatus[SpecialGoodsID.LIUMAISHENJIAN_SHAOCHONGJIAN_ID]))
            {
               return 8 * 1000;
            }
            if((id == OtherConst.LIUMAISHNEJIAN_SKILL_ID_3 || id == OtherConst.LIUMAISHNEJIAN_SKILL_ID_10) && Boolean(GameState.dictMainStatus[SpecialGoodsID.LIUMAISHENJIAN_SHANGYANGJIAN_ID]))
            {
               return 8 * 1000;
            }
            if((id == OtherConst.LIUMAISHNEJIAN_SKILL_ID_4 || id == OtherConst.LIUMAISHNEJIAN_SKILL_ID_11) && Boolean(GameState.dictMainStatus[SpecialGoodsID.LIUMAISHENJIAN_ZHONGCHONGJIAN_ID]))
            {
               return 8 * 1000;
            }
            if((id == OtherConst.LIUMAISHNEJIAN_SKILL_ID_5 || id == OtherConst.LIUMAISHNEJIAN_SKILL_ID_12) && Boolean(GameState.dictMainStatus[SpecialGoodsID.LIUMAISHENJIAN_SHAOZEJIAN_ID]))
            {
               return 8 * 1000;
            }
            if((id == OtherConst.LIUMAISHNEJIAN_SKILL_ID_6 || id == OtherConst.LIUMAISHNEJIAN_SKILL_ID_13) && Boolean(GameState.dictMainStatus[SpecialGoodsID.LIUMAISHENJIAN_SHAOSHANGJIAN_ID]))
            {
               return 8 * 1000;
            }
            if(Boolean(id == OtherConst.LIUMAISHNEJIAN_SKILL_ID_7) && Boolean(GameState.dictMainStatus[SpecialGoodsID.LIUMAISHENJIAN_GUANCHONGJIAN_ID]) && Boolean(GameState.dictMainStatus[SpecialGoodsID.LIUMAISHENJIAN_SHAOCHONGJIAN_ID]) && Boolean(GameState.dictMainStatus[SpecialGoodsID.LIUMAISHENJIAN_SHANGYANGJIAN_ID]) && Boolean(GameState.dictMainStatus[SpecialGoodsID.LIUMAISHENJIAN_ZHONGCHONGJIAN_ID]) && Boolean(GameState.dictMainStatus[SpecialGoodsID.LIUMAISHENJIAN_SHAOZEJIAN_ID]) && Boolean(GameState.dictMainStatus[SpecialGoodsID.LIUMAISHENJIAN_SHAOSHANGJIAN_ID]))
            {
               return 8 * 1000;
            }
            return this.res.coolingtime;
         }
         return this.res.coolingtime / (1 + GameInstance.mainCharData.attributeInfo.adx / 1000);
      }
      
      override public function getPublicCoolingtime() : int
      {
         if(this.res.wugong_type == 14 || this.res.wugong_type == 17 || this.res.wugong_type == 19 || this.res.wugong_type == 20 || this.res.wugong_type == 21 || this.res.wugong_type == 24 || this.res.wugong_type == 29 || this.res.wugong_type == 27 || this.res.wugong_type == 31 || id == OtherConst.JINCHANTUOQIAO_SKILL_ID || id == OtherConst.ZHENWUQIJIEZHEN_SKILL_ID || id == OtherConst.JINGANGFUMOQUAN_SKILL_ID || id == OtherConst.JINGANGFUMOQUAN_DINGJI_SKILL_ID || id == OtherConst.JINGANGFUMOQUAN_YINCANG_SKILL_ID || id == OtherConst.LONGZHUA_SKILL_ID || id == OtherConst.TAIYUANJING_SKILL_ID || id == OtherConst.LONGZHUA_QIANGHUA_SKILL_ID || id == OtherConst.SHENXINGBAIBIAN_SKILL_ID || id == OtherConst.SHENXINGBAIBIAN_SKILL_DINGJI_ID || id == OtherConst.SKILL_ID_RULAISHENZHANG || id == OtherConst.DINGCHANJUE_SKILL_ID || id == OtherConst.YIHUAJIEMU_SKILL_ID || id == OtherConst.MOLINGZHIYUAN_SKILL_ID || id == OtherConst.SIWANGJINWU_SKILL_ID || id == OtherConst.HUANGJINYINZHE_SKILL_ID || id == OtherConst
         .XUANYUANGUPAO_SKILL_ID || id == OtherConst.QUANSHENCHUDONG_SKILL_ID || id == OtherConst.CIYUANYICHU_SKILL_ID || id == OtherConst.KUNSHOUYUCHANG_SKILL_ID || id == OtherConst.SHENJIANZHONG_SKILL_ID || id == OtherConst.HANBINGZHANG_SKILL_ID || id == OtherConst.JIANJI_SKILL_ID || id == OtherConst.QIANLIZHIWAI_SKILL_ID || id == OtherConst.BUSIJINSHEN_SKILL_ID || id == OtherConst.XIDUNIZHUANJIUYIN_SKILL_ID || id == OtherConst.JIANTIFENGYIN_SKILL_ID || id == OtherConst.FOGUANGPUZHAO_SKILL_ID || id == OtherConst.ZIFUDONGTIAN_SKILL_ID || id == OtherConst.TIANYUYANMENG_SKILL_ID || id == OtherConst.HUANGJINGONGCHENGNU_SKILL_ID || id == OtherConst.DIANLAO_SKILL_ID || id == OtherConst.ZHAOFENGYINDIE_SKILL_ID || id == OtherConst.KAITIAN_SKILL_ID || id == OtherConst.TAOHUAHUTI_SKILL_ID || id == OtherConst.KUNXIANSHU_SKILL_ID || id == OtherConst.HUANYINGFENSHEN_SKILL_ID || id == OtherConst.SIWANGXUANYAN_SKILL_ID || id == OtherConst.GUIYINGXIANZHONG_SKILL_ID || id == OtherConst.JUEQINGMIJI_SKILL_ID || id == OtherConst
         .ZIJINQIANKUN_SKILL_ID || id == OtherConst.MEIRENJI_SKILL_ID || id == OtherConst.LINGHUHUANHUA_SKILL_ID || id == OtherConst.JINJIAZHANCHE_SKILL_ID || id == OtherConst.ZHANLONGJUE_SKILL_ID1 || id == OtherConst.ZHANLONGJUE_SKILL_ID2 || id == OtherConst.ZHANLONGJUE_SKILL_ID3 || id == OtherConst.ZHANLONGJUE_SKILL_ID4 || id == OtherConst.GUIZHUA_SKILL_ID4 || id == OtherConst.GUIZHUA_SKILL_ID5 || id == OtherConst.GUIZHUA_SKILL_ID6 || id == OtherConst.GUIZHUA_SKILL_ID7 || id == OtherConst.GUIZHUA_SKILL_ID8)
         {
            if((id == OtherConst.LIUMAISHNEJIAN_SKILL_ID_1 || id == OtherConst.LIUMAISHNEJIAN_SKILL_ID_8) && Boolean(GameState.dictMainStatus[SpecialGoodsID.LIUMAISHENJIAN_GUANCHONGJIAN_ID]))
            {
               return 8 * 1000;
            }
            if((id == OtherConst.LIUMAISHNEJIAN_SKILL_ID_2 || id == OtherConst.LIUMAISHNEJIAN_SKILL_ID_9) && Boolean(GameState.dictMainStatus[SpecialGoodsID.LIUMAISHENJIAN_SHAOCHONGJIAN_ID]))
            {
               return 8 * 1000;
            }
            if((id == OtherConst.LIUMAISHNEJIAN_SKILL_ID_3 || id == OtherConst.LIUMAISHNEJIAN_SKILL_ID_10) && Boolean(GameState.dictMainStatus[SpecialGoodsID.LIUMAISHENJIAN_SHANGYANGJIAN_ID]))
            {
               return 8 * 1000;
            }
            if((id == OtherConst.LIUMAISHNEJIAN_SKILL_ID_4 || id == OtherConst.LIUMAISHNEJIAN_SKILL_ID_11) && Boolean(GameState.dictMainStatus[SpecialGoodsID.LIUMAISHENJIAN_ZHONGCHONGJIAN_ID]))
            {
               return 8 * 1000;
            }
            if((id == OtherConst.LIUMAISHNEJIAN_SKILL_ID_5 || id == OtherConst.LIUMAISHNEJIAN_SKILL_ID_12) && Boolean(GameState.dictMainStatus[SpecialGoodsID.LIUMAISHENJIAN_SHAOZEJIAN_ID]))
            {
               return 8 * 1000;
            }
            if((id == OtherConst.LIUMAISHNEJIAN_SKILL_ID_6 || id == OtherConst.LIUMAISHNEJIAN_SKILL_ID_13) && Boolean(GameState.dictMainStatus[SpecialGoodsID.LIUMAISHENJIAN_SHAOSHANGJIAN_ID]))
            {
               return 8 * 1000;
            }
            if(Boolean(id == OtherConst.LIUMAISHNEJIAN_SKILL_ID_7) && Boolean(GameState.dictMainStatus[SpecialGoodsID.LIUMAISHENJIAN_GUANCHONGJIAN_ID]) && Boolean(GameState.dictMainStatus[SpecialGoodsID.LIUMAISHENJIAN_SHAOCHONGJIAN_ID]) && Boolean(GameState.dictMainStatus[SpecialGoodsID.LIUMAISHENJIAN_SHANGYANGJIAN_ID]) && Boolean(GameState.dictMainStatus[SpecialGoodsID.LIUMAISHENJIAN_ZHONGCHONGJIAN_ID]) && Boolean(GameState.dictMainStatus[SpecialGoodsID.LIUMAISHENJIAN_SHAOZEJIAN_ID]) && Boolean(GameState.dictMainStatus[SpecialGoodsID.LIUMAISHENJIAN_SHAOSHANGJIAN_ID]))
            {
               return 8 * 1000;
            }
            return this.res.public_time;
         }
         return this.res.public_time / (1 + GameInstance.mainCharData.attributeInfo.adx / 1000);
      }
      
      override public function getPublicCoolingtimeClass() : *
      {
         return this.getType() + "_" + this.res.public_type;
      }
      
      public function skillWaste() : int
      {
         return Math.round(10 + this.res.depletion_value * this.level / 10);
      }
      
      public function get tupoInfo() : SkillTuPoInfo
      {
         if(this._tupoInfo == null)
         {
            this._tupoInfo = new SkillTuPoInfo();
         }
         return this._tupoInfo;
      }
   }
}

