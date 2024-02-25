import 'dart:math';

enum QuestionNature { positive, negative }

class QuestionData {
  String questionText;
  String questionImagePath;
  Function yesAction;
  Function noAction;
  QuestionNature nature;

  QuestionData({
    required this.questionText,
    required this.questionImagePath,
    required this.yesAction,
    required this.noAction,
    required this.nature,
  });
}

class QuestionManager {
  static final Random _random = Random();

  static List<QuestionData> questions = [
    QuestionData(
      questionText:
          "Don't use disposable Plastic as its harmful for over planet",
      questionImagePath:
          "https://remmed.com/wp-content/uploads/2022/12/laboratory-supplies-plastic_-845x684.jpg",
      yesAction: () {},
      noAction: () {},
      nature: QuestionNature.positive,
    ),
    QuestionData(
      questionText:
          "Will you commit to reducing your carbon footprint by using public transportation or carpooling?",
      questionImagePath:
          "https://www.intelligenttransport.com/wp-content/uploads/Public-transport-7.jpg",
      yesAction: () {},
      noAction: () {},
      nature: QuestionNature.positive,
    ),
    QuestionData(
      questionText:
          "Will you participate in tree-planting initiatives to combat deforestation?",
      questionImagePath:
          "https://i.tribune.com.pk/media/images/tree-plantation-drive-aug-9-photo-radio-pak1596969323-0/tree-plantation-drive-aug-9-photo-radio-pak1596969323-0.jpg",
      yesAction: () {},
      noAction: () {},
      nature: QuestionNature.positive,
    ),
    QuestionData(
      questionText:
          "Will you advocate for stricter regulations on industrial pollution?",
      questionImagePath:
          "https://www.conserve-energy-future.com/wp-content/uploads/2013/06/Pollution_From_Industries.jpg",
      yesAction: () {},
      noAction: () {},
      nature: QuestionNature.positive,
    ),
    QuestionData(
      questionText:
          "The local community is organizing a tree-planting event in the neighborhood park this weekend. Would you like to join and contribute to the greenery?",
      questionImagePath:
          "https://i.tribune.com.pk/media/images/tree-plantation-drive-aug-9-photo-radio-pak1596969323-0/tree-plantation-drive-aug-9-photo-radio-pak1596969323-0.jpg",
      yesAction: () {},
      noAction: () {},
      nature: QuestionNature.positive,
    ),

    QuestionData(
      questionText:
          "Your city is implementing a ban on single-use plastics, and they are looking for volunteers to spread awareness and enforce the ban. Will you participate in the campaign?",
      questionImagePath:
          "https://www.undp.org/sites/g/files/zskgke326/files/migration/ba/file.png",
      yesAction: () {},
      noAction: () {},
      nature: QuestionNature.positive,
    ),
    QuestionData(
      questionText:
          "The local government is hosting a river cleanup initiative to restore the health of the waterway and preserve aquatic ecosystems. Will you volunteer to help clean up the riverbanks?",
      questionImagePath:
          "https://static.toiimg.com/thumb/imgsize-23456,msid-71148784,width-600,resizemode-4/71148784.jpg",
      yesAction: () {},
      noAction: () {},
      nature: QuestionNature.positive,
    ),
    QuestionData(
      questionText:
          "Your school is organizing a sustainability fair to educate students about eco-friendly practices and green technologies. Will you participate in organizing the event or showcasing sustainable initiatives?",
      questionImagePath:
          "https://blog.hope-education.co.uk/wp-content/uploads/2021/04/Header-going-green-in-the-classroom.jpg",
      yesAction: () {},
      noAction: () {},
      nature: QuestionNature.positive,
    ),
    QuestionData(
      questionText:
          "Your workplace is launching a recycling program to reduce waste and promote eco-friendly practices in the office. Will you support the initiative and encourage your colleagues to participate?",
      questionImagePath:
          "https://i.pinimg.com/550x/68/94/66/689466ded572424036a6b5c97e9b07c5.jpg",
      yesAction: () {},
      noAction: () {},
      nature: QuestionNature.positive,
    ),
    QuestionData(
      questionText:
          "Your neighborhood association is organizing a composting workshop to teach residents how to reduce food waste and create nutrient-rich soil. Would you like to attend and start composting at home?",
      questionImagePath:
          "https://foodtank.com/wp-content/uploads/2019/02/Food_Tank_Reduce_Food_Waste.jpg",
      yesAction: () {},
      noAction: () {},
      nature: QuestionNature.positive,
    ),
    QuestionData(
      questionText:
          "An environmental advocacy group is organizing a petition drive to urge policymakers to take action on climate change. Will you sign the petition and help raise awareness about the urgency of the issue?",
      questionImagePath:
          "https://assets.change.org/photos/9/by/lz/lybyLzwDTpOQLDH-1600x900-noPad.jpg",
      yesAction: () {},
      noAction: () {},
      nature: QuestionNature.positive,
    ),
    QuestionData(
      questionText:
          "Your local library is hosting a documentary screening on environmental issues and solutions. Will you attend the screening to learn more about pressing environmental challenges and potential solutions?",
      questionImagePath:
          "https://pub.mdpi-res.com/water/water-13-02746/article_deploy/html/images/water-13-02746-ag-550.jpg",
      yesAction: () {},
      noAction: () {},
      nature: QuestionNature.positive,
    ),
    QuestionData(
      questionText:
          "A conservation organization is offering volunteer opportunities to monitor and protect nesting sites for endangered sea turtles. Would you be interested in volunteering to help safeguard sea turtle populations?",
      questionImagePath:
          "https://image.volunteerworld.com/04b3960241598f800792d9996873682b6e2e0811/Portfolio-Greece-Turtles.jpg",
      yesAction: () {},
      noAction: () {},
      nature: QuestionNature.positive,
    ),
    QuestionData(
      questionText:
          "Your neighbors are planning to cut down a large number of trees in their backyard to expand their property. Would you support their decision to remove the trees?",
      questionImagePath:
          "https://static.india.com/wp-content/uploads/2023/07/man-cut-down-neighbours-trees.jpg",
      yesAction: () {},
      noAction: () {},
      nature: QuestionNature.negative,
    ),
    QuestionData(
      questionText:
          "A company is proposing to build a new factory near a pristine river ecosystem, which could potentially lead to pollution and harm aquatic life. Would you endorse the construction of the factory?",
      questionImagePath:
          "https://images.squarespace-cdn.com/content/583ca2f2d482e9bbbef7dad9/1485215162491-TWJPIAMJOV53S16W3YD8/Cleaning_Up_Pollution.jpg",
      yesAction: () {},
      noAction: () {},
      nature: QuestionNature.negative,
    ),
    QuestionData(
      questionText:
          "Your city council is considering a proposal to remove funding for public parks and green spaces to allocate resources to other projects. Would you support the reduction in funding for parks?",
      questionImagePath:
          "https://guelph.ca/wp-content/uploads/Rickson_Park_tent_webheader.jpg",
      yesAction: () {},
      noAction: () {},
      nature: QuestionNature.negative,
    ),
    QuestionData(
      questionText:
          "A corporation is promoting a new line of disposable plastic products despite the known environmental harm caused by single-use plastics. Would you purchase and use these disposable plastic items?",
      questionImagePath:
          "https://www.mdpi.com/ijerph/ijerph-19-08273/article_deploy/html/images/ijerph-19-08273-g0A7.png",
      yesAction: () {},
      noAction: () {},
      nature: QuestionNature.negative,
    ),
    QuestionData(
      questionText:
          "A developer is planning to construct a luxury resort in a protected wilderness area, which would involve clearing large swathes of forest and displacing wildlife. Would you approve of the resort development?",
      questionImagePath:
          "https://cdn.mos.cms.futurecdn.net/xdZNF9AyWwtVKini34Kpok-415-80.jpg",
      yesAction: () {},
      noAction: () {},
      nature: QuestionNature.negative,
    ),
    QuestionData(
      questionText:
          "Your community is organizing a fireworks display for a celebration, but it will involve launching fireworks near a sensitive bird nesting area, potentially disturbing the birds. Would you attend the fireworks display?",
      questionImagePath:
          "https://www.trafalgar.com/real-word/wp-content/uploads/sites/3/2021/10/fireworks-display-nye.jpeg",
      yesAction: () {},
      noAction: () {},
      nature: QuestionNature.negative,
    ),
    QuestionData(
      questionText:
          "A restaurant chain is offering free plastic utensils with every takeout order, contributing to plastic pollution and environmental degradation. Would you accept the free plastic utensils with your takeout order?",
      questionImagePath:
          "https://p.potaufeu.asahi.com/965a-p/picture/26327670/06b1157853f86c73b4fdc64c83be975f.jpg",
      yesAction: () {},
      noAction: () {},
      nature: QuestionNature.negative,
    ),

    QuestionData(
      questionText:
          "A developer is planning to build a housing complex on the last remaining green space in your neighborhood, which serves as a habitat for wildlife and provides recreational opportunities for residents. Would you support the construction of the housing complex?",
      questionImagePath:
          "https://blog.savills.com/_images/hayes-village-wallis-garden.jpg",
      yesAction: () {},
      noAction: () {},
      nature: QuestionNature.negative,
    ),
    QuestionData(
      questionText:
          "A local business is planning to host a promotional event with giveaways of single-use plastic items, such as balloons and straws, contributing to plastic waste. Would you attend the promotional event and accept the giveaways?",
      questionImagePath:
          "https://p.potaufeu.asahi.com/965a-p/picture/26327670/06b1157853f86c73b4fdc64c83be975f.jpg",
      yesAction: () {},
      noAction: () {},
      nature: QuestionNature.negative,
    ),
    QuestionData(
      questionText:
          "Your school is considering replacing the outdoor green spaces with paved parking lots to accommodate more vehicles. Would you agree with the decision to prioritize parking over green spaces?",
      questionImagePath:
          "https://www.mdpi.com/atmosphere/atmosphere-12-00994/article_deploy/html/images/atmosphere-12-00994-g002-550.jpg",
      yesAction: () {},
      noAction: () {},
      nature: QuestionNature.negative,
    ),
    QuestionData(
      questionText:
          "A fishing tournament is being organized in a sensitive marine conservation area, which could disrupt marine ecosystems and harm marine life. Would you participate in the fishing tournament?",
      questionImagePath:
          "https://content.osgnetworks.tv/infisherman/content/photos/Bass-Tournament-Trends-Today.jpg",
      yesAction: () {},
      noAction: () {},
      nature: QuestionNature.negative,
    ),
    QuestionData(
      questionText:
          "A developer is proposing to clear a large forested area to build a new shopping mall, which would result in habitat loss for wildlife and increased carbon emissions. Would you support the construction of the shopping mall?",
      questionImagePath:
          "https://greenspired.eu/wp-content/uploads/2022/08/how-to-design-a-large-square.jpg",
      yesAction: () {},
      noAction: () {},
      nature: QuestionNature.negative,
    ),

    QuestionData(
      questionText:
          "A company is planning to construct a pipeline through a pristine wilderness area, posing risks of oil spills and habitat destruction. Would you endorse the construction of the pipeline?",
      questionImagePath:
          "https://earthworks.org/wp-content/uploads/2021/09/IMG_1504-scaled.jpg",
      yesAction: () {},
      noAction: () {},
      nature: QuestionNature.negative,
    ),
    QuestionData(
      questionText:
          "A local supermarket is offering discounts on products packaged in single-use plastic containers, encouraging consumers to purchase items with excessive packaging. Would you take advantage of the discounts and buy the plastic-packaged products?",
      questionImagePath:
          "https://foodinsight.org/wp-content/uploads/2019/07/single-use-plastics-2.png",
      yesAction: () {},
      noAction: () {},
      nature: QuestionNature.negative,
    ),
    QuestionData(
      questionText:
          "A construction project is underway to build a new highway through a national park, fragmenting habitats and disrupting wildlife corridors. Would you support the construction of the highway?",
      questionImagePath:
          "https://upload.wikimedia.org/wikipedia/commons/d/de/Bear_underpass_%C3%A9coducOurs.jpg",
      yesAction: () {},
      noAction: () {},
      nature: QuestionNature.negative,
    ),

    // Add more questions as needed
  ];

  static QuestionData getRandomQuestion() {
    return questions[_random.nextInt(questions.length)];
  }
}
