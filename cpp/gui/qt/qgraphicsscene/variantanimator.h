#ifndef VARIANTANIMATOR_H
#define VARIANTANIMATOR_H
#include <QVariantAnimation>

// Allmost generic variant animator
class variantAnimator : public QVariantAnimation
{
    Q_OBJECT
public:
    variantAnimator(){};

     virtual ~variantAnimator(){};

     void updateCurrentValue(const QVariant &value){
         emit valueChanged(value);
     }
};

#endif // VARIANTANIMATOR_H


