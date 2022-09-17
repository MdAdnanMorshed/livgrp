import 'package:flutter/material.dart';
class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    String aboutInfo='''
Company Introduction:

LIVA Group of Companies came into Existence In early 2000 only dealing in Construction and Electrical equipment But Later in 2003 Started their operations in Lightning protection systems by manufacturing lightning rods and Grounding systems. Factory located in Izmir Industrial state spread over a huge space of 3000 square meters. LIVA Group of companies came into existence from the year 2003 being a Major exporter of lightning Protection Systems and Lightning rods.

BAŞLICA İŞ ÜRÜNLERİ

 Paratoner, Kristal paratoner, Termo kaynak tozu, Yıldırım sayacı, Topraklama kelepçeleri, Topraklama direnci test kelepçeleri, İletken sabitleme ekipmanları, Franklin Catch Ekipmanları ve Canlı güvenlik ve Elektrik sistemleri üreten LİVA Şirketler Grubu Lider Türk Şirketi.  Yıldırımdan korunma sisteminin yanı sıra Şirketimiz, Kablolu / Kablosuz Hırsız alarm sistemleri, Çevre Güvenlik sistemleri, Kamera sistemleri, görüntülü interkom sistemi, Yangın alarm sistemi, Gaz Algılama sistemleri, Kapı Otomasyon sistemleri ve Telefon dahil olmak üzere çok çeşitli Canlı Güvenlik Alarm sistemleri ile ilgilenmektedir.  kayıt sistemleri.

AWARDS AND CERTIFICATIONS
LIVA Group being an ISO Certified company has been following all the Rules and Regulations as per Internationals Laws. LIVA  PLUS group has several other certification other than ISO 9001 And 14001 Such As CE Certificate for European markets and GOST Certification for Russian markets. LIVA Group is also proud and privileged to be among the very few companies in Turkey which are Authorized and licensed agent of (TEAE) Turkey Atomic Energy Agency This Agency Works under Direct supervision with the Turkish Government and on Orders of the Prime minister for the peaceful utilization of Atomic Energy.

WHY CHOOSE LIVAGRUP:

Main Concern of Our Company is to Provide Safe and Peaceful lifestyle to Consumers and Individuals around the world by providing them with Latest light protection and Security system so People can secure their friends and family from any Threat. LIVA Group of Companies Goal is based upon Continuous Improvement and Innovation.

Kemal ReisCad.No:19/1Gaziemir,Izmir,Turkey
Mobile : 90-50670038-9**
          ''';

    return  SafeArea(child: Scaffold(
      appBar:  AppBar(title: const Text('About Us'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(aboutInfo,style: TextStyle(fontSize: 14),),
        ),
      ),
    ));
  }
}
